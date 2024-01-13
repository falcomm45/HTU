package kr.or.ddit.service.professor.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.mapper.TaskMapper;
import kr.or.ddit.service.professor.TaskService;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.TaskSubmitVO;
import kr.or.ddit.vo.TaskVO;
@Service
public class TaskServiceImpl implements TaskService{
	@Autowired
	TaskMapper taskMapper;
	
	@Autowired
	LectureMapper lectureMapper;
	
	@Autowired
	FileUtil fileUtil;
	
	@Autowired
	NotificationMapper notificationMapper;
	
	@Override
	/** 강의목록 */
	public List<LectureVO> lectureList(String proCd) {
		return this.lectureMapper.lectureList(proCd);
	}

	@Override
	/** 페이징 처리 */
	public int getTotal(Map<String, Object> map) {
		return this.taskMapper.getTotal(map);
	}

	@Override
	/** 과제목록 */
	public List<TaskVO> taskList(Map<String, Object> map) {
		return this.taskMapper.taskList(map);
	}

	@Override
	/** 과제 상세 */
	public TaskVO taskDetail(String taskCd) {
		return this.taskMapper.taskDetail(taskCd);
	}

	@Override
	/** 과제등록 */
	public int taskCreatePost(TaskVO taskVO) {
		
		LectureVO lectureVO = new LectureVO();
		
		taskVO.setLectureVO(lectureVO);
		
		int result = this.taskMapper.taskCreatePost(taskVO);
		// 파일업로드
		result += this.fileUtil.uploadFile(taskVO.getUploadFiles(), taskVO.getTaskCd());
		
		return result;
	}

	@Override
	/** 과제수정 */
	public int taskUpdate(TaskVO taskVO) {
		
		int result = this.taskMapper.taskUpdate(taskVO);
		
		MultipartFile[] uploadFiles = taskVO.getUploadFiles();
		
		if(uploadFiles[0].getOriginalFilename().length() > 0) {
			
			result += this.fileUtil.updateFileUsed(taskVO.getTaskCd());
			
			result += this.fileUtil.uploadFile(taskVO.getUploadFiles(), taskVO.getTaskCd());
		}
		
		return result;
	}

	@Override
	/** 과제삭제 */
	public int taskDelete(TaskVO taskVO) {
		return this.taskMapper.taskDelete(taskVO);
	}

	@Override
	/** 등록된 과제의 강의를 듣는 학생들 */
	public List<EnrolmentVO> getStudent(String lecCd) {
		
		return this.taskMapper.getStudent(lecCd);
	}

	@Override
	/** 메일보내기 */
	public int taskNtf(String taskCd, List<EnrolmentVO> enrolmentVOList) {
		int result = 0;
		NotificationVO notificationVO = new NotificationVO();
		
		for (int i = 0; i < enrolmentVOList.size(); i++) {
			notificationVO.setUserCd(enrolmentVOList.get(i).getStuCd());
			notificationVO.setComdCd("ALAM07");
			notificationVO.setNtfUrl("/student/task/detail?taskCd=" + taskCd);
			notificationVO.setNtfCon(this.lectureMapper.getLectureNm(enrolmentVOList.get(i).getLecCd()));
			result += this.notificationMapper.insert(notificationVO);
		}
		
		return result;
	}

	@Override
	public List<TaskVO> edTaskList(Map<String, Object> map) {
		return this.taskMapper.edTaskList(map);
	}

	@Override
	public List<TaskVO> taskSubmitList(String taskCd) {
		return this.taskMapper.taskSubmitList(taskCd);
	}

	@Override
	public int submitCountByTaskCd(String taskCd) {
		return this.taskMapper.submitCountByTaskCd(taskCd);
	}

	@Override
	public int endSubmitCountByTaskCd(String taskCd) {
		return this.taskMapper.endSubmitCountByTaskCd(taskCd);
	}

	@Override
	public List<TaskVO> noTaskSubmitList(String taskCd) {
		return this.taskMapper.noTaskSubmitList(taskCd);
	}

	@Override
	public int taskSubmitScore(Map<String, Object> submitScore) {
		return this.taskMapper.taskSubmitScore(submitScore);
	}

}
















