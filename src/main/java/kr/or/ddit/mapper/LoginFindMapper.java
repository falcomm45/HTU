package kr.or.ddit.mapper;

import java.util.Map;

import kr.or.ddit.vo.UserVO;

public interface LoginFindMapper {

	public UserVO findId(Map<String, String> map);

	public UserVO findPw(Map<String, String> map);

	public int modPassword(UserVO userVO);

}
