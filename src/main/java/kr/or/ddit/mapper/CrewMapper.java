package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.CrewActivityVO;
import kr.or.ddit.vo.CrewPersonnelVO;
import kr.or.ddit.vo.CrewVO;

public interface CrewMapper {

	//동아리 조회
	public List<CrewVO> crewList(Map<String, Object> map);

	//나의 동아리
	public List<CrewVO> myCrew(String stuCd);

	//동아리 개설 신청
	public int crewApply(CrewVO crewVO);

	//동아리 상세
	public CrewVO crewDetail(String crCd);

	//동아리 가입 여부 확인
	public CrewPersonnelVO crewJoinCheck(@Param(value = "crCd") String crCd, @Param(value = "userCd") String userCd);

	//동아리원 조회
	public List<CrewVO> crewPersonnel(String crCd);

	//동아리 활동 내역 조회
	public List<CrewActivityVO> activityList(String crCd);

	//가입 신청 여부(중복 신청 방지)
	public CrewVO joinAppCheck(@Param(value = "stuCd") String stuCd, @Param(value = "crCd") String crCd);

	//동아리 가입 승인
	public int crewJoinApp(CrewPersonnelVO crewPersonnelVO);

	//동아리 수정
	public int crewUpdate(CrewVO crewVO);

	//동아리 탈퇴
	public int crewQuit(@Param(value = "stuCd") String stuCd, @Param(value = "crCd") String crCd);

	//동아리 개설 신청 내역 조회
	public List<CrewVO> myAppList(String userCd);
	
	//동아리 가입 신청 내역 조회
	public List<CrewVO> myJoinAppList(String userCd);
	
	//동아리 활동 등록
	public int addCrewActivity(CrewActivityVO crewActivityVO);

//	public int crewApproval(ApprovalVO appVO);
	
	//동아리 개설 승인 상태 변경
	public int crewUpdateYn(String appCd);

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

	//동아리 개설 반려 사유
//	public ApprovalVO appRetReason(String appCd);

	//동아리 개설 신청서 조회
	public CrewVO crewAppForm(String crCd);

	//동아리 활동 상세
	public CrewActivityVO crewActivityDetail(String craCd);



}
