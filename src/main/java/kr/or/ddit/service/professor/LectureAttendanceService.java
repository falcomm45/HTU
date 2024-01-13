package kr.or.ddit.service.professor;

import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.LectureVO;

public interface LectureAttendanceService {

	public LectureVO detail(String lecCd);

	public int insert(AttendanceVO attendanceVO);

	public int update(AttendanceVO attendanceVO);

	public int count(String lecCd);

}
