package kr.or.ddit.service.employee;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PostReportVO;

public interface PostReportApplyApprovalService {

	int getTotal(Map<String, Object> map);

	List<PostReportVO> getPostReportList(Map<String, Object> map);

	int updateApprovalYn(PostReportVO postReportVO);


}
