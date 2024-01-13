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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.RoomMapper;
import kr.or.ddit.mapper.UserMapper;
import kr.or.ddit.service.student.CrewService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.CrewActivityVO;
import kr.or.ddit.vo.CrewPersonnelVO;
import kr.or.ddit.vo.CrewVO;
import kr.or.ddit.vo.FilesDetailVO;
import kr.or.ddit.vo.RoomVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 학생 동아리 컨트롤러
 * @author 전유빈
 *
 */
@Slf4j
@Controller
@RequestMapping("/student/crew")
public class CrewController {

	@Autowired
	CrewService crewService; 
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	RoomMapper roomMapper;
	
	@Autowired
	ApprovalMapper approvalMapper;
	
	//동아리실 조회
	@ModelAttribute
	public void roomList(Model model) {
		
		List<RoomVO> roomList = this.roomMapper.getCrewRoomCd();
		model.addAttribute("roomList", roomList);
	}
	
	/**
	 * 동아리 조회
	 * @param model
	 * @param keyword
	 * @return
	 */
	@GetMapping("/crewList")
	public String crewList(Model model,
			@RequestParam(value="keyword",required=false) String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		
		List<CrewVO> crewVOList = this.crewService.crewList(map);
		log.info("crewVOList : {}", crewVOList);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("crewVOList", crewVOList);
		
		return "student/crew/crewList";
	}
	
	/**
	 * 나의 동아리
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("/myCrew")
	public String myCrew(Model model, Principal principal) {
		
		String stuCd = principal.getName();
		
		List<CrewVO> myCrew = this.crewService.myCrew(stuCd);
		
		model.addAttribute("myCrew", myCrew);
		
		return "student/crew/myCrew";
	}
	
	/**
	 * 동아리 개설 신청
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("/crewApply")
	public String crewApply(Model model, Principal principal) {
		return "student/crew/crewApply";
	}
	
	@PostMapping("/crewApplyPost")
	public String crewApplyPost(CrewVO crewVO, Principal principal) {
	
		String stuCd = principal.getName();
		
		ApprovalVO appVO = new ApprovalVO();
		appVO.setUserCd(stuCd);
		appVO.setAppTarget("1001");
		appVO.setComdCd("APPR03");
		
		int result = this.approvalMapper.insert(appVO);

		crewVO.setStuCd(stuCd);
		crewVO.setAppCd(appVO.getAppCd());
		
		this.crewService.crewApply(crewVO);
		log.info("crewApplyPost->crewVO : {}", crewVO);
		
		if(result > 0) {
			return "redirect:/student/crew/myAppList";
		}else {
			return null;
		}
	}
	
	/**
	 * 동아리 상세
	 * @param crCd
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("/crewDetail")
	public String crewDetail(String crCd, Model model, Principal principal) {
		
		String userCd = principal.getName();
		log.info("crewDetail->userCd : {}", userCd);
		log.info("crewDetail->crCd : {}", crCd);
		
		CrewVO crewVO = this.crewService.crewDetail(crCd);
		log.info("crewDetail->crewVO : {}", crewVO);
		
		if(userCd.equals(crewVO.getCrLeader())) {
			List<ApprovalVO> approvalVOList = this.approvalMapper.crewJoinList(crCd);
			log.info("crewDetail->approvalVOList : {}", approvalVOList);
			
			model.addAttribute("approvalVOList", approvalVOList);
		}
		
		//동아리 가입 여부 확인
		CrewPersonnelVO crVO = this.crewService.crewJoinCheck(crCd, userCd);
		log.info("crewDetail->crVO : {}", crVO);
		
		//동아리원 조회
		List<CrewVO> crewPersonnelList = this.crewService.crewPersonnel(crCd);
		
		//동아리 활동 내역 조회
		List<CrewActivityVO> crewActVOList = this.crewService.activityList(crCd);
		log.info("activityList->crewActVOList : {}", crewActVOList);
		
		model.addAttribute("crewActVOList", crewActVOList);
		model.addAttribute("crewPersonnelList", crewPersonnelList);
		model.addAttribute("crVO", crVO);
		model.addAttribute("crewVO", crewVO);
		
		return "student/crew/crewDetail";
	}

	/**
	 * 동아리 가입 신청
	 * @param stuCd
	 * @param crCd
	 * @param crLeader
	 * @param crewPersonnelVO
	 * @return
	 */
	@PostMapping("/crewJoin")
	public String crewJoin(String stuCd, String crCd, String crLeader, CrewPersonnelVO crewPersonnelVO) {
		
		log.info("crewJoin->stuCd : {}", stuCd);
		log.info("crewJoin->crCd : {}", crCd);
		log.info("crewJoin->crLeader : {}", crLeader);
		crewPersonnelVO.setStuCd(stuCd);
		crewPersonnelVO.setCrCd(crCd);
		
		//가입 신청 여부(중복 신청 방지)
		CrewVO crewVO = this.crewService.joinAppCheck(stuCd, crCd);
		log.info("crewJoin->crewVO : {}", crewVO);
		
		if(crewVO != null) {
			return "redirect:/student/crew/crewDetail?crCd="+crCd;
		}else {

			ApprovalVO appVO = new ApprovalVO();
			appVO.setUserCd(stuCd);
			appVO.setAppTarget(crLeader);
			appVO.setComdCd("APPR03");
			
			int result = this.approvalMapper.insert(appVO);
			crewPersonnelVO.setAppCd(appVO.getAppCd());
			log.info("crewJoin->appVO : {}", appVO);
			
			if(result > 0) {
				return "redirect:/student/crew/myJoinAppList";
			}else {
				return null;
			}
		}
	}
	
	/**
	 * 동아리 가입 승인
	 * @param appYn
	 * @param appCd
	 * @param userCd
	 * @param crCd
	 * @return
	 */
	@ResponseBody
	@PostMapping("/crewJoinApp")
	public String crewJoinApp(int appYn, String appCd, String userCd, String crCd) {
		
		log.info("crewJoinApp->appYn : {}", appYn);
		log.info("crewJoinApp->appCd : {}", appCd);
		log.info("crewJoinApp->userCd : {}", userCd);
		log.info("crewJoinApp->crCd : {}", crCd);
		
		ApprovalVO appVO = new ApprovalVO();
		appVO.setAppCd(appCd);
		appVO.setAppYn(appYn);
		appVO.setUserCd(userCd);
		appVO.setComdCd("APPR03");
		
		this.approvalMapper.updateApprovalYn(appVO);
		
		
		CrewPersonnelVO crewPersonnelVO = new CrewPersonnelVO();
		crewPersonnelVO.setCrCd(crCd);
		crewPersonnelVO.setStuCd(appVO.getUserCd());
		crewPersonnelVO.setAppCd(appCd);
		
		this.crewService.crewJoinApp(crewPersonnelVO);
		
		return "redirect:/student/crew/crewDetail?crCd="+crCd;
	}
	
	/**
	 * 동아리 가입 반려
	 * @param appYn
	 * @param appCd
	 * @param userCd
	 * @param crCd
	 * @param appRet
	 * @return
	 */
	@PostMapping("/crewReturn")
	public String crewReturn(int appYn, String appCd, String userCd, String crCd, String appRet) {
		
		ApprovalVO appVO = new ApprovalVO();
		appVO.setAppCd(appCd);
		appVO.setAppYn(appYn);
		appVO.setUserCd(userCd);
		appVO.setAppRet(appRet);
		appVO.setComdCd("APPR03");
		
		int result = this.approvalMapper.updateApprovalYn(appVO);
		
		if(result > 0) {
			return "redirect:/student/crew/crewDetail?crCd="+crCd;
		}else {
			return null;
		}
	}
	
	/**
	 * 동아리 수정
	 * @param crCd
	 * @param model
	 * @return
	 */
	@GetMapping("/crewUpdate")
	public String crewUpdate(String crCd, Model model) {
		
		CrewVO crewVO = this.crewService.crewDetail(crCd);
		log.info("crewUpdate->crewVO : {}", crewVO);
		
		model.addAttribute("crewVO", crewVO);
		
		List<CrewVO> crewPersonnelList = this.crewService.crewPersonnel(crCd);
		
		model.addAttribute("crewPersonnelList", crewPersonnelList);
		
		return "student/crew/crewUpdate";
	}
	
	@PostMapping("/crewUpdatePost")
	public String crewUpdatePost(String crCd, CrewVO crewVO, Model model) {
		log.info("crewUpdatePost->crCd : {}", crCd);
		
		int result = this.crewService.crewUpdate(crewVO);
		log.info("crewUpdatePost->crewVO : {}", crewVO);
		
		model.addAttribute("crewVO", crewVO);
		
		if(result > 0) {
			return "redirect:/student/crew/crewDetail?crCd="+crCd;
		}else {
			return null;
		}
	}
	
	/**
	 * 동아리 수정 중 파일 삭제
	 * @param filesDetailVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteFileUpdate")
	public int deleteFileUpdate(@RequestBody FilesDetailVO filesDetailVO) {
		log.info("deleteFileUpdate->filesDetailVO : {}", filesDetailVO);
		
		int result = this.crewService.deleteFileUpdate(filesDetailVO);
		
		return result;
	}
	
	/**
	 * 동아리 탈퇴
	 * @param stuCd
	 * @param crCd
	 * @return
	 */
	@PostMapping("/crewQuit")
	public String crewQuit(String stuCd, String crCd) {
		log.info("crewQuit->stuCd : {}", stuCd);
		log.info("crewQuit->crCd : {}", crCd);
		
		int result = this.crewService.crewQuit(stuCd, crCd);
		if(result > 0) {
			return "student/crew/myCrew";
		}else {
			return null;
		}
	}

	/**
	 * 동아리 개설 신청 내역 조회
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("/myAppList")
	public String myAppList(Model model, Principal principal) {
		
		String userCd = principal.getName();
		
		List<CrewVO> crewVOList = this.crewService.myAppList(userCd);
		log.info("myAppList->crewVOList : {}", crewVOList);
		
		model.addAttribute("crewVOList", crewVOList);
		
		return "student/crew/myAppList";
	}
	
	/**
	 * 동아리 가입 신청 내역 조회
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("/myJoinAppList")
	public String myJoinAppList(Model model, Principal principal) {
		
		String userCd = principal.getName();
		
		List<CrewVO> crewVOList = this.crewService.myJoinAppList(userCd);
		log.info("myJoinAppList->crewVOList : {}", crewVOList);
		
		model.addAttribute("crewVOList", crewVOList);
		
		return "student/crew/myJoinAppList";
	}
	
	/**
	 * 동아리 활동 등록
	 * @param crewActivityVO
	 * @param principal
	 * @return
	 */
	@PostMapping("/addCrewActivity")
	public String addCrewActivity(CrewActivityVO crewActivityVO, Principal principal) {
		
		String userCd = principal.getName();

		crewActivityVO.setUserCd(userCd);
		log.info("addCrewActivity->crewActivityVO : {}", crewActivityVO);
		
		int result = this.crewService.addCrewActivity(crewActivityVO);
		
		if(result > 0) {
			return "redirect:/student/crew/crewDetail?crCd="+crewActivityVO.getCrCd();
		}else {
			return null;
		}
	}
	
	/**
	 * 동아리 활동 상세
	 * @param craCd
	 * @return
	 */
	@ResponseBody
	@GetMapping("/crewActivityDetail")
	public CrewActivityVO crewActivityDetail(String craCd) {
		
		log.info("crewActivityDetail->craCd : {}", craCd);
		
		CrewActivityVO craVO = this.crewService.crewActivityDetail(craCd);
		log.info("crewActivityDetail->craVO : {}", craVO);
		
		return craVO;
	}
	
}






















