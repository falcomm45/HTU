package kr.or.ddit.service.common;

import java.util.List;

import kr.or.ddit.vo.MyCalendarVO;

public interface MyCalendarService {

	//개인일정 조회
	public List<MyCalendarVO> getCalendar(String userCd);

	//개인일정 등록
	public int insertCalendar(MyCalendarVO myCalendarVO);

	//개인일정 삭제
	public int deleteCalendar(String mcCd);

	//개인일정 수정
	public int updateCalendar(MyCalendarVO myCalendarVO);

}
