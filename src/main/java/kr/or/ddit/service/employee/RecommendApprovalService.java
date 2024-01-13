package kr.or.ddit.service.employee;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ScholarshipRecommendVO;

public interface RecommendApprovalService {

	int getTotal(Map<String, Object> map);

	List<ScholarshipRecommendVO> getRecommendList(Map<String, Object> map);

	int updateRecommendYn(ScholarshipRecommendVO scholarshipRecommendVO);

}
