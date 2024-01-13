package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureDataVO;
import kr.or.ddit.vo.LectureGradeVO;
import kr.or.ddit.vo.LectureNoticeVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TaskSubmitVO;
import kr.or.ddit.vo.TaskVO;
import kr.or.ddit.vo.WeekplanVO;
import kr.or.ddit.vo.WishLectureVO;

public interface EnrolmentMapper {

	public List<LectureVO> list(StudentVO studentVO);

	public String getColNm(String userCd);

	public int addWishLecture(WishLectureVO wishLectureVO);

	public int removeWishLecture(WishLectureVO wishLectureVO);

	public List<LectureVO> searchLecture(Map<String, Object> paramMap);
	
	public List<EnrolmentVO> getEnrolmentLecture(String stuCd);

	public LectureVO enrolmentLectureDetail(Map<String, Object> map);

	public int insertEnrolment(EnrolmentVO enrolmentVO);

	public int updateLectureCnt(LectureVO lectureVO);
	
	public List<EnrolmentVO> getEnrolmentList(String lecCd);

	public int getEnrolmentCnt(String lecCd);

	public LectureVO getEnrolment(String lecCd);

	public List<EnrolmentVO> getEnrolmentListByStuCd(String stuCd);

	public List<WishLectureVO> getWishLectureListByStuCd(String stuCd);

	public List<LectureVO> changeMenu1(Map<String, Object> paramMap);

	public List<LectureVO> changeMenu2(Map<String, Object> paramMap);

	public List<LectureNoticeVO> stuLectureNoticeList(Map<String, Object> map);

	public int getTotal(Map<String, Object> map);

	public LectureNoticeVO stuLectureNoticeDetail(String lecnCd);

	public int insertLectureGrade(LectureGradeVO lectureGradeVO);

	public List<TaskVO> taskList(Map<String, Object> map);

	public int count(LectureNoticeVO lectureNoticeVO);

	public List<LectureDataVO> stuLectureDataList(Map<String, Object> map);
	
	public List<LectureVO> renderHome(StudentVO studentVO);

	public LectureDataVO stuLectureDataDetail(String lecdCd);

	public TaskVO taskDetail(Map<String, Object> map);

	public List<TaskVO> edTaskList(Map<String, Object> map);

	public List<EnrolmentVO> endEnrolmentList(String stuCd);

	public int cancelEnrolment(EnrolmentVO enrolmentVO);

	public String getCrtrCd(String lecCd);

	public int deleteCriteria(LectureGradeVO lectureGradeVO);

	public int updateLectureMinus(LectureVO lectureVO);

	public int submitCountByTaskCd(Map<String, Object> submitCountsMap);

	public int endSubmitCountByTaskCd(Map<String, Object> endSubmitCountsMap);

	public LectureVO getLectureSyllabus(Map<String, Object> map);

	public TaskSubmitVO endSubmitScoreByTaskCd(Map<String, Object> endSubmitScoresMap);

}
