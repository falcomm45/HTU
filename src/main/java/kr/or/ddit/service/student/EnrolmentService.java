package kr.or.ddit.service.student;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.WishLectureVO;

public interface EnrolmentService {

	public List<LectureVO> list(StudentVO studentVO);
	
	// 단과대 이름
	public String getColNm(String userCd);

	public int addWishLecture(WishLectureVO wishLectureVO);

	public int removeWishLecture(WishLectureVO wishLectureVO);

	public List<LectureVO> searchLecture(Map<String, Object> paramMap);

	public int insertEnrolment(EnrolmentVO enrolmentVO);

	public List<EnrolmentVO> getEnrolmentList(String lecCd);
	
	public List<EnrolmentVO> getEnrolmentListByStuCd(String stuCd);

	public List<WishLectureVO> getWishLectureListByStuCd(String stuCd);

	public List<LectureVO> changeMenu(String keyword);

	public int cancelEnrolment(EnrolmentVO enrolmentVO);

}
