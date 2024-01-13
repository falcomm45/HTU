package kr.or.ddit.controller.common;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.mapper.MyPageMapper;
import kr.or.ddit.mapper.PublicizeBoardMapper;
import kr.or.ddit.service.mypage.MyPageService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Criteria;
import kr.or.ddit.vo.PageVO;
import kr.or.ddit.vo.PostReportVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/common/mypage")
public class MyPageController {
	
	@Autowired
	MyPageService myPageService;
	
	@Autowired
	MyPageMapper myPageMapper;
	
	@ModelAttribute
	public void getUserInfo(Model model, Principal principal) {

		String userCd = principal.getName();
		
		UserVO userProfileVO = this.myPageService.profile(userCd);
		model.addAttribute("userProfileVO", userProfileVO);
		
	}
	
	@GetMapping("/profile")
	public String profile(Model model, Principal principal) {

//		String userCd = principal.getName();
//		
//		UserVO userProfileVO = this.myPageService.profile(userCd);
//		model.addAttribute("userProfileVO", userProfileVO);
		
		return "common/mypage/profile";
	}
	
	@GetMapping("/profileEdit")
	public String profileEdit(Model model, String userCd, Principal principal, HttpSession session ) {
		
		UserVO userVO = (UserVO) session.getAttribute("userVo");
		
		model.addAttribute("userVO", userVO);
		
		return "common/mypage/profileEdit";
	}
	
	@PostMapping("/profileEditPost")
	public String profileEditPost(UserVO userVO, Model model, HttpSession session) {
		
		
		int result = this.myPageService.profileEditPost(userVO);
		log.info("result : " + result);
		session.setAttribute("userVo", userVO);
		
		return "redirect:/common/mypage/profileEdit?userCd="+userVO.getUserCd();
		
	}
	   
	@GetMapping("passwordEdit")
	public String passwordEdit (Model model, String userCd, Principal principal) {
		
		return "common/mypage/passwordEdit";
	}
	
	@ResponseBody
	@PostMapping("/passEditPost")
	public int passEditPost(@RequestBody UserVO userVO) {
		log.info("userVO ====> {}", userVO);
		return this.myPageService.passEditPost(userVO);
	}
	
	@GetMapping("/myBoardList")
	public String myBoardList(Model model, Criteria cri, Principal principal) {
		
		String userCd = principal.getName();
		
		List<BoardVO> myBoardVOList = this.myPageMapper.myBoardList(userCd);
		
		log.info("myBoardVOList : " + myBoardVOList);
		
		model.addAttribute("myBoardVOList", myBoardVOList);
		
		model.addAttribute("list", myPageService.getMyBoardList(cri));
		
		model.addAttribute("pageMaker", new PageVO(cri, myPageService.getMyBoardTotal(cri)));
		
		log.info("@@ ==> {}", model.getAttribute("pageMaker"));
		
		return "common/mypage/myBoardList";
	}
	
	@GetMapping("/myReportList")
	public String myReportList(Model model, Principal principal) {
		
		String userCd = principal.getName();
		
		List<PostReportVO> myReportList = this.myPageMapper.myReportList(userCd);
		
		log.info("myReportList : " + myReportList);
		
		model.addAttribute("myReportList", myReportList);
		
		return "common/mypage/myReportList";
	}
	
	
}

