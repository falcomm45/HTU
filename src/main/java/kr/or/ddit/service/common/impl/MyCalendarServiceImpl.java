package kr.or.ddit.service.common.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.MyCalendarMapper;
import kr.or.ddit.service.common.MyCalendarService;
import kr.or.ddit.vo.MyCalendarVO;

@Service
public class MyCalendarServiceImpl implements MyCalendarService{

	@Autowired
	MyCalendarMapper myCalendarMapper;

	//개인일정 조회
	@Override
	public List<MyCalendarVO> getCalendar(String userCd) {
		return this.myCalendarMapper.getCalendar(userCd);
	}

	//개인일정 등록
	@Override
	public int insertCalendar(MyCalendarVO myCalendarVO) {
		return this.myCalendarMapper.insertCalendar(myCalendarVO);
	}

	//개인일정 삭제
	@Override
	public int deleteCalendar(String mcCd) {
		return this.myCalendarMapper.deleteCalendar(mcCd);
	}

	//개인일정 수정
	@Override
	public int updateCalendar(MyCalendarVO myCalendarVO) {
		return this.myCalendarMapper.updateCalendar(myCalendarVO);
	}

}
