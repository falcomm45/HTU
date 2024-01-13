package kr.or.ddit.service.professor;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.WeekplanVO;

public interface WeekplanService {

	List<LectureVO> lectureList(String proCd);

	LectureVO lectureDetail(String lecCd);

	int weekplanCreatePost(List<WeekplanVO> weekplanVOList);

	int getTotal(Map<String, Object> map);

	List<WeekplanVO> weekplanList(Map<String, Object> map);

	WeekplanVO weekplanDetail(Map<String, String> map);

	int weekplanUpdate(WeekplanVO weekplanVO);

	int weekplanDelete(WeekplanVO weekplanVO);

	String getLecName(String lecCd);

	List<EnrolmentVO> getEnrolmentStudentList(Map<String, Object> map);

}
