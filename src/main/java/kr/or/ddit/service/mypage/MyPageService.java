package kr.or.ddit.service.mypage;

import java.util.List;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Criteria;
import kr.or.ddit.vo.UserVO;

public interface MyPageService {
	
	public UserVO profile(String userCd);

	public UserVO profileEdit(String userCd);

	public int profileEditPost(UserVO userVO);
	
	public void changeAuthentication(String userCd);

	public int passEditPost(UserVO userVO);

	public List<BoardVO> getMyBoardList(Criteria cri);

	public int getMyBoardTotal(Criteria cri);

}
