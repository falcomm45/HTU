package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.LectureVO;

public interface LectureAttendanceMapper {

	public LectureVO detail(String lecCd);

	public int insert(AttendanceVO attendanceVO);

	public int update(AttendanceVO attendanceVO);

	public int count(String lecCd);

	public List<AttendanceVO> getAttendanceListByLecCd(String lecCd);

}
