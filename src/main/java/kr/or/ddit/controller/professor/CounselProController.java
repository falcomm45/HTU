package kr.or.ddit.controller.professor;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import kr.or.ddit.mapper.CounselMapper;
import kr.or.ddit.mapper.DepartmentMapper;
import kr.or.ddit.service.counsel.CounselService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.CommonDetailVO;
import kr.or.ddit.vo.CounselVO;
import kr.or.ddit.vo.DepartmentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/professor/counsel")
public class CounselProController {

	@Autowired
	CounselService counselService;

	@Autowired
	CounselMapper counselMapper;
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EtcUtil etcUtil;

	@ModelAttribute
	public void counselCommon(Model model) {

		List<CommonDetailVO> counselCommon = this.counselMapper.counselCommon();
		List<DepartmentVO> counselDept = this.counselMapper.counselDept();
		List<CounselVO> counselProfessor = this.counselMapper.counselProfessor();
		log.info("counselCommon : " + counselCommon);
		log.info("counselDept : " + counselDept);
		log.info("counselProfessor : " + counselProfessor);

		String jsonComonDetailList = etcUtil.getJsonList(counselCommon);
		String jsonDepartmentList = etcUtil.getJsonList(counselDept);
		String jsonCounselProList = etcUtil.getJsonList(counselProfessor);

		model.addAttribute("counselCommon", counselCommon);
		model.addAttribute("counselDept", counselDept);
		model.addAttribute("counselProfessor", counselProfessor);
		model.addAttribute("jsonComonDetailList", jsonComonDetailList);
		model.addAttribute("jsonDepartmentList", jsonDepartmentList);
		model.addAttribute("jsonCounselProList", jsonCounselProList);
	}

	@GetMapping("/counselProList")
	public String counselProList(Model model,Principal principal) {
		String userCd = principal.getName();
		List<CounselVO> data = this.counselService.counselProList(userCd);
		log.info("counselProList->data" + data);
		model.addAttribute("data", data);
		return "professor/counsel/counselProList";
	}

	@GetMapping("/counselReportList")
	public String counselReportList(Model model,Principal principal) {
		String userCd = principal.getName();
		List<CounselVO> data = this.counselService.counselProList(userCd);
		log.info("counselProList->data" + data);
		model.addAttribute("data", data);
		model.addAttribute("now", new Date());
		return "professor/counsel/counselReportList";
	}

	@ResponseBody
	@PostMapping("/counselConInsert")
	public int counselConInsert(@RequestBody CounselVO counselVO) {
		int result = this.counselService.counselConInsert(counselVO);
		return result;
	}

	@GetMapping("/counselAppUpdate")
	public String counselAppUpdate(CounselVO counselVO, RedirectAttributes redirect) {

		log.info("counselVO ==> {}", counselVO);

		int cnt = this.counselService.counselAppUpdate(counselVO);

		if (cnt > 1) {
			redirect.addFlashAttribute("alarm", counselVO.getStuCd());
		}

		return "redirect:/professor/counsel/counselProList";
	}

	@ResponseBody
	@PostMapping("/counselAppUpdate")
	public int counselAppUpdate(@RequestBody CounselVO counselVO) {
		return this.counselService.counselCancleUpdate(counselVO);
	}

	@GetMapping("/counselCancleUpdate")
	public String counselCancleUpdate(CounselVO counselVO, RedirectAttributes redirect) {

		int result = this.counselService.counselCancleUpdate(counselVO);

		if (result > 1) {
			redirect.addFlashAttribute("alarm", counselVO.getStuCd());
		}

		return "redirect:/professor/counsel/counselProList";

	}
	
	@GetMapping("/renderHome")
	@ResponseBody
	public List<CounselVO> renderHome(String userCd) {
		return this.counselService.renderHomePro(userCd);
	}

//	@GetMapping("/counselApp")
//	public String counselApp() {
//		return "student/counsel/counselApp";
//	}
//
//	@PostMapping("/counselAppPost")
//	public String counselAppPost(CounselVO counselVO, RedirectAttributes redirect) {
//		log.warn("counselVO ==> {}", counselVO);
//		int result = this.counselService.counselCreatePost(counselVO);
//		log.info("counselAppPost->counselVO" + result);
//		log.info("수신자 ====>> {}", counselVO.getProCd());
//		if (result > 2) {
//			redirect.addFlashAttribute("alarm", counselVO.getProCd());
//		}
//		return "redirect:/student/counsel/counselList";
//	}
//
//	@GetMapping("/counseldetail")
//	public String counseldetail(Model model,String cnslCd) {
//		CounselVO counselVO=this.counselService.counseldetail(cnslCd);
//		log.info("counseldetail->counselVO",counselVO);
//		model.addAttribute("counselVO",counselVO);
//		return "student/counsel/counselDetail";
//	}
//
//	@PostMapping("/counselUpdatePost")
//	public String counselUpdatePost(CounselVO counselVO) {
//		log.info("counselUpdatePost->counselVO = " + counselVO);
//		int result=this.counselService.counselUpdatePost(counselVO);
//		log.info("counselUpdatePost->counselVO = " + counselVO);
//		log.info("counselUpdatePost->result == {}",result);
//		/*
//		 * return
//		 * "redirect:/student/counsel/counseldetail?cnslCd="+counselVO.getCnslCd();
//		 */
//		return "redirect:/student/counsel/counseldetail";
//	}
//	
//	@GetMapping("/counselDelete")
//	public String counselDelete(String cnslCd) {
//		this.counselService.counselDelete(cnslCd);
//		
//		return "redirect:/student/counsel/counselList";
//	}
}
