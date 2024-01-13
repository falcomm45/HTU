package kr.or.ddit.service.common.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.AnonymousBoardMapper;
import kr.or.ddit.mapper.CommentMapper;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.service.common.CommentService;
import kr.or.ddit.vo.CommentVO;
import kr.or.ddit.vo.NotificationVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class CommentServiceImpl implements CommentService{
	
	private final CommentMapper commentMapper;
	
	private final NotificationMapper notificationMapper;
	
	private final AnonymousBoardMapper anonyMapper;
	
	@Transactional
	@Override
	public String insert(CommentVO commentVO) {
		
		// 익명게시판일떄
		if (commentVO.getBdCd().substring(0,6).equals("BORD03")) {
			Map<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("bdCd", commentVO.getBdCd());
			paramMap.put("userCd", commentVO.getUserCd());
			
			// 작성자의 익명댓글 작성여부 확인
			int cnt = this.commentMapper.serchAnomyComment(paramMap);
			
			// 해당 게시글의 작성이 처음일 경우
			if (cnt == 0) {
				// 가장 높은 점수 부여
				int result = this.commentMapper.getAnonyNumber(commentVO.getBdCd());
				commentVO.setCmtAnony(result);
			} else {
				commentVO.setCmtAnony(cnt);
			}
//			commentVO.setCmtPcd("asdf");
		}
		
		log.info("commentVO ==> {}", commentVO);
		
		int cnt = this.commentMapper.insert(commentVO);
		String comdCd = "ALAM04";
		if (commentVO.getCmtPcd() != null) comdCd = "ALAM05";
		String url = "/common/board/";
		if (commentVO.getBdCd().substring(0,6).equals("BORD01")) url += "free/detail?bdCd="+commentVO.getBdCd() + "&cmtCd="+commentVO.getCmtCd();
		else if (commentVO.getBdCd().substring(0,6).equals("BORD02")) url += "publicize/detail?bdCd="+commentVO.getBdCd() + "&cmtCd="+commentVO.getCmtCd();
		else url += "anonymous/detail?bdCd="+commentVO.getBdCd() + "&cmtCd="+commentVO.getCmtCd();
		
		String writer = this.anonyMapper.getWriterByBdCd(commentVO.getBdCd());
		
		NotificationVO ntfVO = new NotificationVO(comdCd, writer, url);
		cnt += this.notificationMapper.insert(ntfVO);
		
		if (cnt > 1) {
			return writer;
		} else {
			return null;
		}
	}

	@Override
	public int delete(String cmtCd) {
		return this.commentMapper.delete(cmtCd);
	}

	@Override
	public CommentVO getCommentByCmtCd(String cmtCd) {
		return this.commentMapper.getCommentByCmtCd(cmtCd);
	}
	
	
	
}
