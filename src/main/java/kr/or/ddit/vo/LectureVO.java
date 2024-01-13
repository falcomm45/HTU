package kr.or.ddit.vo;


import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
/**
 * 강의테이블VO
 * @author PC-20
 *
 */
public class LectureVO {
	private String lecCd;
	private int lecHcnt;
	private int lecStat;
	
	// 강의계획 정보를 가져오기 위한 필드
	private LectureApplyVO lectureApplyVO;
	
	private LectureScheduleVO lectureScheduleVO;
	
	// 해당 강의를 수강하는 학생 리스트 
	private List<StudentVO> studentList;
	
	// 해당 강의의 일정을 날짜로 변환하여 저장한 리스트
	private List<CalendarVO> calendarList;
	
	private List<WishLectureVO> wishLectureList;
	
	private List<EnrolmentVO> enrolmentList;
	private List<WeekplanVO> weekplanVOList;
// resultMap
// <result property="lecCd" column="LEC_CD"/>
// <result property="lecHcnt" column="LEC_HCNT"/>
// <result property="lecStat" column="LEC_STAT"/>
}
