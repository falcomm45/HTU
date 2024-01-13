package kr.or.ddit.service.common;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.AcademicCalendarVO;

public interface AcademicCalendarService {

	//학사일정 조회
	public List<AcademicCalendarVO> getCalendar();

	//학사일정 등록 - 관리자만 가능
	public Map<String, Object> insertCalendar(AcademicCalendarVO acCalendarVO);

	//학사일정 삭제 - 관리자만 가능
	public int deleteCalendar(String acCd);

	//학사일정 수정 - 관리자만 가능
	public int updateCalendar(AcademicCalendarVO acCalendarVO);
	

}
