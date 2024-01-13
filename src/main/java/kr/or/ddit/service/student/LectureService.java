package kr.or.ddit.service.student;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.LectureDataVO;
import kr.or.ddit.vo.LectureNoticeVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TaskSubmitVO;
import kr.or.ddit.vo.TaskVO;
import kr.or.ddit.vo.WeekplanVO;

public interface LectureService {

	public List<EnrolmentVO> getEnrolmentLecture(String stuCd);

	public LectureVO enrolmentLectureDetail(Map<String, Object> map);

	public List<LectureNoticeVO> stuLectureNoticeList(Map<String, Object> map);

	public int getTotal(Map<String, Object> map);

	public LectureNoticeVO stuLectureNoticeDetail(String lecnCd);

	public List<LectureVO> getLectureList(StudentVO studentVO);

	public List<WeekplanVO> enrolmentLectureWeekplan(Map<String, Object> map);

	public List<TaskVO> taskList(Map<String, Object> map);

	public int count(String lecnCd);
	
	public List<EnrolmentVO> getLectureDetail(StudentVO studentVO);

	public List<LectureDataVO> stuLectureDataList(Map<String, Object> map);

	public LectureDataVO stuLectureDataDetail(String lecdCd);

	public TaskVO taskDetail(Map<String, Object> map);

	public TaskSubmitVO submitTask(Map<String, Object> map);

	public List<TaskVO> edTaskList(Map<String, Object> map);

	public List<LectureVO> getLectureList(String userCd);

	public List<LectureVO> getTimeTable(LectureApplyVO lectureApplyVO);

	public List<EnrolmentVO> getEnrolmentStudentList(Map<String, Object> map);

	public int submitCountByTaskCd(Map<String, Object> submitCountsMap);

	public int endSubmitCountByTaskCd(Map<String, Object> endSubmitCountsMap);

	public String lectureNm(String lecCd);

	public LectureVO getLectureSyllabus(Map<String, Object> map);

	public TaskSubmitVO endSubmitScoreByTaskCd(Map<String, Object> endSubmitScoresMap);
	
}
