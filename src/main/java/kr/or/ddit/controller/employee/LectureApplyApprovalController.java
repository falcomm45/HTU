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

import kr.or.ddit.service.employee.LectureApplyApprovalService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.LectureApplyVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/employee")
/** 결재요청된 강의계획신청 리스트를 가져오기 위한 클래스 */
public class LectureApplyApprovalController {

	@Autowired
	LectureApplyApprovalService lectureApplyApprovalService;


	@GetMapping("/lectureapproval/list")
	/** 결재요청된 강의계획신청 리스트 */
	public String lectureApplyList(Model model, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		int total = this.lectureApplyApprovalService.getTotal(map);

		List<LectureApplyVO> lectureApplyVOList = this.lectureApplyApprovalService.getLectureApplyList(map);
		List<LectureApplyVO> lectureApplyVOStandbyList = this.lectureApplyApprovalService.getLectureApplyVOStandbyList(map);
		
		

//		ArticlePage<LectureApplyVO> articlePage = new ArticlePage<LectureApplyVO>(total, currentPage, 10, lectureApplyVOList);
//		articlePage.setUrl("/employee/lectureapproval/list");

//		model.addAttribute("data", articlePage);
		model.addAttribute("lectureApplyVOList", lectureApplyVOList);
		model.addAttribute("lectureApplyVOStandbyList", lectureApplyVOStandbyList);
		
		return "employee/lectureapply/list";
	}

	@GetMapping("/lectureapprovla/detail")
	/** 결재요청된 강의계획신청의 상세 */
	public String lecaApplyDetail(Model model, String lecaCd) {

		LectureApplyVO lectureApplyVO = this.lectureApplyApprovalService.lecaApplyDetail(lecaCd);
		log.info("lectureApplyVO@@@@@@@@@" + lectureApplyVO);

		model.addAttribute("lectureApplyVO", lectureApplyVO);

		return "employee/lectureapply/detail";
	}

	@PostMapping("/approval/lectureapply")
	/** 강의계획신청 승인 -> 강의데이터생성 -> 강의일정데이터 생성 (반려시 반려사유등록 강의와 강의일정데이터는 생성X) */
	public String approvalLectureApply(LectureApplyVO lectureApplyVO, RedirectAttributes redirect) {

		log.info("lectureapply ==> {}", lectureApplyVO);

		int result = this.lectureApplyApprovalService.updateApprovalYn(lectureApplyVO);

		result += this.lectureApplyApprovalService.afterUpdate(lectureApplyVO);
		if(result > 1) {
			
			redirect.addFlashAttribute("alarm", lectureApplyVO.getProCd());
		}
		
		redirect.addFlashAttribute("appLec", 1);

		return "redirect:/employee/lectureapproval/list";
	}

}
