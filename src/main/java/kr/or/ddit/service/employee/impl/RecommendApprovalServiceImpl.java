package kr.or.ddit.service.employee.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.ScholarshipRecommendMapper;
import kr.or.ddit.service.employee.RecommendApprovalService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.ScholarshipRecommendVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class RecommendApprovalServiceImpl implements RecommendApprovalService {
	
	@Autowired
	ApprovalMapper approvalMapper;
	
	@Autowired
	ScholarshipRecommendMapper scholarshipRecommendMapper;

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.approvalMapper.getTotal(map);
	}

	@Override
	public List<ScholarshipRecommendVO> getRecommendList(Map<String, Object> map) {
		return this.approvalMapper.getRecommendList(map);
	}

	@Override
	public int updateRecommendYn(ScholarshipRecommendVO scholarshipRecommendVO) {
		
		ApprovalVO approvalVO =  new ApprovalVO();
		approvalVO.setAppCd(scholarshipRecommendVO.getAppCd());
		approvalVO.setAppYn(scholarshipRecommendVO.getApprovalVO().getAppYn());
		approvalVO.setAppRet(scholarshipRecommendVO.getAppRet());
		approvalVO.setAppProdt(scholarshipRecommendVO.getApprovalVO().getAppProdt());
		
		scholarshipRecommendVO.setApprovalVO(approvalVO);
		
		log.info("scholarshipRecommendVO",scholarshipRecommendVO);
		
		int result = this.approvalMapper.updateApprovalYn(approvalVO);
		
		return result;
	}
	
	
}
