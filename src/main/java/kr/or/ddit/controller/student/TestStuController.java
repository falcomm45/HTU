package kr.or.ddit.controller.student;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.student.LectureService;
import kr.or.ddit.service.student.TestStuService;
import kr.or.ddit.vo.TestApplyVO;
import kr.or.ddit.vo.TestDetailVO;
import kr.or.ddit.vo.TestQuestionVO;
import kr.or.ddit.vo.TestVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/student/test")
public class TestStuController {

	@Autowired
	TestStuService testService;
	
	@Autowired
	LectureService lectureService; 
	
	/**
	 * 해당 강의 이름
	 * @param model
	 * @param lecCd
	 */
	@ModelAttribute
	public void lectureVO(Model model, @RequestParam String lecCd) {
		
		String lectureNm = this.lectureService.lectureNm(lecCd);

		model.addAttribute("lectureNm", lectureNm);
	}
	
	/**
	 * 시험 목록
	 * @param model
	 * @param lecCd
	 * @return
	 */
	@GetMapping("/testList")
	public String testList(Model model, @RequestParam String lecCd, Principal principal) {
		
		List<TestVO> testVOList = this.testService.testList(lecCd);
		log.info("testList->testVOList : {}", testVOList);
		
		model.addAttribute("testVOList", testVOList);
		
		return "student/lecture/detail/testlist";
	}
	
	/**
	 * 시험 상세
	 * @param testCd
	 * @param model
	 * @return
	 */
	@GetMapping("/testDetail")
	public String testDetail(@RequestParam String testCd, Model model) {
		
		log.info("testDetail->testCd : {}", testCd);
		
		//시험 상세
		TestVO testVO = this.testService.testDetail(testCd);
		log.info("testDetail->testVO : {}", testVO);
		
		//시험 문제 리스트
		List<TestQuestionVO> tqVOList = this.testService.tqVOList(testCd);
		log.info("testDetail->tqVOList : {}", tqVOList);
		
		model.addAttribute("tqVOList", tqVOList);
		model.addAttribute("testVO", testVO);
		
		return "student/lecture/detail/testdetail";
	}
	
	/**
	 * 시험 제출
	 * @param testApplyVO
	 * @param principal
	 * @return
	 */
	@PostMapping("/testApply")
	public String testApply(TestApplyVO testApplyVO, Principal principal) {
		
		testApplyVO.setStuCd(principal.getName());
		log.info("testApply->testApplyVO : {}", testApplyVO);
		
		int result = this.testService.testApply(testApplyVO);
		
		if(result > 0) {
			return "redirect:/student/test/testResult?lecCd=" + testApplyVO.getTestCd().substring(0, testApplyVO.getTestCd().length()-1) + 
					"&testCd=" + testApplyVO.getTestCd() + "&stuCd=" + principal.getName();
		}else {
			return null;
		}
	}
	
	/**
	 * 시험 결과 상세 - 학생
	 * @param model
	 * @param testCd
	 * @param principal
	 * @return
	 */
	@GetMapping("/testResult")
	public String testResult(Model model, @RequestParam String testCd, Principal principal) {
		
		String stuCd = principal.getName();
		
		TestVO testVO = this.testService.testDetail(testCd);
		log.info("testResult->testVO : {}", testVO);
		
		TestApplyVO testApplyVO = this.testService.testResult(testCd, stuCd);
		log.info("testResult->testApplyVO : {}", testApplyVO);
		
		//제출 시험지
		List<TestDetailVO> testDetailVOList = this.testService.testResultDetail(testApplyVO.getTeaCd());
		log.info("testResult->testDetailVOList : {}", testDetailVOList);
		
		////시험 문제 리스트
		List<TestQuestionVO> testQuestionVOList = this.testService.tqVOList(testApplyVO.getTestCd());
		log.info("testResult->testQuestionVOList : {}", testQuestionVOList);
		
		testApplyVO.setTestDetailVOList(testDetailVOList);
		testApplyVO.setTestQuestionVOList(testQuestionVOList);
		
		model.addAttribute("testVO", testVO);
		model.addAttribute("testApplyVO", testApplyVO);
		
		return "student/lecture/detail/testresult";
	}
}
