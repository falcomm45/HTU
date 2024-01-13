package kr.or.ddit.controller.professor;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.mapper.CommonMapper;
import kr.or.ddit.mapper.DepartmentMapper;
import kr.or.ddit.mapper.RoomMapper;
import kr.or.ddit.service.professor.LectureApplyService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.RoomVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@PreAuthorize("hasRole('ROLE_PROFESSOR')")
@RequestMapping("/professor")
/** 강의계획신청 컨트롤러*/
public class LectureApplyController {
	
	@Autowired
	LectureApplyService lectureApplyService;
	
	@Autowired
	CommonMapper commonMapper;
	@Autowired
	DepartmentMapper departmentMapper;
	@Autowired
	RoomMapper roomMapper;
	
	@ModelAttribute
	/** 승인받을 관리자 목록의 정보*/
	public void getEmployee(Model model) {
		
		List<UserVO> userVOList = this.lectureApplyService.getEmployee();
		
		model.addAttribute("employeeList", userVOList);
		
	}
	
	@ModelAttribute
	/** 학과에 대한 정보를 현재 컨트롤러에서 모두 쓰기위한 메서드*/
	public void getDepartment(Model model) {
		
		List<DepartmentVO> departmentVOList = this.departmentMapper.getDepartment();
		
		model.addAttribute("departmentVOList", departmentVOList);
	}
	
	@ModelAttribute
	/** 호실에 대한 정보를 현재 컨트롤러에서 모두 쓰기위한 메서드*/
	public void getRoom(Model model, Principal principal) {
		
		String proCd = principal.getName();
		
		String depCd = this.roomMapper.getProfessorDepartment(proCd);
		
		List<RoomVO> roomVOList = this.roomMapper.getRoomCd(depCd);
		
		model.addAttribute("roomVOList", roomVOList);
	}
	
	@GetMapping("/lectureapply/create")
	/**강의계획신청 페이지로 이동*/
	public String create() {
		
		return "professor/lectureapply/create";
	}
	
	@PostMapping("/lectureapply/create")
	/**결재 데이터 생성 -> 강의계획신청데이터생성*/
	public String createLectureApplyConsent(LectureApplyVO lectureApplyVO, RedirectAttributes redirect) {
		
		int result = this.lectureApplyService.createLectureApplyApproval(lectureApplyVO);
		log.info("result => {}", result);
		log.info("수신 => {}", lectureApplyVO.getApprovalVO().getAppTarget());
		
		if(result > 2) {
			redirect.addFlashAttribute("alarm", lectureApplyVO.getApprovalVO().getAppTarget());
		}
			redirect.addFlashAttribute("applyCreate", 1);
		
		return "redirect:/professor/lectureapply/list?appYn=0";
	}
	@GetMapping("/lectureapply/list")
	public String standbyLectureApplyList(Model model, Principal principal) {
		
		String proCd = principal.getName();
		
		List<LectureApplyVO> standbyLectureApplyVOList = this.lectureApplyService.standbyLectureApplyList(proCd);
		List<LectureVO> approveLectureApplyVOList = this.lectureApplyService.approveLectureApplyList(proCd);
		List<LectureApplyVO> returnLectureApplyVOList = this.lectureApplyService.returnLectureApplyList(proCd);
		
		model.addAttribute("standbyLectureApplyVOList", standbyLectureApplyVOList);
		model.addAttribute("approveLectureApplyVOList", approveLectureApplyVOList);
		model.addAttribute("returnLectureApplyVOList", returnLectureApplyVOList);
		
		return "professor/lecture/list/lectureApplyList";
	}
	
	@GetMapping("/lectureapply/detail")
	public String proLectureApplyDetail(Model model, Principal principal, String lecaCd) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		String proCd = principal.getName();
		
		map.put("proCd", proCd);
		map.put("lecaCd", lecaCd);
		
		LectureApplyVO lectureApplyVO = this.lectureApplyService.proLectureApplyDetail(map);
		model.addAttribute("lectureApplyVO", lectureApplyVO);
		
		return "professor/lecture/list/lectureApplyDetail";
	}

	
}
