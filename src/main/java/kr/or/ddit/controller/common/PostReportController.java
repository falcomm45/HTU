package kr.or.ddit.controller.common;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.common.PostReportService;
import kr.or.ddit.service.common.ReservationService;
import kr.or.ddit.vo.PostReportVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class PostReportController {
	
	private final PostReportService postReportService;
	
	//신고 등록
	@PostMapping("/postReport")
	@ResponseBody
	public String insert(@RequestBody PostReportVO postReportVO) {
		//PostReportVO :PostReportVO(prCd=null, userCd=1001, appCd=null, bdCd=BORD02285, prRsn=0, prDetail=sdaf, approvalVO=null)
		log.info("PostReportVO :" + postReportVO);
		
//		int result = 1; // 1 성공, -1 실패
		
		// 1 성공, 0 실패
		int result = this.postReportService.insert(postReportVO);
		log.info("PostReportVO result :" + result);
		
		// ajax에서 데이터 처리하기 위해 JSON 형식 사용
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("result", result);
		
		log.info("result : " + result);
		
		String res = jsonObject.toString();
		
		return res;
	}
}
