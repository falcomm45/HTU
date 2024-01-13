package kr.or.ddit.controller.common;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.service.common.CommonService;
import kr.or.ddit.service.common.PortletService;
import kr.or.ddit.service.counsel.CounselService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CommonDetailVO;
import kr.or.ddit.vo.CounselVO;
import kr.or.ddit.vo.PortletVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
public class CommonController {

//	private final PasswordEncoder passwordEncoder;
	
	private final CommonService commonService;
	
	private final NotificationMapper notificationMapper;
	
	private final FileUtil fileUtil;
	
	private final CounselService counselService;
	
	private final PortletService portletService;
	
	private final EtcUtil etcUtil;
	
	@GetMapping("/")
	public String test() {
		return "login";
	}

	@GetMapping("/login")
	public String login(String error, String logout, String expired, String editPass, String auth, Model model) {

		if (error != null)
			model.addAttribute("error", "정보불일치메세지");

		if (logout != null)
			model.addAttribute("logout", "로그아웃메세지");
		
		if (expired != null)
			model.addAttribute("expired", "세션만료 로그아웃");
		
		if (auth != null) {
			String jsonUserVO = etcUtil.getJsonList(etcUtil.getUserVO());
			model.addAttribute("jsonUserVO", jsonUserVO);
		}
			
		
		return "login";
	}
	
	
	/**
	 * 공통코드로 공통상세코드 리스트 가져오기
	 * @param comCd 공통코드
	 * @return
	 */
	@ResponseBody
	@GetMapping("/getCommonDetail")
	public List<CommonDetailVO> getCommonDetail(String comCd) {
		log.error("comCd ==> {}", comCd);
		return this.commonService.getCommonDetails(comCd);
	}
	
	
	@ResponseBody
	@GetMapping("/notification/check")
	public int checkNotification(String ntfCd) {
		log.info("ntfCd ==> {}", ntfCd);
		int cnt = this.notificationMapper.checkNotification(ntfCd);
		log.info(cnt+"");
		return cnt;
	}
	
	
	@GetMapping("/face")
	public String face(Model model) {
		String jsonUserVO = etcUtil.getJsonList(etcUtil.getUserVO());
		model.addAttribute("jsonUserVO", jsonUserVO);
		return "face";
	}
	
	@ResponseBody
	@GetMapping("/common/getCounselByCnslCd")
	public CounselVO getCounselByCnslCd(String cnslCd) {
		return this.counselService.getDetailCounsel(cnslCd);
	}
	
	
	@PostMapping("/common/insertPicture")
	public String insertPicture(MultipartFile[] uploadFile, Principal principal) {
		
		log.info("uploadFile ==> {}", uploadFile);
		
		int cnt = this.fileUtil.uploadFile(uploadFile, principal.getName());
		
		log.info("result ==> {}", cnt);
		
		return "redirect:/common/mypage/profile";
	}
	
	@GetMapping("/sub/community")
	public String community() {
		return "sub/community";
	}
	
	@GetMapping("/common/board/renderHome")
	@ResponseBody
	public List<BoardVO> renderHome(String category) {
		return this.commonService.renderHome(category);
	}
	
	@GetMapping(value ="/common/getLectureName", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String getLectureName(String lecCd) {
		return this.commonService.getLectureName(lecCd);
	}
	
	@GetMapping("/common/myportlet")
	public String myportlet(Model model, Principal principal) {
		
		String userCd = principal.getName();
		
		List<PortletVO> portletList = this.portletService.myPortlet(userCd);
		
		String jsonPortletList = this.etcUtil.getJsonList(portletList);
		
		model.addAttribute("portletList", portletList);
		
		model.addAttribute("jsonPortletList", jsonPortletList);
		
		model.addAttribute("jsonUserVO", this.etcUtil.getJsonList(etcUtil.getUserVO()));
		
		return "common/portlet/myportlet";
	}
	
	
	@ResponseBody
	@PostMapping("/common/appPortlet")
	public int appPortlet(@RequestBody List<PortletVO> portletList, Principal principal) {
		
		String userCd = principal.getName();
		
		log.info("portletList ==> {}", portletList);
		
		portletList.forEach(portlet -> portlet.setUserCd(userCd));
		
		if (this.portletService.checkPortlet(userCd)) {
			return this.portletService.updateAll(portletList);
		} else {
			return this.portletService.insert(portletList);
		}
		
	}
	
	@ResponseBody
	@GetMapping("/common/appPortlet")
	public int appPortlet(String comdCd, Principal principal) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("comdCd", comdCd);
		paramMap.put("userCd", principal.getName());
		paramMap.put("porYn", 0);
		return this.portletService.updatePortlet(paramMap);
	}
	
	@ResponseBody
	@GetMapping("/common/delPortlet")
	public int delPortlet(String comdCd, Principal principal) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("comdCd", comdCd);
		paramMap.put("userCd", principal.getName());
		paramMap.put("porYn", 1);
		return this.portletService.updatePortlet(paramMap);
	}

	@GetMapping("/error/400")
	public String error400() {
		return "error/400";
	}
	
	@GetMapping("/error/404")
	public String error404() {
		return "error/404";
	}
	
	@GetMapping("/error/500")
	public String error500() {
		return "error/500";
	}
}

