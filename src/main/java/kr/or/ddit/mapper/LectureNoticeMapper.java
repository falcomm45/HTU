package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureNoticeVO;

public interface LectureNoticeMapper {

	int lectureNoticeCreatePost(LectureNoticeVO lectureNoticeVO);

	List<LectureNoticeVO> lectureNoticeList(Map<String, Object> map);

	int getTotal(Map<String, Object> map);

	LectureNoticeVO lectureNoticeDetail(String lecnCd);

	int lectureNoticeUpdate(LectureNoticeVO lectureNoticeVO);

	List<EnrolmentVO> getStudent(String lecCd);

	int lectureNoticeDelete(LectureNoticeVO lectureNoticeVO);

}
