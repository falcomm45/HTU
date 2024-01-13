package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.UserVO;

public interface UserMapper {

	public List<UserVO> userList();
	
	public String getAuthority(String userCd);

	public UserVO getStudentInfo(String userCd);

	public UserVO getProfessorInfo(String userCd);

	public UserVO getEmployeeInfo(String userCd);

	public String getUserNameByUserCd(String userCd);

	public List<UserVO> getStudentList();

	public List<UserVO> getProfessorList();

}
