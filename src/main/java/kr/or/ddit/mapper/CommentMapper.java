package kr.or.ddit.mapper;

import java.util.Map;

import kr.or.ddit.vo.CommentVO;

public interface CommentMapper {

	public int insert(CommentVO commentVO);

	public int serchAnomyComment(Map<String, Object> paramMap);

	public int getAnonyNumber(String bdCd);

	public int delete(String cmtCd);

	public CommentVO getCommentByCmtCd(String cmtCd);

}
