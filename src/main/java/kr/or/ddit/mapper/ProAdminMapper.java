package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.ProfessorVO;
import kr.or.ddit.vo.UserVO;

public interface ProAdminMapper {

	public List<ProfessorVO> proinfolist();

	public ProfessorVO proinfodetail(String proCd);

	public List<OrganizationChartVO> chartList();

	public List<ProfessorVO> coldetail(String organizationCode);

	public List<ProfessorVO> deptdetail(String organizationCode);

	public List<DepartmentVO> deptList();

	public int updateuser(UserVO userVO);

	public int updatepro(ProfessorVO ProfessorVO);

	public int usedupdate(String userCd);

//	public int cntDepStu(Map<String, String> paramMap);
//
//	public int insertUserList(List<UserVO> userList);
//
//	public int insertStudentList(List<ProfessorVO> studentList);
//
//	public int insertUser(UserVO userVO);
//	
//	public int insertStudent(ProfessorVO ProfessorVO);

}
