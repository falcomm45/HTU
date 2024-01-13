package kr.or.ddit.controller.student;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.service.student.AcademicAdminService;
import kr.or.ddit.service.student.EnrolmentService;
import kr.or.ddit.service.student.ObjectionService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.CreditVO;
import kr.or.ddit.vo.LectureGradeVO;
import kr.or.ddit.vo.ObjectionVO;
import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@RequestMapping("/student/grade")
@Slf4j
public class GradeController {

	private final AcademicAdminService academicAdminService;

	private final EnrolmentService enrolmentService;

	private final EtcUtil etcUtil;
	
	private final ObjectionService objectionService;

	@GetMapping("/gradeList")
	public String lecList(Model model) {
		
		UserVO userVO = etcUtil.getUserVO();

		List<LectureGradeVO> gradeList = this.academicAdminService.getLecList(userVO.getUserCd());

		CreditVO creditVo = new CreditVO(userVO.getStudentVO().getDepartmentVO().getCollegeVO());
		creditVo.setColNm(enrolmentService.getColNm(userVO.getUserCd()));

		String jsonGradeList = etcUtil.getJsonList(gradeList);
		String jsonUserVO = etcUtil.getJsonList(userVO);

		model.addAttribute("creditVO", creditVo);
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("jsonGradeList", jsonGradeList);
		model.addAttribute("jsonUserVO", jsonUserVO);

		return "student/grade/gradeList";
	}
	
	@GetMapping("/objectionList")
	public String objectionList(Model model) {
		UserVO userVO = this.etcUtil.getUserVO();
		String jsonUserVO = this.etcUtil.getJsonList(userVO);
		
		List<LectureGradeVO> gradeList = this.academicAdminService.getLecList(userVO.getUserCd());
		String jsonGradeList = etcUtil.getJsonList(gradeList);
		
		model.addAttribute("jsonUserVO", jsonUserVO);
		model.addAttribute("jsonGradeList", jsonGradeList);
		model.addAttribute("gradeList", gradeList);
		
		return "student/grade/objectionList";
	}
	
	@GetMapping("/appObjection")
	public String appObjection(Model model) {
		UserVO userVO = etcUtil.getUserVO();

		List<LectureGradeVO> gradeList = this.academicAdminService.getLecList(userVO.getUserCd());

		CreditVO creditVo = new CreditVO(userVO.getStudentVO().getDepartmentVO().getCollegeVO());
		creditVo.setColNm(enrolmentService.getColNm(userVO.getUserCd()));

		String jsonGradeList = etcUtil.getJsonList(gradeList);
		String jsonUserVO = etcUtil.getJsonList(userVO);
		
		model.addAttribute("userVO", userVO);
		model.addAttribute("creditVO", creditVo);
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("jsonGradeList", jsonGradeList);
		model.addAttribute("jsonUserVO", jsonUserVO);
		return "student/grade/appObjection";
	}
	
	
	@PostMapping("/appObjection")
	@ResponseBody
	public int appObjection(@RequestBody ObjectionVO objectionVO, Principal principal) {
		String stuCd = principal.getName();
		objectionVO.setStuCd(stuCd);
		log.info("objection ==> {}", objectionVO);
		return this.objectionService.appObjection(objectionVO);
	}

}
