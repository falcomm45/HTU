package kr.or.ddit.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.TaskVO;

public interface TaskMapper {

	int getTotal(Map<String, Object> map);

	List<TaskVO> taskList(Map<String, Object> map);

	TaskVO taskDetail(String taskCd);

	int taskCreatePost(TaskVO taskVO);

	int taskUpdate(TaskVO taskVO);

	int taskDelete(TaskVO taskVO);

	List<EnrolmentVO> getStudent(String lecCd);

	List<TaskVO> edTaskList(Map<String, Object> map);

	List<TaskVO> taskSubmitList(String taskCd);

	int submitCountByTaskCd(String taskCd);

	int endSubmitCountByTaskCd(String taskCd);

	List<TaskVO> noTaskSubmitList(String taskCd);

	Date getSysdate();

	int taskSubmitScore(Map<String, Object> submitScore);


}
