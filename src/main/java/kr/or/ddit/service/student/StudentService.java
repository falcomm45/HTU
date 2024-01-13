package kr.or.ddit.service.student;

import java.util.List;

import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.StudentVO;

public interface StudentService {

	public StudentVO getStudent(String userCd);

	public List<OrganizationChartVO> chartList();

	public String sideStatus(String userCd);


}
