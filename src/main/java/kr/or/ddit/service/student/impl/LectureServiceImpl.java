package kr.or.ddit.service.student.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.EnrolmentMapper;
import kr.or.ddit.mapper.EnrolmentMapper2;
import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.mapper.TaskMapper;
import kr.or.ddit.mapper.TaskSubmitMapper;
import kr.or.ddit.service.student.LectureService;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.LectureDataVO;
import kr.or.ddit.vo.LectureNoticeVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TaskSubmitVO;
import kr.or.ddit.vo.TaskVO;
import kr.or.ddit.vo.WeekplanVO;

@Service
public class LectureServiceImpl implements LectureService{
	
	@Autowired
	EnrolmentMapper enrolmentMapper;
	@Autowired
	EnrolmentMapper2 enrolmentMapper2;
	@Autowired
	TaskSubmitMapper taskSubmitMapper;
	@Autowired
	private LectureMapper lectureMapper;
	
	@Override
	public List<EnrolmentVO> getEnrolmentLecture(String stuCd) {
		return this.enrolmentMapper.getEnrolmentLecture(stuCd);
	}

	@Override
	public LectureVO enrolmentLectureDetail(Map<String, Object> map) {
		return this.enrolmentMapper.enrolmentLectureDetail(map);
	}

	@Override
	public List<LectureNoticeVO> stuLectureNoticeList(Map<String, Object> map) {
		return this.enrolmentMapper.stuLectureNoticeList(map);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.enrolmentMapper.getTotal(map);
	}

	@Override
	public LectureNoticeVO stuLectureNoticeDetail(String lecnCd) {
		return this.enrolmentMapper.stuLectureNoticeDetail(lecnCd);
	}

	@Override
	public List<LectureVO> getLectureList(StudentVO studentVO) {
		return this.lectureMapper.getLectureList(studentVO);
	}

	@Override
	public List<WeekplanVO> enrolmentLectureWeekplan(Map<String, Object> map) {
		return this.enrolmentMapper2.enrolmentLectureWeekplan(map);
	}

	@Override
	public List<TaskVO> taskList(Map<String, Object> map) {
		return this.enrolmentMapper.taskList(map);
	}

	@Override
	public int count(String lecnCd) {
		LectureNoticeVO lectureNoticeVO = new LectureNoticeVO();
		lectureNoticeVO.setLecnCd(lecnCd);
		return this.enrolmentMapper.count(lectureNoticeVO);
	}
	
	@Override
	public List<EnrolmentVO> getLectureDetail(StudentVO studentVO) {
		return this.lectureMapper.getLectureDetail(studentVO);
	}

	@Override
	public List<LectureDataVO> stuLectureDataList(Map<String, Object> map) {
		return this.enrolmentMapper.stuLectureDataList(map);
	}

	@Override
	public LectureDataVO stuLectureDataDetail(String lecdCd) {
		return this.enrolmentMapper.stuLectureDataDetail(lecdCd);
	}

	@Override
	public TaskVO taskDetail(Map<String, Object> map) {
		return this.enrolmentMapper.taskDetail(map);
	}

	@Override
	public TaskSubmitVO submitTask(Map<String, Object> map) {
		return this.taskSubmitMapper.submitTask(map);
	}

	@Override
	public List<TaskVO> edTaskList(Map<String, Object> map) {
		return this.enrolmentMapper.edTaskList(map);
	}

	@Override
	public List<LectureVO> getLectureList(String userCd) {
		
		Date date = new Date();
		
		int year = Integer.parseInt(new SimpleDateFormat("yyyy").format(date));
		int month = Integer.parseInt(new SimpleDateFormat("MM").format(date));
		
		int sem = month >= 9 ? 2 : 1;
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userCd", userCd);
		paramMap.put("year", year);
		paramMap.put("sem", sem);
		
		return this.lectureMapper.getLectureList2(paramMap);
	}

	@Override
	public List<LectureVO> getTimeTable(LectureApplyVO lectureApplyVO) {
		return this.lectureMapper.getTimeTable(lectureApplyVO);
		
	}

	@Override
	public List<EnrolmentVO> getEnrolmentStudentList(Map<String, Object> map) {
		return this.lectureMapper.getEnrolmentStudentList(map);
	}

	@Override
	public int submitCountByTaskCd(Map<String, Object> submitCountsMap) {
		return this.enrolmentMapper.submitCountByTaskCd(submitCountsMap);
	}

	@Override
	public int endSubmitCountByTaskCd(Map<String, Object> endSubmitCountsMap) {
		return this.enrolmentMapper.endSubmitCountByTaskCd(endSubmitCountsMap);
	}

	@Override
	public String lectureNm(String lecCd) {
		return this.lectureMapper.lectureNm(lecCd);
	}

	@Override
	public LectureVO getLectureSyllabus(Map<String, Object> map) {
		return this.enrolmentMapper2.getLectureSyllabus(map);
	}

	@Override
	public TaskSubmitVO endSubmitScoreByTaskCd(Map<String, Object> endSubmitScoresMap) {
		return this.enrolmentMapper.endSubmitScoreByTaskCd(endSubmitScoresMap);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
