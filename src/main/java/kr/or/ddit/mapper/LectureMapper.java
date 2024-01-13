package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.StudentVO;

public interface LectureMapper {

	int createLecture(LectureVO lectureVO);

	List<LectureVO> lectureList(String proCd);

	LectureVO lectureDetail(String lecCd);

	List<LectureVO> getLectureList(StudentVO studentVO);

	List<EnrolmentVO> getLectureDetail(StudentVO studentVO);

	List<EnrolmentVO> getEnrolmentStudentList(Map<String, Object> map);

	List<LectureVO> getLectureList2(Map<String, Object> paramMap);

	List<LectureVO> getTimeTable(LectureApplyVO lectureApplyVO);

	List<LectureVO> endLectureList(String proCd);

	List<LectureVO> startLectureList(String proCd);

	List<LectureVO> endLectureNameList(String proCd);

	String getLectureNm(String string);

	String lectureNm(String lecCd);

	List<EnrolmentVO> studentStartLectureList(String stuCd);


}
