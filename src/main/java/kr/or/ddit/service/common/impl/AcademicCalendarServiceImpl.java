package kr.or.ddit.service.common.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.AcademicCalendarMapper;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.mapper.UserMapper;
import kr.or.ddit.service.common.AcademicCalendarService;
import kr.or.ddit.vo.AcademicCalendarVO;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class AcademicCalendarServiceImpl implements AcademicCalendarService {

	private final AcademicCalendarMapper academicCalendarMapper;
	
	private final UserMapper userMapper;
	
	private final NotificationMapper notificationMapper;

	//학사일정 조회
	@Override
	public List<AcademicCalendarVO> getCalendar() {
		return this.academicCalendarMapper.getCalendar();
	}

	//학사일정 등록 - 관리자만 가능
	@Override
	public Map<String, Object> insertCalendar(AcademicCalendarVO acCalendarVO) {
		List<UserVO> studentList = this.userMapper.getStudentList();
		List<UserVO> professorList = this.userMapper.getProfessorList();
		
		for (UserVO userVO : professorList) {
			studentList.add(userVO);
		}
		
		NotificationVO notificationVO = new NotificationVO();
		studentList.forEach(userVO -> {
			notificationVO.setUserCd(userVO.getUserCd());
			notificationVO.setNtfCon("1001");
			notificationVO.setComdCd("ALAM08");
			notificationVO.setNtfUrl("/academicCalendar/calendar");
			this.notificationMapper.insert(notificationVO);
		});
		
		int result = this.academicCalendarMapper.insertCalendar(acCalendarVO);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userList", studentList);
		paramMap.put("result", result);
		
		return paramMap;
	}

	//학사일정 삭제 - 관리자만 가능
	@Override
	public int deleteCalendar(String acCd) {
		return this.academicCalendarMapper.deleteCalendar(acCd);
	}

	//학사일정 수정 - 관리자만 가능
	@Override
	public int updateCalendar(AcademicCalendarVO acCalendarVO) {
		return this.academicCalendarMapper.updateCalendar(acCalendarVO);
	}
	
  	
}
