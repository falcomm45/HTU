package kr.or.ddit.service.student;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LectureGradeVO;
import kr.or.ddit.vo.ObjectionVO;
import kr.or.ddit.vo.RecordVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;

public interface AcademicAdminService {

	public List<LectureGradeVO> getLecList(String stuCd);

	public StudentVO recordApp(String userCd);

	public int recordAppPost(RecordVO recordVO);

	public List<RecordVO> recordList(Map<String, Object> map);

	public int delete(String recCd);

	public List<LectureGradeVO> getGrade(StudentVO studentVO);

	public List<ObjectionVO> getObjectionList(String userCd);

	public int getTotalRecord(Map<String, Object> map);

	public int checkGrade(String lecCd);

	public int endLecture(String lecCd, String maxAtt);

	public String sideStatus(String userCd);
}
