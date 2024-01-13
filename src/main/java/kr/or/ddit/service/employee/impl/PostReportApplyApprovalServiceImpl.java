package kr.or.ddit.service.employee.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.PostReportMapper;
import kr.or.ddit.service.employee.PostReportApplyApprovalService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.PostReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PostReportApplyApprovalServiceImpl implements PostReportApplyApprovalService {
	
	@Autowired
	ApprovalMapper approvalMapper; 
	
	@Autowired
	PostReportMapper postReportMapper;
	
	@Override
	public int getTotal(Map<String, Object> map) {
		return this.approvalMapper.getTotal(map);
	}

	@Override
	public List<PostReportVO> getPostReportList(Map<String, Object> map) {
		return this.approvalMapper.getPostReportList(map);
	}

	@Override
	public int updateApprovalYn(PostReportVO postReportVO) {
		
		ApprovalVO approvalVO = new ApprovalVO();
		approvalVO.setAppCd(postReportVO.getAppCd());
		approvalVO.setAppYn(postReportVO.getApprovalVO().getAppYn());
		
		approvalVO.setAppRet(postReportVO.getApprovalVO().getAppRet());
		postReportVO.setApprovalVO(approvalVO);
		
		int result = this.approvalMapper.updateApprovalYn(approvalVO);
		
		return result;
	}

//	@Override
//	public int deleteAndUpdate(PostReportVO postReportVO) {
//		return 0;
//	}

}
