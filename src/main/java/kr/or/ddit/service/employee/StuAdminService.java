package kr.or.ddit.service.employee;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.RecordVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;

public interface StuAdminService {

	public List<StudentVO> stuinfolist();

	public StudentVO stuinfodetail(String stuCd);

	public List<OrganizationChartVO> chartList();

	public List<StudentVO> coldetail(String organizationCode);

	public List<StudentVO> deptdetail(String organizationCode);

	public int update(UserVO userVO);

	public List<DepartmentVO> deptList();

	public int upload(UserVO userVO);

	public StudentVO excelUpload(MultipartFile file);

	public int registStudent(Map<String, Object> paramMap);

	public List<RecordVO> recordAdminList();

	public int recordUpdate(RecordVO recordVO);

	public int stuStatusUpdate(RecordVO recordVO);


}
