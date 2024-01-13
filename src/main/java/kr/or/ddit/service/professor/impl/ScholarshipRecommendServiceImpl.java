package kr.or.ddit.service.professor.impl;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.ScholarshipRecommendMapper;
import kr.or.ddit.service.professor.ScholarshipRecommendService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.ProfessorVO;
import kr.or.ddit.vo.ScholarshipRecommendVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ScholarshipRecommendServiceImpl implements ScholarshipRecommendService {

	@Autowired
	ScholarshipRecommendMapper scholarshipRecommendMapper;
	@Autowired
	ApprovalMapper approvalMapper;

	@Override
	public int createScholarshipRecommend(ScholarshipRecommendVO scholarshipRecommendVO, Principal principal) {
		
		log.info("const-> scholarshipRecommendVO : " + scholarshipRecommendVO);
		String proCd = principal.getName();
		ApprovalVO approvalVO = new ApprovalVO();
		approvalVO.setUserCd(proCd);
		approvalVO.setComdCd("APPR06");
		approvalVO.setAppTarget("1001");
		
		log.info("approvalVO : " + approvalVO);
		int result = this.scholarshipRecommendMapper.createScholarshipRecommend(approvalVO);
		
		scholarshipRecommendVO.setAppCd(approvalVO.getAppCd());
		
		result += this.scholarshipRecommendMapper.createScholarshipRecommendApproval(scholarshipRecommendVO);
		
		return result;
	}

	@Override
	public List<StudentVO> getStudent(String proCd) {
		return this.scholarshipRecommendMapper.getStudent(proCd);
	}

	@Override
	public List<ScholarshipRecommendVO> getRecommendedList(Map<String, Object> map) {
		return this.scholarshipRecommendMapper.getRecommendedList(map);
	}


}
