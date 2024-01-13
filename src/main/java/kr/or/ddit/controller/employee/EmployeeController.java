package kr.or.ddit.controller.employee;

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
import kr.or.ddit.service.common.PostReportService;
import kr.or.ddit.service.professor.LectureApplyService;
import kr.or.ddit.service.student.DormitoryService;
import kr.or.ddit.service.student.LectureService;
import kr.or.ddit.service.student.RecordService;
import kr.or.ddit.service.student.StudentService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.DormitoryVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.PortletVO;
import kr.or.ddit.vo.PostReportVO;
import kr.or.ddit.vo.RecordVO;
import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/employee")
public class EmployeeController {
	
	private final StudentService studentService;
	
	private final EtcUtil etcUtil;
	
	private final PortletService portletService;
	
	private final LectureApplyService lectureApplyService;
	
	private final RecordService recordService;
	
	private final DormitoryService dormitoryService;
	
	private final PostReportService postReportService;
	
	@GetMapping("/mypage")
	public String myPage(Model model) {
		
		UserVO userVO = etcUtil.getUserVO();
		
		List<PortletVO> portletList = portletService.myPortlet(userVO.getUserCd());
		
		String jsonUserVO = etcUtil.getJsonList(userVO);
		String jsonPortletList = etcUtil.getJsonList(portletList);
		
		model.addAttribute("jsonUserVO", jsonUserVO);
		model.addAttribute("jsonPortletList", jsonPortletList);
		
		return "emp_home";
	}
	
	// renderTree()의 ajax의 url
	@GetMapping("/nodelist")
	@ResponseBody
	public List<OrganizationChartVO> list() {
		List<OrganizationChartVO> chartList = this.studentService.chartList();

		log.info("chartList => {}", chartList);
		return chartList;
	}
	
	@ResponseBody
	@PostMapping("/renderLectureApply")
	public List<LectureApplyVO> renderLectureApply(@RequestBody ApprovalVO approvalVO) {
		return this.lectureApplyService.renderLectureApply(approvalVO);
	}
	
	@ResponseBody
	@PostMapping("/renderRecord")
	public List<RecordVO> renderRecord(@RequestBody ApprovalVO approvalVO) {
		return this.recordService.renderRecord(approvalVO);
	}
	
	@ResponseBody
	@PostMapping("/renderDormitory")
	public List<DormitoryVO> renderDormitory(@RequestBody ApprovalVO approvalVO) {
		return this.dormitoryService.renderDormitory(approvalVO);
	}
	
	@ResponseBody
	@PostMapping("/renderReport")
	public List<PostReportVO> renderReport(@RequestBody ApprovalVO approvalVO) {
		return this.postReportService.renderReport(approvalVO);
	}
	
	
	@GetMapping("/{nodeName}")
	public String create(@PathVariable String nodeName, Model model) {
		model.addAttribute("nodeName", nodeName);
		return "trees";
	}
	
}
