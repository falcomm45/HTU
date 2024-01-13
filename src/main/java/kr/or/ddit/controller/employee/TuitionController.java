package kr.or.ddit.controller.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.employee.TuitionService;
import kr.or.ddit.vo.TuitionVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 학사관리자 등록금 컨트롤러
 * @author PC-01
 *
 */
@Slf4j
@Controller
@RequestMapping("/employee/tuition")
public class TuitionController {

	@Autowired
	TuitionService tuitionService; 
	
	/**
	 * 등록금 내역 조회
	 * @param model
	 * @return
	 */
	@GetMapping("/list")
	public String tuitionList(Model model) {
		
		List<TuitionVO> tuitionVOList = this.tuitionService.tuitionList();
		log.info("tuitionList->tuitionVOList : {}", tuitionVOList);
		
		model.addAttribute("tuitionVOList", tuitionVOList);
		
		return "employee/tutionAndScholarship/tuitionList";
	}
}
