package kr.or.ddit.service.common;

import java.util.List;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.PostReportVO;

public interface PostReportService {

	public int insert(PostReportVO postReportVO);

	public List<PostReportVO> renderReport(ApprovalVO approvalVO);

}
