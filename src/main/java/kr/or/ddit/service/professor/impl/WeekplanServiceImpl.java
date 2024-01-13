package kr.or.ddit.service.professor.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.CalendarMapper;
import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.mapper.WeekplanMapper;
import kr.or.ddit.service.professor.WeekplanService;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.WeekplanVO;

@Service
public class WeekplanServiceImpl implements WeekplanService{
	@Autowired
	LectureMapper lectureMapper;
	@Autowired
	WeekplanMapper weekplanMapper;
	@Autowired
	CalendarMapper calendarMapper;
	
	@Override
	/** 강의목록 */
	public List<LectureVO> lectureList(String proCd) {
		return this.lectureMapper.lectureList(proCd);
	}

	@Override
	/** 강의상세 */
	public LectureVO lectureDetail(String lecCd) {
		LectureVO lectureVO = this.lectureMapper.lectureDetail(lecCd);
		
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
		map.put("days", lectureVO.getLectureApplyVO().getLecaSche().split("/"));
		
		List<CalendarVO> calendarList = this.calendarMapper.dateTransfer(map);
		
		lectureVO.setCalendarList(calendarList);
		return lectureVO;
	}
	
	@Transactional
	@Override
	/** 주차별계획 작성 */
	public int weekplanCreatePost(List<WeekplanVO> weekplanVOList) {
		int result = 0;
		LectureVO lectureVO = new LectureVO();
		
		// 주차별 계획 동적으로 한번에 여러 주차 계획할수 있음
		for(WeekplanVO weekplanVO : weekplanVOList) {
			
			weekplanVO.setLectureVO(lectureVO);
			result += this.weekplanMapper.weekplanCreatePost(weekplanVO);
			
		}
		
		return result;
	}


	@Override
	public List<WeekplanVO> weekplanList(Map<String, Object> map) {
		return this.weekplanMapper.weekplanList(map);
	}
	
	@Override
	public int getTotal(Map<String, Object> map) {
		return this.weekplanMapper.getTotal(map);
	}

	@Override
	public WeekplanVO weekplanDetail(Map<String, String> map) {
		return this.weekplanMapper.weekplanDetail(map);
	}

	@Override
	public int weekplanUpdate(WeekplanVO weekplanVO) {
		return this.weekplanMapper.weekplanUpdate(weekplanVO);
	}

	@Override
	public int weekplanDelete(WeekplanVO weekplanVO) {
		return this.weekplanMapper.weekplanDelete(weekplanVO);
	}

	@Override
	public String getLecName(String lecCd) {
		return this.weekplanMapper.getLecName(lecCd);
	}

	@Override
	public List<EnrolmentVO> getEnrolmentStudentList(Map<String, Object> map) {
		return this.lectureMapper.getEnrolmentStudentList(map);
	}

}
