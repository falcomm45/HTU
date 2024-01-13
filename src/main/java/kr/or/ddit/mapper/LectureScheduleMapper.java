package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.LectureScheduleVO;

public interface LectureScheduleMapper {

	public int createLectureSchedule(LectureScheduleVO lectureScheduleVO);
	
	public List<LectureScheduleVO> getLectureScheduleByBldCd(String bldCd);

}
