package kr.or.ddit.util;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.mapper.EnrolmentMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@RequestMapping("/enrol")
@RequiredArgsConstructor
@Slf4j
public class EnrolmentNotificationUtil extends TextWebSocketHandler {

	private List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	
	private EnrolmentMapper enrolmentMapper;

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log.info("Socket 연결, 사용자 id = {}", session.getPrincipal().getName());

		sessions.add(session);

		log.info("연결된 사용자 목록 ==> {}", sessions);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String lecCd = message.getPayload();
		int cnt = this.enrolmentMapper.getEnrolmentCnt(lecCd);
		
		for (WebSocketSession single : sessions) {
			TextMessage sendMsg = new TextMessage(String.valueOf(cnt));
			single.sendMessage(sendMsg);
		}
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		log.info("Socket 종료, 사용자 id = {}", session.getPrincipal().getName());
		sessions.remove(session);
	}

}
