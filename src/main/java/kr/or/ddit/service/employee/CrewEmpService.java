package kr.or.ddit.service.employee;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CrewPersonnelVO;
import kr.or.ddit.vo.CrewVO;

public interface CrewEmpService {

	//동아리 개설 승인 상태 변경
	public int crewUpdateYn(String appCd);

	//동아리 회장 등록
	public int crewJoinApp(CrewPersonnelVO crewPersonnelVO);

	//동아리 조회 (학사 관리자)
	public List<CrewVO> crewListEmp(Map<String, Object> map);
	
	//총 동아리 수
	public int crewTotal();
	
	//운영 동아리 수
	public int actCrewTotal();
	
	//동아리 상세 (학사 관리자)
	public CrewVO crewDetailEmp(String crCd);

	//동아리 폐쇄
	public int deleteCrew(String crCd);

	//동아리원 삭제
	public int deleteCrewPerson(String crCd);

	//동아리 개설 신청서 조회
	public CrewVO crewAppForm(String crCd);


}
