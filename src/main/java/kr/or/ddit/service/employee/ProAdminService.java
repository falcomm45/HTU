package kr.or.ddit.service.employee;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.ProfessorVO;
import kr.or.ddit.vo.UserVO;

public interface ProAdminService {

	public List<ProfessorVO> proinfolist();

	public ProfessorVO proinfodetail(String proCd);

	public List<OrganizationChartVO> chartList();

	public List<ProfessorVO> coldetail(String organizationCode);

	public List<ProfessorVO> deptdetail(String organizationCode);

	public int update(UserVO userVO);

	public List<DepartmentVO> deptList();

	public int upload(UserVO userVO);

//	public ProfessorVO excelUpload(MultipartFile file);
//
//	public int registStudent(Map<String, Object> paramMap);


}
