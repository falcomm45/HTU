package kr.or.ddit.service.employee;

import java.util.List;

import kr.or.ddit.vo.SchlshipVO;
import kr.or.ddit.vo.StudentVO;

public interface SchlshipService {

	//장학금 수여 대상 학생 목록
	public List<StudentVO> awardSchlship();
	
	//장학금 정보
	public SchlshipVO scVO(String stuCd);

	//장학금 수여
	public int award(SchlshipVO schlshipVO);

	//장학생 조회
	public List<SchlshipVO> schlshipList();

	//장학생 정보
	public StudentVO stuVO(String stuCd);

	//장학생 조회 - 연도 선택
	public List<SchlshipVO> searchYear(String sclYear);

	//장학생 조회 - 학기 선택
	public List<SchlshipVO> searchSem(String sclYear, String sclSem);

}
