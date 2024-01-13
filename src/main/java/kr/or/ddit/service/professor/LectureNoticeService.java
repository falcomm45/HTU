package kr.or.ddit.service.professor;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureNoticeVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.NotificationVO;

public interface LectureNoticeService {
	
	/**
	 * 강의 리스트
	 * @return
	 */
	List<LectureVO> lectureList(String proCd);
	/**
	 * 강의 상세
	 * @param lecCd 강의 코드
	 * @return
	 */
	LectureVO lectureDetail(String lecCd);
	/**
	 * 공지사항 작성
	 * @param lectureNoticeVO
	 * @return
	 */
	int lectureNoticeCreatePost(LectureNoticeVO lectureNoticeVO);
	/**
	 * 공지사항 리스트
	 * @param map
	 * @return
	 */
	List<LectureNoticeVO> lectureNoticeList(Map<String, Object> map);
	/**
	 * 페이징처리용
	 * @param map
	 * @return
	 */
	int getTotal(Map<String, Object> map);
	/**
	 * 공지사항 상세
	 * @param lecnCd
	 * @return
	 */
	LectureNoticeVO lectureNoticeDetail(String lecnCd);
	/**
	 * 공지사항 업데이트
	 * @param lectureNoticeVO
	 * @return
	 */
	int lectureNoticeUpdate(LectureNoticeVO lectureNoticeVO);
	/**
	 * 알림보내기
	 * @param lectureNoticeVO
	 * @param enrolmentVOList
	 * @return
	 */
	int lectureNoticeNtf(String lecnCd, List<EnrolmentVO> enrolmentVOList);
	/**
	 * 작성된 공지사항의 강의를 듣는 학생들
	 * @param lectureNoticeVO
	 * @return
	 */
	List<EnrolmentVO> getStudent(String lecCd);
	/**
	 * 공지사항 지우기
	 * @param lectureNoticeVO
	 * @return
	 */
	int lectureNoticeDelete(LectureNoticeVO lectureNoticeVO);

}
