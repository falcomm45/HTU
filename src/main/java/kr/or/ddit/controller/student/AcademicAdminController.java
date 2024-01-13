package kr.or.ddit.controller.student;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.service.student.AcademicAdminService;
import kr.or.ddit.service.student.EnrolmentService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.CreditVO;
import kr.or.ddit.vo.LectureGradeVO;
import kr.or.ddit.vo.RecordVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UnivMailVO;
import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/student/academicAdmin")
@RequiredArgsConstructor
@Slf4j
public class AcademicAdminController {
	
	private final AcademicAdminService academicAdminService;
	
//	private final EnrolmentService enrolmentService;
	
//	private final EtcUtil etcUtil;
	
//	학적변동조회리스트
	@GetMapping("/recordList")
	public String recordList(Model model,Principal principal,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		String userCd = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("currentPage", currentPage);
		map.put("userCd", userCd);
		
		List<RecordVO> data = this.academicAdminService.recordList(map);
		model.addAttribute("data", data);
		
		int total = this.academicAdminService.getTotalRecord(map);
		model.addAttribute("total", total);

		ArticlePage<RecordVO> articlePage 
			= new ArticlePage<RecordVO>(total, currentPage, 10, data);
		
		model.addAttribute("articlePage", articlePage);
		articlePage.setUrl("/student/academicAdmin/recordList");
		
		return "student/academicAdmin/recordList";
	}
	
//	휴학신청폼
	@GetMapping("/recordApp")
	public String recordApp(Model model,Principal principal) {
		String userCd = principal.getName();
		StudentVO data = this.academicAdminService.recordApp(userCd);
		model.addAttribute("data", data);
		model.addAttribute("now", new Date());
		log.info("data =>{}",data);
		return "student/academicAdmin/recordApp";
	}
	
	//학생의 학적상태 확인
	@GetMapping("/sideStatus")
	@ResponseBody
	public String sideStatus(Principal principal,Model model){
		String userCd = principal.getName();
		log.info(" sideStatus : userCd=>{}",userCd);
		String res = this.academicAdminService.sideStatus(userCd);
		model.addAttribute("res", res);
		log.info("res=>{}",res);
		return res;
	}
	
//	복학신청폼	
	@GetMapping("/recordApp2")
	public String recordApp2(Model model,Principal principal) {
		String userCd = principal.getName();
		StudentVO data = this.academicAdminService.recordApp(userCd);
		model.addAttribute("data", data);
		model.addAttribute("now", new Date());
		log.info("data =>{}",data);
		return "student/academicAdmin/recordApp2";
	}
//	자퇴신청폼	
	@GetMapping("/recordApp3")
	public String recordApp3(Model model,Principal principal) {
		String userCd = principal.getName();
		StudentVO data = this.academicAdminService.recordApp(userCd);
		model.addAttribute("data", data);
		model.addAttribute("now", new Date());
		log.info("data =>{}",data);
		return "student/academicAdmin/recordApp3";
	}
//	휴학신청
	@PostMapping("/recordAppPost")
	public String recordAppPost(RecordVO recordVO, RedirectAttributes redirect) {
		int result = this.academicAdminService.recordAppPost(recordVO);
		if (result > 0) {
			redirect.addFlashAttribute("alarm", "1001");
			return "redirect:/student/academicAdmin/recordList";
		}
		else return null;
	}
//	학적신청삭제
	@GetMapping("/delete")
	public String delete(String recCd,RedirectAttributes redirect) {
		int result = this.academicAdminService.delete(recCd);
		if (result == 1) {
			redirect.addFlashAttribute("delete", "delete");
		}
		return "redirect:/student/academicAdmin/recordList";
	}
	
}
