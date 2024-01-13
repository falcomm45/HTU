package kr.or.ddit.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.mapper.EnrolmentMapper;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.NotificationVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@RequestMapping("/echo")
@RequiredArgsConstructor
@Slf4j
public class EchoHandler extends TextWebSocketHandler {

	private final NotificationMapper notificationMapper;

	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	private final EnrolmentMapper enrolMapper;
	
	private final EtcUtil etcUtil;

	// 연결 성공 시 실행되는 메소드, 클라이언트가 웹소켓 생성
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		log.info("Socket 연결, 사용자 id = {}", session.getPrincipal().getName());
		
		sessions.add(session);
		
		log.info("연결된 사용자 목록 ==> {}", sessions);
	}

	// JS 에서 메세지를 받았을 때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// 접속한 사용자
		String userCd = session.getPrincipal().getName();

		// 알람수신대상
		String receiver = message.getPayload();
		
		log.info("receiver ==> {}", receiver);
		
		if (receiver.startsWith("lecCd=")) {
			
			sendLectureCnt(receiver);
			
		} else {
			if (receiver.equals("로그인사용자")) {
				getNotificationAndSendClient(userCd);
			} else {
				log.info("수신인 ==> {}", receiver);
				getNotificationAndSendClient(receiver);
			}
		}
		
		
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		log.info("Socket 종료, 사용자 id = {}", session.getPrincipal().getName());
		sessions.remove(session);

	}
	
	private void sendLectureCnt(String receiver) throws IOException {
		String lecCd = receiver.split("=")[1];
		LectureVO lectureVO = this.enrolMapper.getEnrolment(lecCd);
		
		String jsonLectureVO = this.etcUtil.getJsonList(lectureVO);
		
		for (WebSocketSession single : sessions) {
			log.info(single.getPrincipal().getName());
			single.sendMessage(new TextMessage(jsonLectureVO));
		}
		
	}

	private void getNotificationAndSendClient(String userCd) throws IOException {
		
		// 소켓에 연결된 사용자 검색
		for (WebSocketSession single : sessions) {
				
			String usedUserCd = single.getPrincipal().getName();
				
			// 접속한 사용자에게 알람 보내기
			if (usedUserCd.equals(userCd)) {
				
				List<NotificationVO> ntfList = this.notificationMapper.getSimpleNotificationsByUserCd(userCd);

				ObjectMapper objectMapper = new ObjectMapper();
				
				TextMessage sendMsg = new TextMessage(objectMapper.writeValueAsString(ntfList));
				single.sendMessage(sendMsg);
			}

		}
	}

}
