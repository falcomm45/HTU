package kr.or.ddit.service.student.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.TaskSubmitMapper;
import kr.or.ddit.service.student.TaskSubmitService;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.FilesDetailVO;
import kr.or.ddit.vo.TaskSubmitVO;
import lombok.extern.slf4j.Slf4j;
@Service
@Slf4j
public class TaskSubmitServiceImpl implements TaskSubmitService{
	
	@Autowired
	TaskSubmitMapper taskSubmitMapper;
	@Autowired
	FileUtil fileUtil;
	
	@Override
	public int taskSubmit(TaskSubmitVO taskSubmitVO) {
		int result = this.taskSubmitMapper.taskSubmit(taskSubmitVO);
		
		result += fileUtil.uploadFile(taskSubmitVO.getUploadFiles(), taskSubmitVO.getTsubCd());
		
		return result;
	}

	@Override
	public List<FilesDetailVO> submitFileList(TaskSubmitVO taskSubmitVO) {
		return this.taskSubmitMapper.submitFileList(taskSubmitVO);
	}

}
