package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.RecordVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;

public interface StuAdminMapper {

	public List<StudentVO> stuinfolist();

	public StudentVO stuinfodetail(String stuCd);

	public List<OrganizationChartVO> chartList();

	public List<StudentVO> coldetail(String organizationCode);

	public List<StudentVO> deptdetail(String organizationCode);

	public List<DepartmentVO> deptList();

	public int updateuser(UserVO userVO);

	public int updatestu(StudentVO studentVO);

	public int usedupdate(String userCd);

	public int cntDepStu(Map<String, String> paramMap);

	public int insertUserList(List<UserVO> userList);

	public int insertStudentList(List<StudentVO> studentList);

	public int insertUser(UserVO userVO);
	
	public int insertStudent(StudentVO studentVO);

	public List<RecordVO> recordAdminList();

	public int recordUpdate(RecordVO recordVO);

	public int stuStatusUpdate(RecordVO recordVO);

}
