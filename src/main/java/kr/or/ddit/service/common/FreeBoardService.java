package kr.or.ddit.service.common;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Criteria;

public interface FreeBoardService {

	// 자유게시판 목록
	public List<BoardVO> list(Criteria cri);

	// 자유게시판 상세
	public BoardVO detail(String bdCd);

	// 자유게시판 등록
	public int create(BoardVO boardVO);
	
	// 자유게시판 삭제
	public int delete(Map<String, String> map);
	
	// 자유게시판 수정
	public int update(BoardVO boardVO);

	// 조회수 카운트
	public int count(String bdCd);

	public List<BoardVO> getList(Criteria cri);

	public int getTotal(Criteria cri);

	
	
	


}
