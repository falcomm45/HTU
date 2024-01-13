package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.LectureScheduleVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.UserVO;

public interface LectureApplyMapper {

	int createLectureApplyApproval(ApprovalVO approvalVO);

	int createLectureApply(LectureApplyVO lectureApplyVO);

	int updateLectureApplyConCd(LectureApplyVO lectureApplyVO);

	LectureApplyVO lecaApplyDetail(String lecaCd);

	LectureApplyVO getLectureApply(String appCd);

	List<UserVO> getEmployee();

	List<LectureApplyVO> standbyLectureApplyList(String proCd);

	List<LectureVO> approveLectureApplyList(String proCd);

	List<LectureApplyVO> returnLectureApplyList(String proCd);

	LectureApplyVO proLectureApplyDetail(Map<String, Object> map);

	List<LectureApplyVO> renderLectureApply(ApprovalVO approvalVO);


//	int createLecture(LectureVO lectureVO);
//
//	int createLectureSchedule(LectureScheduleVO lectureScheduleVO);

}
