package kr.or.ddit.service.student;

import java.util.List;

import kr.or.ddit.vo.FilesDetailVO;
import kr.or.ddit.vo.TaskSubmitVO;

public interface TaskSubmitService {

	int taskSubmit(TaskSubmitVO taskSubmitVO);

	List<FilesDetailVO> submitFileList(TaskSubmitVO taskSubmitVO);

}
