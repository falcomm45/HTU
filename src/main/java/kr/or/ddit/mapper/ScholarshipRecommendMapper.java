package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.ProfessorVO;
import kr.or.ddit.vo.ScholarshipRecommendVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;

public interface ScholarshipRecommendMapper {

	List<UserVO> getEmployee();

	int createScholarshipRecommendApproval(ScholarshipRecommendVO scholarshipRecommendVO);

	int createScholarshipRecommend(ApprovalVO approvalVO);

	List<StudentVO> getStudent(String proCd);

	//학과 검색
	List<DepartmentVO> getDepCdListAjax(DepartmentVO departmentVO);

	//학생 조회
	List<StudentVO> getStudentListAjax(StudentVO studentVO);


	List<ScholarshipRecommendVO> getRecommendedList(Map<String, Object> map);


	

//	int createLectureApplyConsent(ApprovalVO consentVO);
//
//	int createLectureApply(LectureApplyVO lectureApplyVO);
//
//	int updateLectureApplyConCd(LectureApplyVO lectureApplyVO);
//
//	LectureApplyVO lecaApplyDetail(String lecaCd);
//
//	LectureApplyVO getLectureApply(String appCd);
//
//	List<UserVO> getEmployee();

//	int createLecture(LectureVO lectureVO);
//
//	int createLectureSchedule(LectureScheduleVO lectureScheduleVO);

}
