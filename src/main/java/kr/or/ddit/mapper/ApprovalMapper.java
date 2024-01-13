package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.CrewVO;
import kr.or.ddit.vo.DormitoryVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.PostReportVO;
import kr.or.ddit.vo.ScholarshipRecommendVO;

public interface ApprovalMapper {

	public int insert(ApprovalVO appVO);
	
	// 강의계획결재리스트
	public List<LectureApplyVO> getLectureApplyList(Map<String, Object> map);

	// 동아리개설결재리스트
	public List<ApprovalVO> crewAppList(String appTarget);
	
	// 동아리가입결재리스트
	public List<ApprovalVO> crewJoinList(String crCd);

	public int updateApprovalYn(ApprovalVO appVO);

	public int updateApprovalYnAndComdCd(DormitoryVO dormitoryVO);

	public int getTotal(Map<String, Object> map);
	
	// 신고결재리스트
	public List<PostReportVO> getPostReportList(Map<String, Object> map);

	//기숙사 신청리스트
	public List<DormitoryVO> getDormitoryList(Map<String, Object> map);

	public List<ApprovalVO> newCrewAppList(String appTarget);

	public List<LectureApplyVO> getLectureApplyVOStandbyList(Map<String, Object> map);

	//장학추천인리스트
	public List<ScholarshipRecommendVO> getRecommendList(Map<String, Object> map);
	
	



}
