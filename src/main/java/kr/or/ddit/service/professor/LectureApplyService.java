package kr.or.ddit.service.professor;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.UserVO;

public interface LectureApplyService {
	/**결재 데이터 생성 -> 강의계획신청데이터생성*/
	int createLectureApplyApproval(LectureApplyVO lectureApplyVO);

	List<UserVO> getEmployee();

	List<LectureApplyVO> standbyLectureApplyList(String proCd);

	List<LectureVO> approveLectureApplyList(String proCd);

	List<LectureApplyVO> returnLectureApplyList(String proCd);

	LectureApplyVO proLectureApplyDetail(Map<String, Object> map);

	List<LectureApplyVO> renderLectureApply(ApprovalVO approvalVO);

	

}
