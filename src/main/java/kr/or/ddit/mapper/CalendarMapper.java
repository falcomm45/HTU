package kr.or.ddit.mapper;

import java.util.HashMap;
import java.util.List;

import kr.or.ddit.vo.CalendarVO;

public interface CalendarMapper {
	
	
	/**
	 * 강의의 일정을 날짜 리스트로 변경해주는 메소드
	 * @param map 변경에 필요한 정보 
	 * 				startDate	: 강의 시작일자
	 * 				endDate		: 강의 종료일자
	 * 				startTime 	: 강의 시작시간
	 * 				endTime 	: 강의 종료 시간
	 * 				days		: 해당 요일의 배열
	 * 				roomCd		: 강의실
	 * @return 
	 */
	public List<CalendarVO> dateTransfer(HashMap<String, Object> map);

}
