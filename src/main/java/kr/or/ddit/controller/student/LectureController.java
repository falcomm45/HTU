package kr.or.ddit.controller.student;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.mapper.EnrolmentMapper;
import kr.or.ddit.service.student.LectureService;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureNoticeVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TaskVO;
import kr.or.ddit.vo.WeekplanVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/student")
public class LectureController {
	
	@Autowired
	LectureService lectureService;
	@Autowired
	EnrolmentMapper enrolmentMapper;
	
	@ModelAttribute
	public void getEnrolmentLectureList(Model model, Principal principal) {
		String stuCd = principal.getName(); 
		
		// 현재학기 강의정보
		List<EnrolmentVO> enrolmentVOList =  this.lectureService.getEnrolmentLecture(stuCd);
		// 수강했던 강의정보
		List<EnrolmentVO> endEnrolmentVOList = this.enrolmentMapper.endEnrolmentList(stuCd);
		
		model.addAttribute("enrolmentVOList", enrolmentVOList);
		model.addAttribute("endEnrolmentVOList", endEnrolmentVOList);
	}
	
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
	
//	@GetMapping("/lecture/list")
//	/** 로그인한 학생이 수강신청한 강의 목록 */
//	public String getLecture() {
//		
//		return "student/lecture/list";
//	}
	
	
	@GetMapping("/endlecture/list")
	/** 로그인한 학생이 수강했던 강의 목록 */
	public String endLecture() {
		return "";
	}
	
	@GetMapping("/lecture/detail")
	public String enrolmentLectureDetail(Model model, String lecCd, Principal principal) {
		
		String stuCd = principal.getName();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stuCd", stuCd);
		map.put("lecCd", lecCd);
		
		LectureVO lectureVO = this.lectureService.enrolmentLectureDetail(map);
		
		log.info("lecCDDDDD ==> {}", lecCd);
		
		List<WeekplanVO> weekplanVOList = this.lectureService.enrolmentLectureWeekplan(map);
		List<EnrolmentVO> enrolmentVOList = this.lectureService.getEnrolmentStudentList(map);
		log.info("enrolmentVOList@@@ ==> {}", enrolmentVOList);
		
		model.addAttribute("lectureVO", lectureVO);
		model.addAttribute("weekplanVOList", weekplanVOList);
		model.addAttribute("enrolmentList", enrolmentVOList);
		
		return "student/lecture/detail/lecturedetail";
	}



}
