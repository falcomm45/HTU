package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CommentVO;
import kr.or.ddit.vo.Criteria;
import kr.or.ddit.vo.NoticeBoardVO;

public interface PublicizeBoardMapper {

	// 자유게시판 목록
	public List<BoardVO> list(Criteria cri);

	// 자유게시판 등록
	public int create(BoardVO boardVO);

	// 자유게시판 상세
	public BoardVO detail(String bdCd);

	// 자유게시판 삭제
	public int delete(Map<String, String> map);

	// 자유게시판 수정
	public int update(BoardVO boardVO);

	// 조회수 카운트
	public int count(BoardVO boardVO);

	// 댓글
	public List<CommentVO> getCommentList(String bdCd);

	// 페이징처리
	public List<BoardVO> getListWithPaging(Criteria cri);
	
	// 검색
	public int getTotalCount(Criteria cri);

	public List<BoardVO> myBoardList(String userCd);

}
