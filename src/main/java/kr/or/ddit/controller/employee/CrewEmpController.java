package kr.or.ddit.controller.employee;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.controller.student.CrewController;
import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.service.employee.CrewEmpService;
import kr.or.ddit.service.student.CrewService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.CrewPersonnelVO;
import kr.or.ddit.vo.CrewVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 학사 관리자 동아리 컨트롤러
 * @author 전유빈
 *
 */
@Slf4j
@Controller
@RequestMapping("/employee/crew")
public class CrewEmpController {

	@Autowired
	CrewEmpService crewEmpService;
	
	@Autowired
	CrewService crewService; 
	
	@Autowired
	ApprovalMapper approvalMapper;
	
	/**
	 * 동아리 개설 신청 내역
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("/crewAppList")
	public String crewAppList(Model model, Principal principal) {
		
		//결재를 받은 사람 = 현재 user
		String appTarget = principal.getName();
		log.info("appTarget : {}", appTarget);
		
		//승인 내역
		List<ApprovalVO> appVOList = this.approvalMapper.crewAppList(appTarget);
		log.info("appVOList : {}", appVOList);

		//미승인 내역
		List<ApprovalVO> newAppVOList = this.approvalMapper.newCrewAppList(appTarget);
		log.info("newAppVOList : {}", newAppVOList);
		
		model.addAttribute("appVOList", appVOList);
		model.addAttribute("newAppVOList", newAppVOList);
		
		return "employee/crew/crewAppList";
	}
	
	/**
	 * 동아리 개설 승인
	 * @param crewVO
	 * @return
	 */
	@PostMapping("/crewApp")
	public String crewApp(@RequestBody CrewVO crewVO) {

		log.info("crewApp->crewVO : {}", crewVO);
		
		ApprovalVO appVO = new ApprovalVO();
		appVO.setAppCd(crewVO.getAppCd());
		appVO.setAppYn(1);
		int result = this.approvalMapper.updateApprovalYn(appVO);
		
		//동아리 개설 승인 상태 변경
		result += this.crewEmpService.crewUpdateYn(crewVO.getAppCd());
		
		CrewPersonnelVO crewPersonnelVO = new CrewPersonnelVO();
		crewPersonnelVO.setStuCd(crewVO.getStuCd());
		crewPersonnelVO.setAppCd(crewVO.getAppCd());
		crewPersonnelVO.setCrCd(crewVO.getCrCd());
		
		//동아리 회장 등록
		result += this.crewEmpService.crewJoinApp(crewPersonnelVO);
		
		if(result > 0) {
			return "redirect:/employee/crew/crewAppList";
		}else {
			return null;
		}
	}
	
	/**
	 * 동아리 개설 반려
	 * @param appVO
	 * @return
	 */
	@PostMapping("/crewAppReturn")
	public String crewAppReturn(@RequestBody ApprovalVO appVO) {
		
		log.info("crewAppReturn->appVO : {}", appVO);
		
		//동아리 개설 승인 상태 변경
		int result = this.approvalMapper.updateApprovalYn(appVO);
		
		if(result > 0) {
			return "redirect:/employee/crew/crewAppList";
		}else {
			return null;
		}
	}
	
	/**
	 * 동아리 조회 (학사 관리자)
	 * @param model
	 * @param keyword
	 * @return
	 */
	@GetMapping("/crewList")
	public String crewList(Model model,
			@RequestParam(value="keyword",required=false) String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		List<CrewVO> crewVOList = this.crewEmpService.crewListEmp(map);
		log.info("crewList->crewVOList : {}", crewVOList);
		
		//총 동아리 수
		int total = this.crewEmpService.crewTotal();
		
		//운영 동아리 수
		int totalAct = this.crewEmpService.actCrewTotal();
		
		model.addAttribute("crewVOList", crewVOList);
		model.addAttribute("total", total);
		model.addAttribute("totalAct", totalAct);
		
		return "employee/crew/crewList";
	}
	
	/**
	 * 동아리 상세 (학사 관리자)
	 * @param crCd
	 * @param model
	 * @return
	 */
	@GetMapping("/crewDetail")
	public String crewDetail(String crCd, Model model) {
		
		CrewVO crewVO = this.crewEmpService.crewDetailEmp(crCd);
		log.info("crewDetail->crewVO : {}", crewVO);
		
		//동아리원 조회
		List<CrewVO> crewPersonnelList = this.crewService.crewPersonnel(crCd);
		
		model.addAttribute("crewPersonnelList", crewPersonnelList);
		model.addAttribute("crewVO", crewVO);
		
		return "employee/crew/crewDetail";
	}
	
	/**
	 * 동아리 폐쇄
	 * @param crCd
	 * @return
	 */
	@PostMapping("/deleteCrew")
	public String deleteCrew(@RequestBody String crCd) {

		log.info("deleteCrew->crCd : {}", crCd);
		
		int result = this.crewEmpService.deleteCrew(crCd);
		
		//동아리원 삭제
		result += this.crewEmpService.deleteCrewPerson(crCd);
		
		if(result > 0) {
			return "redirect:/employee/crew/crewList";
		}else {
			return null;
		}
	}
	
	/**
	 * 동아리 개설 신청서 조회
	 * @param crCd
	 * @param model
	 * @return
	 */
	@ResponseBody
	@GetMapping("/crewAppForm")
	public CrewVO crewAppForm(String crCd, Model model) {
		
		log.info("crewAppForm->crCd : {}", crCd);
		
		CrewVO crewVO = this.crewEmpService.crewAppForm(crCd);
		log.info("crewAppForm->crewVO : {}", crewVO);
		
		model.addAttribute("crewVO", crewVO);
		
		return crewVO;
	}
}
