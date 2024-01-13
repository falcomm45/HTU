package kr.or.ddit.controller.professor;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.common.PortletService;
import kr.or.ddit.service.student.LectureService;
import kr.or.ddit.service.student.StudentService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/professor")
public class ProfessorController {
	
	private final EtcUtil etcUtil;
	
	private final PortletService portletService;
	
	private final LectureService lectureService;

	private final StudentService studentService;
	
	@GetMapping("/mypage")
	public String mypage(Model model) {
		
		UserVO userVO = etcUtil.getUserVO();
		
		model.addAttribute("jsonUserVO", etcUtil.getJsonList(userVO));
		model.addAttribute("jsonPortletList", etcUtil.getJsonList(this.portletService.myPortlet(userVO.getUserCd())));
		
		
		return "pro_home";
	}
	
	@GetMapping("/getLectureList")
	@ResponseBody
	public List<LectureVO> getLectureList(Principal principal) {
		return this.lectureService.getLectureList(principal.getName());
	}
	
	@PostMapping("/getTimeTable")
	@ResponseBody
	public List<LectureVO> getTimeTable(@RequestBody LectureApplyVO lectureApplyVO) {
		return this.lectureService.getTimeTable(lectureApplyVO);
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
}
