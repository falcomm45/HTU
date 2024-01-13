package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.WeekplanVO;

public interface EnrolmentMapper2 {

	public LectureVO getLectureSyllabus(Map<String, Object> map);

	public List<WeekplanVO> enrolmentLectureWeekplan(Map<String, Object> map);

}
