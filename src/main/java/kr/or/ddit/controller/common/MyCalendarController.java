package kr.or.ddit.controller.common;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.mapper.UserMapper;
import kr.or.ddit.service.common.AcademicCalendarService;
import kr.or.ddit.service.common.MyCalendarService;
import kr.or.ddit.vo.AcademicCalendarVO;
import kr.or.ddit.vo.MyCalendarVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 개인일정 컨트롤러
 * @author 전유빈
 *
 */
@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/myCalendar")
public class MyCalendarController {

	private final MyCalendarService myCalendarService;

	/**
	 * 개인일정 조회
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("/calendar")
	public String calendar(Model model, Principal principal) {

		String userCd = principal.getName();
		
		List<MyCalendarVO> myCalendarVOList = this.myCalendarService.getCalendar(userCd);
		
		log.info("calendar->myCalendarVOList : {}", myCalendarVOList);

		model.addAttribute("myCalendarVOList", myCalendarVOList);
		model.addAttribute("userCd", userCd);

		return "myCalendar/calendar";
	}
	
	/**
	 * 개인일정 등록
	 * @param myCalendarVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/insertCalendar")
	public String insertCalendar(@RequestBody MyCalendarVO myCalendarVO) {
        
		log.info("insertCalendar->myCalendarVO : {}", myCalendarVO);
		
		int result = this.myCalendarService.insertCalendar(myCalendarVO);
		
		if(result > 0) {
			return "myCalendar/calendar";
		}else {
			return null;
		}
	}
	
	/**
	 * 개인일정 삭제
	 * @param myCalendarVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteCalendar")
	public String deleteCalendar(@RequestBody MyCalendarVO myCalendarVO) {
        
		log.info("deleteCalendar->myCalendarVO : {}", myCalendarVO);
		
		String mcCd = myCalendarVO.getMcCd();
		
		int result = this.myCalendarService.deleteCalendar(mcCd);
		
		if(result > 0) {
			return "myCalendar/calendar";
		}else {
			return null;
		}
	}
	
	/**
	 * 개인일정 수정
	 * @param myCalendarVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/updateCalendar")
	public String updateCalendar(@RequestBody MyCalendarVO myCalendarVO) {
        
		log.info("updateCalendar->myCalendarVO : {}", myCalendarVO);
		
		int result = this.myCalendarService.updateCalendar(myCalendarVO);
		
		if(result > 0) {
			return "myCalendar/calendar";
		}else {
			return null;
		}
	}
	
	@ResponseBody
	@GetMapping("/renderHome")
	public List<MyCalendarVO> renderHome(Principal principal) {
		
		String userCd = principal.getName();
		
		return this.myCalendarService.getCalendar(userCd);
	}

}