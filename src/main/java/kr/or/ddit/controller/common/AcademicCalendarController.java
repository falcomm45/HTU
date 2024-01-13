package kr.or.ddit.controller.common;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.mapper.UserMapper;
import kr.or.ddit.service.common.AcademicCalendarService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.AcademicCalendarVO;
import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * 학사일정 컨트롤러
 * @author 전유빈
 *
 */
@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/academicCalendar")
public class AcademicCalendarController {

	private final AcademicCalendarService academicCalendarService;

	private final UserMapper userMapper;
	
	private final EtcUtil etcUtil;
	
	/**
	 * 사용자 공통상세코드를 가져오는 메소드
	 * @param model
	 * @param principal
	 */
	@ModelAttribute
	public void getAuthority(Model model, Principal principal) {
		
		String userCd = principal.getName();
		String comdCd = this.userMapper.getAuthority(userCd);
		model.addAttribute("comdCd", comdCd);
	}

	/**
	 * 학사일정 조회
	 * @param model
	 * @return
	 */
	@GetMapping("/calendar")
	public String calendar(Model model) {

		List<AcademicCalendarVO> academicCalendarList = this.academicCalendarService.getCalendar();
		
		log.info("calendar->academicCalendarList : {}", academicCalendarList);

		model.addAttribute("academicCalendarList", academicCalendarList);

		return "academicCalendar/calendar";
	}
	
	/**
	 * 학사일정 등록 - 관리자만 가능
	 * @param acCalendarVO
	 * @return
	 */
	@PostMapping("/insertCalendar")
	public String insertCalendar(@RequestBody AcademicCalendarVO acCalendarVO, RedirectAttributes redirect) {
        
		log.info("insertCalendar->acCalendarVO : {}", acCalendarVO);
		
		Map<String, Object> paramMap = this.academicCalendarService.insertCalendar(acCalendarVO);
		
		int result = (int)paramMap.get("result");
		
		List<UserVO> userList = (List<UserVO>) paramMap.get("userList");
		
		String[] strArr = new String[userList.size()];
		
		for (int i = 0; i < strArr.length; i++) {
			strArr[i] = userList.get(i).getUserCd();
		}
		
		if(result > 0) {
			redirect.addFlashAttribute("alarm", etcUtil.getJsonList(strArr));
			return "academicCalendar/calendar";
		}else {
			return null;
		}
	}
	
	/**
	 * 학사일정 삭제 - 관리자만 가능
	 * @param acCalendarVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteCalendar")
	public String deleteCalendar(@RequestBody AcademicCalendarVO acCalendarVO) {
        
		log.info("deleteCalendar->acCalendarVO : {}", acCalendarVO);
		
		String acCd = acCalendarVO.getAcCd();
		
		int result = this.academicCalendarService.deleteCalendar(acCd);
		
		if(result > 0) {
			return "academicCalendar/calendar";
		}else {
			return null;
		}
	}
	
	/**
	 * 학사일정 수정 - 관리자만 가능
	 * @param acCalendarVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/updateCalendar")
	public String updateCalendar(@RequestBody AcademicCalendarVO acCalendarVO) {
        
		log.info("updateCalendar->acCalendarVO : {}", acCalendarVO);
		
		int result = this.academicCalendarService.updateCalendar(acCalendarVO);
		
		if(result > 0) {
			return "academicCalendar/calendar";
		}else {
			return null;
		}
	}
	
	@ResponseBody
	@GetMapping("/renderHome")
	public List<AcademicCalendarVO> renderHome() {
		return this.academicCalendarService.getCalendar();
	}

}