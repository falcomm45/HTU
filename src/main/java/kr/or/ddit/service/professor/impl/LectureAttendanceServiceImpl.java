package kr.or.ddit.service.professor.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.CalendarMapper;
import kr.or.ddit.mapper.LectureAttendanceMapper;
import kr.or.ddit.service.professor.LectureAttendanceService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.LectureVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LectureAttendanceServiceImpl implements LectureAttendanceService{
	
	private final LectureAttendanceMapper attendanceMapper;
	
	private final CalendarMapper calendarMapper;
	
	@Override
	public LectureVO detail(String lecCd) {
		LectureVO lectureVO = this.attendanceMapper.detail(lecCd);
		
		log.info("Before lectureVO ==> {}", lectureVO);
		
		lectureVO.getStudentList().stream().forEach(student -> {
			student.getAttendanceList().stream().forEach(attendance -> {
				if (attendance.getAttDt() != null) {
					attendance.setFormDate(EtcUtil.formDate(attendance.getAttDt()));
				}
			});
		});
		
		log.info("After lectureVO ==> {}", lectureVO);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		if (lectureVO.getLectureApplyVO().getLecaSem() == 1) {
			map.put("startDate", lectureVO.getLectureApplyVO().getLecaYear() + "0302");
			map.put("endDate", lectureVO.getLectureApplyVO().getLecaYear() + "0617");
		} else if (lectureVO.getLectureApplyVO().getLecaSem() == 2) {
			map.put("startDate", lectureVO.getLectureApplyVO().getLecaYear() + "0901");
			map.put("endDate", lectureVO.getLectureApplyVO().getLecaYear() + "1215");
		}
		map.put("startTime", lectureVO.getLectureApplyVO().getLecaStdt());
		map.put("endTime", lectureVO.getLectureApplyVO().getLecaEddt());
		map.put("roomCd", lectureVO.getLectureApplyVO().getRoomCd());
		map.put("days", lectureVO.getLectureScheduleVO().getLecDay().split("/"));
		
		List<CalendarVO> calendarList = calendarMapper.dateTransfer(map);
		
		calendarList.stream().forEach(calendar -> {
			calendar.setFormDate(EtcUtil.formDate(calendar.getCalDate()));
		});
		
		lectureVO.setCalendarList(calendarList);
		
		return lectureVO;
	}

	@Override
	public int insert(AttendanceVO attendanceVO) {
		
		return this.attendanceMapper.insert(attendanceVO);
	}

	@Override
	public int update(AttendanceVO attendanceVO) {
		return this.attendanceMapper.update(attendanceVO);
	}

	@Override
	public int count(String lecCd) {
		return this.attendanceMapper.count(lecCd);
	}

}
