package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.StudentVO;

public interface StudentMapper {

	public StudentVO getStudent(String userCd);

	public StudentVO getCredit(String userCd);

	public List<OrganizationChartVO> chartList();

	public StudentVO getStudentDetails(String stuCd);

	public String sideStatus(String userCd);
}
