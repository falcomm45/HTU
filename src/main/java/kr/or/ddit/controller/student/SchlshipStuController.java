package kr.or.ddit.controller.student;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.student.SchlshipStuService;
import kr.or.ddit.vo.SchlshipVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 학생이 장학금을 조회하는 컨트롤러
 * @author PC-01
 *
 */
@Slf4j
@Controller
@RequestMapping("/student/schlship")
public class SchlshipStuController {

	@Autowired
	SchlshipStuService schlshipService;
	
	/**
	 * 나의 장학금 조회
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("/mySchlship")
	public String mySchlship(Model model, Principal principal) {
		
		String stuCd = principal.getName();
		
		List<SchlshipVO> schlshipVOList = this.schlshipService.mySchlship(stuCd);
		log.info("mySchlship->schlshipVOList : {}", schlshipVOList);
		
		model.addAttribute("schlshipVOList", schlshipVOList);
		
		return "student/tutionAndScholarship/schlshipList";
	}
}
