package kr.or.ddit.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.service.common.AnonymousBoardService;
import kr.or.ddit.service.common.FreeBoardService;
import kr.or.ddit.service.common.PublicizeBoardService;
import kr.or.ddit.service.employee.PostReportApplyApprovalService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.DormitoryVO;
import kr.or.ddit.vo.PostReportVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/employee")
/** 결재요청된 신고 리스트를 가져오기 위한 클래스 */
public class PostReportApprovalController {

	@Autowired
	PostReportApplyApprovalService postReportApplyApprovalService;
	
	@Autowired
	FreeBoardService freeBoardService;
	
	@Autowired
	AnonymousBoardService anonymousBoardService;
	
	@Autowired
	PublicizeBoardService publicizeBoardService;


	@GetMapping("/postreport/list")
	/** 결재요청된 신고신청 리스트 */
	public String postReportList(Model model, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		int total = this.postReportApplyApprovalService.getTotal(map);

		List<PostReportVO> postReportVOList = this.postReportApplyApprovalService.getPostReportList(map);

		ArticlePage<PostReportVO> articlePage = new ArticlePage<PostReportVO>(total, currentPage, 10, postReportVOList);
		articlePage.setUrl("/emp/postreport/list");
		
		String jsonPostReportList = "";
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			jsonPostReportList = objectMapper.writeValueAsString(postReportVOList);
		} catch (JsonProcessingException e) {
			log.error(e.getMessage());
		}

		model.addAttribute("data", articlePage);
		model.addAttribute("jsonPostReportList", jsonPostReportList);
		log.info("PostReportVOList@" + postReportVOList);
		return "employee/postreport/list";
	}
	@PostMapping("/approval/postReport")
	public String approvalpostReportApply(PostReportVO postReportVO, RedirectAttributes redirect) {
		log.info("postReportVO : " + postReportVO);
		
		// 승인처리
		int result = this.postReportApplyApprovalService.updateApprovalYn(postReportVO);
		
		 if(postReportVO.getApprovalVO().getAppYn() == 1) {
	         redirect.addFlashAttribute("postApply", 1);
	      }else if(postReportVO.getApprovalVO().getAppYn() == 2) {
	         redirect.addFlashAttribute("postApply", 2);
	      }
		
		 Map<String, String> map = new HashMap<String, String>();
		 map.put("bdCd", postReportVO.getBdCd());
		 
		 result += this.freeBoardService.delete(map);
		 result += this.publicizeBoardService.delete(map);
		 result += this.anonymousBoardService.delete(map);
		 
		 Map<String, String> response = new HashMap<>();
		 response.put("result", (result > 0) ? "success" : "failure");
		
		return "redirect:/employee/postreport/list";
	}
	
	@PostMapping("/postreport/delete")
	public String deletePost(Map<String, String> map) {
		
		log.info("map : " + map);
		
	    
	    return "redirect:/employee/postreport/list";
	}
}
