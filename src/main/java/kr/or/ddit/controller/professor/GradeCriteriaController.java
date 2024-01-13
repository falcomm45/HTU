package kr.or.ddit.controller.professor;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.professor.GradeCriteriaService;
import kr.or.ddit.vo.GradeCriteriaVO;
import kr.or.ddit.vo.LectureVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@PreAuthorize("hasRole('ROLE_PROFESSOR')")
@RequestMapping("/professor")
public class GradeCriteriaController {
	
	@Autowired
	GradeCriteriaService gradeCriteriaService;
	
	@ModelAttribute
	/** 개설된 강의에 대한 정보를 알기위한 메서드*/
	public void lectureList(Model model, Principal principal) {
		
		String proCd = principal.getName();
		
		List<LectureVO> lectureVOList = this.gradeCriteriaService.lectureList(proCd);
		
		model.addAttribute("lectureVOList", lectureVOList);
		
	}
	@GetMapping("/gradecriteria/create")
	public String gradeCriteriaCreateGet() {
		
		return "professor/lecture/detail/gradecriteriacreate";
	}
	
	@PostMapping("/gradecriteria/create")
	public String gradeCriteriaCreatePost(GradeCriteriaVO gradeCriteriaVO, RedirectAttributes redirect) {
		
		this.gradeCriteriaService.gradeCriteriaCreatePost(gradeCriteriaVO);
		
		redirect.addFlashAttribute("grcrCreate", 1);
		
		return "redirect:/professor/lecture/detail?lecCd=" + gradeCriteriaVO.getLecCd();
	}
}




















