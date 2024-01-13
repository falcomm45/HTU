package kr.or.ddit.controller.student;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.mapper.CounselMapper;
import kr.or.ddit.mapper.DepartmentMapper;
import kr.or.ddit.service.counsel.CounselService;
import kr.or.ddit.vo.CommonDetailVO;
import kr.or.ddit.vo.CounselVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.ProfessorVO;
import lombok.extern.slf4j.Slf4j;


/**
 * @author 상담페이지 학생상담관리
 *
 */
@Slf4j
@Controller
@RequestMapping("/student/counsel")
public class CounselController {

	@Autowired
	CounselService counselService;

	@Autowired
	CounselMapper counselMapper;

	DepartmentMapper departmentMapper;

	@ModelAttribute
	public void counselCommon(Model model) {

		ObjectMapper objectMapper = new ObjectMapper();

		List<CommonDetailVO> counselCommon = this.counselMapper.counselCommon();
		List<DepartmentVO> counselDept = this.counselMapper.counselDept();
		List<CounselVO> counselProfessor = this.counselMapper.counselProfessor();
		log.info("counselCommon : " + counselCommon);
		log.info("counselDept : " + counselDept);
		log.info("counselProfessor : " + counselProfessor);

		String jsonComonDetailList = "";
		String jsonDepartmentList = "";
		String jsonCounselProList = "";
		try {
			jsonComonDetailList = objectMapper.writeValueAsString(counselCommon);
			jsonDepartmentList = objectMapper.writeValueAsString(counselDept);
			jsonCounselProList = objectMapper.writeValueAsString(counselProfessor);
		} catch (JsonProcessingException e) {
			log.error(e.getMessage());
		}
		
		model.addAttribute("counselCommon", counselCommon);
		model.addAttribute("counselDept", counselDept);
		model.addAttribute("counselProfessor", counselProfessor);
		model.addAttribute("jsonComonDetailList", jsonComonDetailList);
		model.addAttribute("jsonDepartmentList", jsonDepartmentList);
		model.addAttribute("jsonCounselProList", jsonCounselProList);
	}

	
	@GetMapping("/counselList")
	public String counselList(Model model, Principal principal) {
		String userCd = principal.getName();
		
		List<CounselVO> data = this.counselService.counselList(userCd);
		model.addAttribute("data", data);
		log.info("data" + data);
		return "student/counsel/counselList";
	}
	
	@GetMapping("/counselPreList")
	public String counselPreList(Model model, Principal principal) {
		String userCd = principal.getName();
		List<CounselVO> data = this.counselService.counselList(userCd);
		model.addAttribute("data", data);
		model.addAttribute("now", new Date());
		log.info("data" + data);
		return "student/counsel/counselPreList";
	}

	@GetMapping("/counselApp")
	public String counselApp(Model model) {
		model.addAttribute("now", new Date());
		return "student/counsel/counselApp";
	}

	@PostMapping("/counselAppPost")
	public String counselAppPost(CounselVO counselVO, RedirectAttributes redirect) {
		log.warn("counselVO ==> {}", counselVO);
		int result = this.counselService.counselCreatePost(counselVO);
		log.info("counselAppPost->counselVO" + result);
		log.info("수신자 ====>> {}", counselVO.getProCd());
		if (result > 2) {
			redirect.addFlashAttribute("alarm", counselVO.getProCd());
		
			redirect.addFlashAttribute("update", "update");
		}
		return "redirect:/student/counsel/counselList";
	}

	@GetMapping("/counseldetail")
	public String counseldetail(Model model,String cnslCd) {
		CounselVO counselVO=this.counselService.counseldetail(cnslCd);
		log.info("counseldetail->counselVO",counselVO);
		model.addAttribute("counselVO",counselVO);
		return "student/counsel/counselDetail";
	}
	
	@ResponseBody
	@PostMapping("/counselUpdatePost")
	public int counselUpdatePost(@RequestBody CounselVO counselVO) {
		log.info("counselUpdatePost->counselVO = " + counselVO);
		int result=this.counselService.counselUpdatePost(counselVO);
		log.info("counselUpdatePost->counselVO = " + counselVO);
		log.info("counselUpdatePost->result == {}",result);
		return result;
//		return "redirect:/student/counsel/counseldetail?cnslCd="+counselVO.getCnslCd();
	}
	
	@GetMapping("/counselDelete")
	public String counselDelete(String cnslCd,RedirectAttributes redirect) {
		int result = this.counselService.counselDelete(cnslCd);
		if (result == 1) {
			redirect.addFlashAttribute("delete", "delete");
		}
		return "redirect:/student/counsel/counselList";
	}
	
	@ResponseBody
	@GetMapping("/renderHome")
	public List<CounselVO> renderHome(String stuCd){
		return this.counselService.renderHome(stuCd);
	}
}
