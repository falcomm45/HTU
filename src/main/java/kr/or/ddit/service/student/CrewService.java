package kr.or.ddit.service.student;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.CrewActivityVO;
import kr.or.ddit.vo.CrewPersonnelVO;
import kr.or.ddit.vo.CrewVO;
import kr.or.ddit.vo.FilesDetailVO;

public interface CrewService {

	//동아리 조회
	public List<CrewVO> crewList(Map<String, Object> map);

	//나의 동아리
	public List<CrewVO> myCrew(String stuCd);

	//동아리 개설 신청
	public int crewApply(CrewVO crewVO);

	//동아리 상세
	public CrewVO crewDetail(String crCd);

	//동아리 가입 여부 확인
	public CrewPersonnelVO crewJoinCheck(String crCd, String userCd);
	
	//동아리원 조회
	public List<CrewVO> crewPersonnel(String crCd);

	//동아리 활동 내역 조회
	public List<CrewActivityVO> activityList(String crCd);

	//가입 신청 여부(중복 신청 방지)
	public CrewVO joinAppCheck(String stuCd, String crCd);
	
	//동아리 가입 승인
	public int crewJoinApp(CrewPersonnelVO crewPersonnelVO);

	//동아리 수정
	public int crewUpdate(CrewVO crewVO);

	//동아리 수정 중 파일 삭제
	public int deleteFileUpdate(FilesDetailVO filesDetailVO);

	//동아리 탈퇴
	public int crewQuit(String stuCd, String crCd);

	//동아리 개설 신청 내역 조회
	public List<CrewVO> myAppList(String userCd);

	//동아리 가입 신청 내역 조회
	public List<CrewVO> myJoinAppList(String userCd);

	//동아리 활동 등록
	public int addCrewActivity(CrewActivityVO crewActivityVO);

//	public ApprovalVO appRetReason(String appCd);

	//동아리 활동 상세
	public CrewActivityVO crewActivityDetail(String craCd);



}
