package kr.or.ddit.service.common;

import kr.or.ddit.vo.CommentVO;

public interface CommentService {

	public String insert(CommentVO commentVO);

	public int delete(String cmtCd);

	public CommentVO getCommentByCmtCd(String cmtCd);

}
