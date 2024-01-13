package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Criteria;
import kr.or.ddit.vo.PostReportVO;
import kr.or.ddit.vo.UserVO;

public interface MyPageMapper {

	public UserVO profile(String userCd);

	// 내 정보 상세(수정할 수 있는 화면)
	public UserVO profileEdit(String userCd);
	
	// 내 정보 수정 실행
	public int profileEditPost(UserVO userVO);

	// 비밀번호 변경 
	public int passEditPost(UserVO userVO);

	// 비밀번호 인코딩
	public UserVO getEncodedPassword(String userCd);

	// 내가 쓴 게시글 목록
	public List<BoardVO> myBoardList(String userCd);
	
	// 내가 쓴 게시글 페이징 처리
	public List<BoardVO> getMyBoardWithPaging(Criteria cri);

	// 내가 쓴 게시글 검색
	public int getMyBoardTotalCount(Criteria cri);
	
	// 내 신고 목록 조회
	public List<PostReportVO> myReportList(String userCd);

}
