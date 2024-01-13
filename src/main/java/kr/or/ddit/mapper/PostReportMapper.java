package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.PostReportVO;

public interface PostReportMapper {
	
	public int insert(ApprovalVO approvalVO);
	
	public int createReport(PostReportVO postReportVO);

	public List<PostReportVO> renderReport(ApprovalVO approvalVO);
}
