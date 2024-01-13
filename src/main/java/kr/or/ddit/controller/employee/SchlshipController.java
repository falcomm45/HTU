package kr.or.ddit.controller.employee;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.employee.SchlshipService;
import kr.or.ddit.vo.SchlshipVO;
import kr.or.ddit.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 학사관리자 장학금 컨트롤러
 * @author PC-01
 *
 */
@Slf4j
@Controller
@RequestMapping("/employee/schlship")
public class SchlshipController {
	
	@Autowired
	SchlshipService schlshipService; 

	/**
	 * 장학금 수여 대상 학생 목록
	 * @param model
	 * @return
	 */
	@GetMapping("/awardSchlship")
	public String awardSchlship(Model model) {
		
		List<StudentVO> studentVOList = this.schlshipService.awardSchlship();
		log.info("awardSchlship->studentVOList : {}", studentVOList);
		
		for(StudentVO studentVO : studentVOList) {
			
			//장학금 정보
			SchlshipVO schlshipVO = this.schlshipService.scVO(studentVO.getStuCd());
			log.info("awardSchlship->schlshipVO : {}", schlshipVO);
			
			studentVO.setSchlshipVO(schlshipVO);

		}
		
		model.addAttribute("studentVOList", studentVOList);
		
		return "employee/tutionAndScholarship/awardSchlship";
	}
	
	/**
	 * 장학금 수여
	 * @param schlshipVO
	 * @return
	 */
	@PostMapping("/award")
	public String award(@RequestBody SchlshipVO schlshipVO) {
		
		log.info("award->schlshipVO : {}", schlshipVO);
		int result = this.schlshipService.award(schlshipVO);
		
		if(result > 0) {
			return "employee/tutionAndScholarship/awardSchlship";
		}else {
			return null;
		}
	}
	
	/**
	 * 장학생 조회
	 * @param model
	 * @return
	 */
	@GetMapping("/schlshipList")
	public String schlshipList(Model model) {
		
		List<SchlshipVO> schlshipVOList = this.schlshipService.schlshipList();
		log.info("schlshipList->schlshipVOList : {}", schlshipVOList);
		
		for(SchlshipVO schlshipVO : schlshipVOList) {
			
			//장학생 정보
			StudentVO studentVO = this.schlshipService.stuVO(schlshipVO.getStuCd());
			log.info("schlshipList->studentVO : {}", studentVO);
			
			schlshipVO.setStudentVO(studentVO);
		}
		
		model.addAttribute("schlshipVOList", schlshipVOList);
		
		return "employee/tutionAndScholarship/schlshipList";
	}
	
	/**
	 * 장학생 조회 - 전체 선택
	 * @return
	 */
	@ResponseBody
	@GetMapping("/searchAll")
	public List<SchlshipVO> searchAll() {
		
		List<SchlshipVO> schlshipVOList = this.schlshipService.schlshipList();
		
		for(SchlshipVO scVO : schlshipVOList) {
			
			//장학생 정보
			StudentVO studentVO = this.schlshipService.stuVO(scVO.getStuCd());
			log.info("schlshipList->studentVO : {}", studentVO);
			
			scVO.setStudentVO(studentVO);
		}
		
		return schlshipVOList;
	}
	
	/**
	 * 장학생 조회 - 연도 선택
	 * @param sclYear
	 * @return
	 */
	@ResponseBody
	@PostMapping("/searchYear")
	public List<SchlshipVO> searchYear(String sclYear) {
		
		log.info("searchYear->sclYear : {}", sclYear);
		
		List<SchlshipVO> schlshipVOList = this.schlshipService.searchYear(sclYear);
		
		for(SchlshipVO scVO : schlshipVOList) {
			
			//장학생 정보
			StudentVO studentVO = this.schlshipService.stuVO(scVO.getStuCd());
			log.info("schlshipList->studentVO : {}", studentVO);
			
			scVO.setStudentVO(studentVO);
		}
		
		return schlshipVOList;
	}
	
	/**
	 * 장학생 조회 - 학기 선택
	 * @param sclYear
	 * @param sclSem
	 * @return
	 */
	@ResponseBody
	@PostMapping("/searchSem")
	public List<SchlshipVO> searchSem(String sclYear, String sclSem) {
		
		List<SchlshipVO> schlshipVOList = this.schlshipService.searchSem(sclYear, sclSem);
		
		for(SchlshipVO scVO : schlshipVOList) {
			
			//장학생 정보
			StudentVO studentVO = this.schlshipService.stuVO(scVO.getStuCd());
			log.info("schlshipList->studentVO : {}", studentVO);
			
			scVO.setStudentVO(studentVO);
		}
		log.info("searchSem->schlshipVOList : {}", schlshipVOList);
		
		return schlshipVOList;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
