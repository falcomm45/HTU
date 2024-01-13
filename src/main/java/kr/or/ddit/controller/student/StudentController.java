package kr.or.ddit.controller.student;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.service.common.PortletService;
import kr.or.ddit.service.common.ReservationService;
import kr.or.ddit.service.student.AcademicAdminService;
import kr.or.ddit.service.student.EnrolmentService;
import kr.or.ddit.service.student.LectureService;
import kr.or.ddit.service.student.RecordService;
import kr.or.ddit.service.student.StudentService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.CreditVO;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureGradeVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.PortletVO;
import kr.or.ddit.vo.RecordVO;
import kr.or.ddit.vo.ReservationVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/student")
@RequiredArgsConstructor
@Slf4j
public class StudentController {

	private final EtcUtil etcUtil;
	
	private final LectureService lectureService;
	
	private final RecordService recordService;
	
	private final PortletService portletService;
	
	private final ReservationService reservationService;
	
	private final EnrolmentService enrolmentService;
	
	private final AcademicAdminService academinAdminService;
	
	@Autowired
	StudentService studentService;

	@GetMapping("/mypage")
	public String myPage(Model model) {

		UserVO userVO = etcUtil.getUserVO();

		String jsonUserVO = etcUtil.getJsonList(userVO);
		
		List<PortletVO> portletList = this.portletService.myPortlet(userVO.getUserCd());
		
		log.info("jsonUSerVO ==> {}", jsonUserVO);
		
		model.addAttribute("creditVO", new CreditVO(userVO.getStudentVO().getDepartmentVO().getCollegeVO()));
		model.addAttribute("jsonPortletList", etcUtil.getJsonList(portletList));
		model.addAttribute("jsonUserVO", jsonUserVO);

		return "stu_home";
	}

	// renderTree()의 ajax의 url
	@GetMapping("/nodelist")
	@ResponseBody
	public List<OrganizationChartVO> list() {
		List<OrganizationChartVO> chartList = this.studentService.chartList();

		log.info("chartList => {}", chartList);
		return chartList;
	}

	@GetMapping("/{nodeName}")
	public String create(@PathVariable String nodeName, Model model) {
		model.addAttribute("nodeName", nodeName);
		return "trees";
	}
	
	@ResponseBody
	@PostMapping("/getLectureList")
	public List<LectureVO> getlectureList(@RequestBody StudentVO studentVO) {
		log.info("studentVO ==> {}", studentVO);
		return this.lectureService.getLectureList(studentVO);
	}
	
	@ResponseBody
	@GetMapping("/getRecord")
	public List<RecordVO> getRecord(String stuCd) {
		return this.recordService.getRecord(stuCd);
	}
	
	@ResponseBody
	@GetMapping("/getReservationList")
	public List<ReservationVO> getReservationList(String userCd) {
		return this.reservationService.getListByUserCd(userCd);
	}
	
	@ResponseBody
	@PostMapping("/getTimeTable")
	public List<EnrolmentVO> getTimeTable(@RequestBody StudentVO studentVO) {
		return this.lectureService.getLectureDetail(studentVO);
	}
	
	@ResponseBody
	@PostMapping("/getGrade")
	public List<LectureGradeVO> getGrade(@RequestBody StudentVO studentVO) {
		return this.academinAdminService.getGrade(studentVO);
	}
	
	//학생의 학적상태 확인
	@GetMapping("/stuStatus")
	@ResponseBody
	public String sideStatus(Principal principal,Model model){
		String userCd = principal.getName();
		log.info(" sideStatus : userCd=>{}",userCd);
		String res = this.studentService.sideStatus(userCd);
		model.addAttribute("res", res);
		log.info("res=>{}",res);
		return res;
	}
}
