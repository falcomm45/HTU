package kr.or.ddit.controller.professor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.service.professor.LectureAttendanceService;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.LectureVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/professor/lectureAttendance")
@RequiredArgsConstructor
@Slf4j
public class LectureAttendanceController {
	
	private final LectureAttendanceService attendanceService;
	
	@Autowired
	LectureMapper lectureMapper;
//	
//	/**
//	 * 해당 강의 이름
//	 * @param model
//	 * @param lecCd
//	 */
//	@ModelAttribute
//	public void lectureNm(Model model, @RequestParam String lecCd) {
//		
//		String lectureNm = this.lectureMapper.lectureNm(lecCd);
//
//		model.addAttribute("lectureNm", lectureNm);
//	}
	
	@GetMapping
	public String attendance(Model model, String lecCd) {
		
		LectureVO lectureVO = this.attendanceService.detail(lecCd);
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String lecture = "";
		
		log.info("lectureVO ==> {}", lectureVO);
		
		try {
			lecture = objectMapper.writeValueAsString(lectureVO);
		} catch (JsonProcessingException e) {
			log.error(e.getMessage());
		}
		
		// vo 타입
		model.addAttribute("lectureVO", lectureVO);
		
		// json 타입
		model.addAttribute("lecture", lecture);
		
		return "professor/lecture/detail/attendance";
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public int insert(@RequestBody AttendanceVO attendanceVO) {
		
		log.info("attendanceVO ==> {}", attendanceVO);
		
		int cnt = this.attendanceService.insert(attendanceVO);
		
		return cnt;
	}
	
	@PostMapping("/update")
	@ResponseBody
	public int update(@RequestBody AttendanceVO attendanceVO) {
		log.info("attendanceVO ==> {}", attendanceVO);
		
		int cnt = this.attendanceService.update(attendanceVO);
		
		return cnt;
	}

}
