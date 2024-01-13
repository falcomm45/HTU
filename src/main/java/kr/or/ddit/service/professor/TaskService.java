package kr.or.ddit.service.professor;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.TaskSubmitVO;
import kr.or.ddit.vo.TaskVO;

public interface TaskService {
	
	/**
	 * 강의 목록
	 * @return
	 */
	List<LectureVO> lectureList(String proCd);
	/**
	 * 페이징처리용 데이터수 구하기
	 * @param map
	 * @return
	 */
	int getTotal(Map<String, Object> map);
	/**
	 * 과제 리스트
	 * @param map
	 * @return
	 */
	List<TaskVO> taskList(Map<String, Object> map);
	/**
	 * 과제 상세
	 * @param taskCd
	 * @return
	 */
	TaskVO taskDetail(String taskCd);
	/**
	 * 과제등록
	 * @param taskVO
	 * @return
	 */
	int taskCreatePost(TaskVO taskVO);
	/**
	 * 과제 수정
	 * @param taskVO
	 * @return
	 */
	int taskUpdate(TaskVO taskVO);
	/**
	 * 과제 삭제
	 * @param taskVO
	 * @return
	 */
	int taskDelete(TaskVO taskVO);
	/**
	 * 등록된 과제의 강의를 듣든 학생들구하기
	 * @param taskVO
	 * @return
	 */
	List<EnrolmentVO> getStudent(String lecCd);
	/**
	 * 구한 학생들에게 알림보내기
	 * @param taskVO
	 * @param enrolmentVOList
	 * @return
	 */
	int taskNtf(String taksCd, List<EnrolmentVO> enrolmentVOList);
	/**
	 * 제출기한 끝난 과제들
	 * @param map
	 * @return
	 */
	List<TaskVO> edTaskList(Map<String, Object> map);
	
	List<TaskVO> taskSubmitList(String taskCd);
	
	int submitCountByTaskCd(String taskCd);
	
	int endSubmitCountByTaskCd(String taskCd);
	
	List<TaskVO> noTaskSubmitList(String taskCd);
	
	int taskSubmitScore(Map<String, Object> submitScore);

}
