package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FilesDetailVO;
import kr.or.ddit.vo.TaskSubmitVO;

public interface TaskSubmitMapper {

	TaskSubmitVO submitTask(Map<String, Object> map);

	int taskSubmit(TaskSubmitVO taskSubmitVO);

	List<FilesDetailVO> submitFileList(TaskSubmitVO taskSubmitVO);

}
