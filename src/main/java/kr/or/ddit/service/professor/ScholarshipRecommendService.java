package kr.or.ddit.service.professor;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.ProfessorVO;
import kr.or.ddit.vo.ScholarshipRecommendVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;

public interface ScholarshipRecommendService {

	List<StudentVO> getStudent(String proCd);

	int createScholarshipRecommend(ScholarshipRecommendVO scholarshipRecommendVO, Principal principal);

	List<ScholarshipRecommendVO> getRecommendedList(Map<String, Object> map);

}
