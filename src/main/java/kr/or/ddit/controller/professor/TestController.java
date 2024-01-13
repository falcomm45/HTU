package kr.or.ddit.controller.professor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.service.professor.LectureNoticeService;
import kr.or.ddit.service.professor.TestService;
import kr.or.ddit.service.student.TestStuService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.TestApplyVO;
import kr.or.ddit.vo.TestDetailVO;
import kr.or.ddit.vo.TestQuestionVO;
import kr.or.ddit.vo.TestVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/professor/test")
public class TestController {

	@Autowired
	TestService testService;

	@Autowired
	TestStuService testStuService;
	
	@Autowired
	LectureNoticeService lectureNoticeService;
	
	@Autowired
	LectureMapper lectureMapper;
	
	@Autowired
	NotificationMapper notificationMapper;
	
	@Autowired
	EtcUtil etcUtil;
	
	/**
	 * 해당 강의 이름
	 * @param model
	 * @param lecCd
	 */
	@ModelAttribute
	public void lectureNm(Model model, @RequestParam String lecCd) {
		
		String lectureNm = this.lectureMapper.lectureNm(lecCd);

		model.addAttribute("lectureNm", lectureNm);
	}

	/**
	 * 시험 목록
	 * 
	 * @param model
	 * @param lecCd
	 * @return
	 */
	@GetMapping("/testList")
	public String testList(Model model, @RequestParam String lecCd) {

		List<TestVO> testVOList = this.testService.testList(lecCd);
		log.info("testList->testVOList : {}", testVOList);

		model.addAttribute("testVOList", testVOList);

		return "professor/lecture/detail/testlist";
	}

	/**
	 * 시험 등록
	 * 
	 * @return
	 */
	@GetMapping("/testCreate")
	public String testCreate() {
		return "professor/lecture/detail/testcreate";
	}

	@PostMapping("/testCreatePost")
	public String testCreatePost(TestVO testVO, RedirectAttributes redirect) {

		testVO.setTestCd(testVO.getLecCd() + testVO.getTestOpt());
		log.info("testCreatePost->testVO : {}", testVO);

		int result = this.testService.testCreatePost(testVO);
		log.info("testCreatePost->testVO2 : {}", testVO);

		List<EnrolmentVO> enrolmentList = lectureNoticeService.getStudent(testVO.getLecCd());
		
		NotificationVO notificationVO = new NotificationVO();
		
		for (EnrolmentVO enrolmentVO : enrolmentList) {
			notificationVO.setUserCd(enrolmentVO.getStuCd());
			notificationVO.setComdCd("ALAM01");
			notificationVO.setNtfUrl("/student/test/testList?lecCd=" + enrolmentVO.getLecCd());
			notificationVO.setNtfCon(this.lectureMapper.getLectureNm(enrolmentVO.getLecCd()));
			this.notificationMapper.insert(notificationVO);
		}
		
		String[] strArr = new String[enrolmentList.size()];
		for (int i = 0; i < strArr.length; i++) {
			strArr[i] = enrolmentList.get(i).getStuCd();
		}

		if (result > 0) {
			redirect.addFlashAttribute("alarm", etcUtil.getJsonList(strArr));
			return "redirect:/professor/test/testList?lecCd=" + testVO.getLecCd();
		} else {
			return null;
		}
	}

	/**
	 * 시험 상세
	 * 
	 * @param testCd
	 * @param model
	 * @return
	 */
	@GetMapping("/testDetail")
	public String testDetail(@RequestParam String testCd, Model model) {

		log.info("testDetail->testCd : {}", testCd);

		TestVO testVO = this.testService.testDetail(testCd);
		log.info("testDetail->testVO : {}", testVO);

		// 시험 문제 리스트
		List<TestQuestionVO> tqVOList = this.testService.tqVOList(testCd);
		log.info("testDetail->tqVOList : {}", tqVOList);

		model.addAttribute("tqVOList", tqVOList);
		model.addAttribute("testVO", testVO);

		return "professor/lecture/detail/testdetail";
	}

	/**
	 * 시험 수정
	 * 
	 * @param testVO
	 * @return
	 */
	@PostMapping("/testUpdate")
	public String testUpdate(TestVO testVO) {

		log.info("testUpdate->testVO : {}", testVO);

		int result = this.testService.testUpdate(testVO);

		if (result > 0) {
			return "redirect:/professor/test/testList?lecCd=" + testVO.getLecCd();
		} else {
			return null;
		}
	}

	/**
	 * 시험 응시 결과
	 * @param testCd
	 * @param lecCd
	 * @param model
	 * @return
	 */
	@GetMapping("/testResultList")
	public String testResultList(@RequestParam String testCd, @RequestParam String lecCd, Model model) {

		TestVO testVO = this.testService.testDetail(testCd);
		log.info("testResultList->testVO : {}", testVO);

		List<TestApplyVO> testApplyVOList = this.testService.testResultList(testVO);
		log.info("testResultList->testResultList : {}", testApplyVOList);

		model.addAttribute("testVO", testVO);
		model.addAttribute("testApplyVOList", testApplyVOList);

		return "professor/lecture/detail/testresultlist";
	}

	/**
	 * 시험 결과 상세 - 교수
	 * @param teaCd
	 * @param model
	 * @return
	 */
	@GetMapping("/testResult")
	public String testResult(@RequestParam String teaCd, Model model) {

		TestApplyVO testApplyVO = this.testService.testResult(teaCd);
		log.info("testResult->testApplyVO : {}", testApplyVO);

		TestVO testVO = this.testService.testDetail(testApplyVO.getTestCd());
		log.info("testResult->testVO : {}", testVO);

		List<TestDetailVO> testDetailVOList = this.testStuService.testResultDetail(testApplyVO.getTeaCd());
		log.info("testResult->testDetailVOList : {}", testDetailVOList);

		List<TestQuestionVO> testQuestionVOList = this.testService.tqVOList(testApplyVO.getTestCd());
		log.info("testResult->testQuestionVOList : {}", testQuestionVOList);

		testApplyVO.setTestDetailVOList(testDetailVOList);
		testApplyVO.setTestQuestionVOList(testQuestionVOList);

		model.addAttribute("testVO", testVO);
		model.addAttribute("testApplyVO", testApplyVO);

		return "professor/lecture/detail/testresult";
	}

}
