package kr.or.ddit.controller.student;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.student.EnrolmentService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.CreditVO;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.UserVO;
import kr.or.ddit.vo.WishLectureVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/student/enrolment")
public class EnrolmentController {
	
	private final EnrolmentService enrolmentService;
	
	private final EtcUtil etcUtil;
	
	@GetMapping("/list")
	public String list(Model model) {
		
		UserVO userVO = etcUtil.getUserVO();
		// login 사용자 id
		String userCd = userVO.getUserCd();
		
		log.info("login userVO ==> {}", userVO);
		
		CreditVO creditVO = new CreditVO(userVO.getStudentVO().getDepartmentVO().getCollegeVO());
		
		String colNm = enrolmentService.getColNm(userCd);
		
		creditVO.setColNm(colNm);
		
		// 해당 사용자의 신청 가능 강의 조회
		List<LectureVO> lectureList = this.enrolmentService.list(userVO.getStudentVO());
		
		String jsonLecture = etcUtil.getJsonList(lectureList);
		String jsonUser = etcUtil.getJsonList(userVO);
		
		log.info("lectureList ==> {}", lectureList);
		
		model.addAttribute("creditVO", creditVO);
		
		model.addAttribute("lectureList", lectureList);
		
		model.addAttribute("jsonLecture", jsonLecture);
		
		model.addAttribute("jsonUser", jsonUser);
		
		return "student/enrolment/enlist";
	}
	
	@GetMapping("/app")
	public String app(Model model) {
		UserVO userVO = etcUtil.getUserVO();
		// login 사용자 id
		String userCd = userVO.getUserCd();
		
		log.info("login userVO ==> {}", userVO);
		
		CreditVO creditVO = new CreditVO(userVO.getStudentVO().getDepartmentVO().getCollegeVO());
		
		String colNm = enrolmentService.getColNm(userCd);
		
		creditVO.setColNm(colNm);
		
		// 해당 사용자의 신청 가능 강의 조회
		List<LectureVO> lectureList = this.enrolmentService.list(userVO.getStudentVO());
		log.info("@@ ==> {}", lectureList);
		// 해당 강의를 수강하는 수강신청 목록 조회
		for (LectureVO lectureVO : lectureList) {
			List<EnrolmentVO> enrolmentList = this.enrolmentService.getEnrolmentList(lectureVO.getLecCd());
			lectureVO.setEnrolmentList(enrolmentList);
		}
		
		// 접속한 유저의 수강리스트 가져오기
		List<EnrolmentVO> enrolmentList = this.enrolmentService.getEnrolmentListByStuCd(userVO.getStudentVO().getStuCd());
		userVO.getStudentVO().setEnrolmentList(enrolmentList);
		
		List<WishLectureVO> wishLectureList = this.enrolmentService.getWishLectureListByStuCd(userCd);
		
		String jsonLecture = this.etcUtil.getJsonList(lectureList);
		String jsonUser = this.etcUtil.getJsonList(userVO);
		
		log.info("lectureList ==> {}", lectureList);
		
		model.addAttribute("creditVO", creditVO);
		
		model.addAttribute("lectureList", lectureList);
		
		model.addAttribute("jsonLecture", jsonLecture);
		
		model.addAttribute("jsonUser", jsonUser);
		
		model.addAttribute("wishLectureList", wishLectureList);
		
		return "student/enrolment/enapp";
	}
	
	@PostMapping("/addWishLecture")
	@ResponseBody
	public int addWishLecture(@RequestBody WishLectureVO wishLectureVO) {
		return this.enrolmentService.addWishLecture(wishLectureVO);
	}
	
	@PostMapping("/removeWishLecture")
	@ResponseBody
	public int removeWishLecture(@RequestBody WishLectureVO wishLectureVO) {
		return this.enrolmentService.removeWishLecture(wishLectureVO);
	}
	
	@PostMapping("/insertEnrolment")
	@ResponseBody
	public int insertEnrolment(@RequestBody EnrolmentVO enrolmentVO) {
		log.info("enrolmentVO ==> {}", enrolmentVO);
		return this.enrolmentService.insertEnrolment(enrolmentVO);
	}
	
	
	@GetMapping("/searchLecture")
	@ResponseBody
	public List<LectureVO> searchLecture(String lecNm) {
		
		UserVO userVO = etcUtil.getUserVO();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("lecNm", lecNm);
		paramMap.put("stuYear", userVO.getStudentVO().getStuYear());
		paramMap.put("stuSem", userVO.getStudentVO().getStuSem());
		
		return this.enrolmentService.searchLecture(paramMap);
	}
	
	@GetMapping("/getWishLectureList")
	@ResponseBody
	public List<WishLectureVO> getWishLectureList(String stuCd) {
		return this.enrolmentService.getWishLectureListByStuCd(stuCd);
	}
	
	@GetMapping("/changeMenu")
	@ResponseBody
	public List<LectureVO> changeMenu(String keyword) {
		return this.enrolmentService.changeMenu(keyword);
	}
	
	
	@PostMapping("/cancelEnrolment")
	@ResponseBody
	public int cancelEnrolment(@RequestBody EnrolmentVO enrolmentVO) {
		return this.enrolmentService.cancelEnrolment(enrolmentVO);
	}
	
	
}
