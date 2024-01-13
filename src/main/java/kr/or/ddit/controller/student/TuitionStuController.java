package kr.or.ddit.controller.student;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.student.TuitionStuService;
import kr.or.ddit.vo.TuitionVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 학생이 등록금을 조회하고 납부하는 컨트롤러
 * @author PC-01
 *
 */
@Slf4j
@Controller
@RequestMapping("/student/tuition")
public class TuitionStuController {

	@Autowired
	TuitionStuService tuitionService; 
	
	/**
	 * 나의 등록금 조회
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("/myTuition")
	public String myTuition(Model model, Principal principal) {
		
		String stuCd = principal.getName();
		
		List<TuitionVO> tuitionVOList = this.tuitionService.myTuition(stuCd);
		log.info("myTuition->tuitionVOList : {}", tuitionVOList);
		
		model.addAttribute("tuitionVOList", tuitionVOList);
		
		return "student/tutionAndScholarship/tuitionList";
	}
	
	@ResponseBody
	@GetMapping("/bill")
	public TuitionVO bill(String tutCd) {
		
		log.info("bill->tutCd : {}", tutCd);
		
		TuitionVO tuitionVO = this.tuitionService.bill(tutCd);
		log.info("bill->tuitionVO : {}", tuitionVO);
		
		return tuitionVO;
	}
}
