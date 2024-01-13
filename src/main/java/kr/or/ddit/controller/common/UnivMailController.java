package kr.or.ddit.controller.common;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.mapper.UserMapper;
import kr.or.ddit.service.common.UnivMailService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.FilesDetailVO;
import kr.or.ddit.vo.UnivMailVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 교내 메일 컨트롤러
 * @author 전유빈
 *
 */
@Slf4j
@Controller
@RequestMapping("/mail")
public class UnivMailController {
	
	@Autowired
	UnivMailService univMailService;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	FileUtil fileUtil;
	
	@ModelAttribute
	public void userList(Model model) {
		List<UserVO> userVOList = this.userMapper.userList();
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonUserList = "";
		try {
			jsonUserList = objectMapper.writeValueAsString(userVOList);
		} catch (JsonProcessingException e) {
			log.error(e.getMessage());
		}
		model.addAttribute("userVOList", userVOList);
		model.addAttribute("jsonUserList", jsonUserList);
	}
	
	/**
	 * 읽지 않은 메일 개수
	 * @param model
	 * @param principal
	 */
	@ModelAttribute
	public void getUnreadMail(Model model, Principal principal) {
		
		String umlReceiver = principal.getName();
		
		int unreadTotal = this.univMailService.getUnreadTotal(umlReceiver);
		log.info("getUnreadMail->unreadTotal : {}", unreadTotal);
		
		model.addAttribute("unreadTotal", unreadTotal);
	}

	/**
	 * 받은 메일함
	 * @param model
	 * @param principal
	 * @param keyword
	 * @param currentPage
	 * @return
	 */
	@GetMapping("/inbox")
	public String inbox(Model model, Principal principal,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		String umlReceiver = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("umlReceiver", umlReceiver);
		
		List<UnivMailVO> data = this.univMailService.inbox(map);
		log.info("inbox->data : {}", data);
		
		model.addAttribute("data", data);
		
		//받은 메일함 전체 항목 개수(검색 포함)
		int total = this.univMailService.getTotalInbox(map);
		log.info("inbox->total : {}", total);
		model.addAttribute("total", total);

		ArticlePage<UnivMailVO> articlePage 
			= new ArticlePage<UnivMailVO>(total, currentPage, 10, data);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("articlePage", articlePage);
		
		articlePage.setUrl("/mail/inbox");
		
		return "mail/inbox";
	}
	
	/**
	 * 보낸 메일함
	 * @param model
	 * @param principal
	 * @param keyword
	 * @param currentPage
	 * @return
	 */
	@GetMapping("/sentbox")
	public String sentbox(Model model, Principal principal,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		String umlSender = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("umlSender", umlSender);
		
		List<UnivMailVO> data = this.univMailService.sentbox(map);
		log.info("sentbox->data : {}", data);
		
		model.addAttribute("data", data);

		//보낸 메일함 전체 항목 개수(검색 포함)
		int total = this.univMailService.getTotalSentbox(map);
		log.info("sentbox->total : {}", total);
		model.addAttribute("total", total);
		
		ArticlePage<UnivMailVO> articlePage 
		= new ArticlePage<UnivMailVO>(total, currentPage, 10, data);
	
		model.addAttribute("keyword", keyword);
		model.addAttribute("articlePage", articlePage);
		
		articlePage.setUrl("/mail/sentbox");
		
		return "mail/sentbox";
	}
	
	/**
	 * 메일 작성
	 * @param model
	 * @param principal
	 * @return
	 */
	@GetMapping("/sendMail")
	public String sendMail(Model model, Principal principal, String umlCd) {
		String umlSender = principal.getName();
		model.addAttribute("umlSender", umlSender);
		
		//받은 메일 답장 시
		log.info("sendMail : {}", umlCd);
		if(umlCd != null) {
			UnivMailVO mailVO = this.univMailService.receiveMailDetail(umlCd);
			model.addAttribute("mailVO", mailVO);
		}
		
		return "mail/sendMail";
	}
	
	@PostMapping("/sendMailPost")
	public String sendMailPost(UnivMailVO univMailVO, Principal principal, RedirectAttributes redirect) {
	
		String sender = principal.getName();
		log.info("sender : {}", sender);
		
		univMailVO.setUmlSender(sender);
	
		int result = this.univMailService.sendMail(univMailVO);
		log.info("sendMailPost->univMailVO : {}", univMailVO);
		
		log.info("result : {}", result);
		
		if(result > 1) {
			if(univMailVO.getUmlTemp() == 0) {
				redirect.addFlashAttribute("alarm", univMailVO.getUmlReceiver());
				return "redirect:/mail/sentbox";
			//메일 임시 저장 시
			}else {
				return "redirect:/mail/tempMailBox";
			}
		}else {
			return null;
		}
	}
	
	/**
	 * 받은 메일 상세
	 * @param umlCd
	 * @param model
	 * @return
	 */
	@GetMapping("/receiveDetail")
	public String receiveMailDetail(String umlCd, Model model) {
		
		UnivMailVO univMailVO = this.univMailService.receiveMailDetail(umlCd);

		log.info("receiveMailDetail->univMailVO : {}", univMailVO);
		
		if(univMailVO.getUmlYn() == 0) {
			//메일 읽음
			int umlYn = this.univMailService.readReceiveMail(umlCd);
			log.info("umlYn : {}", umlYn);
		}
		
		model.addAttribute("univMailVO", univMailVO);
		
		return "mail/receiveDetail";
	}
	
	/**
	 * 보낸 메일 상세
	 * @param umlCd
	 * @param model
	 * @return
	 */
	@GetMapping("/sendDetail")
	public String sendMailDetail(String umlCd, Model model) {
		
		UnivMailVO univMailVO = this.univMailService.sendMailDetail(umlCd);
		log.info("sendMailDetail->univMailVO : {}", univMailVO);
		
		model.addAttribute("univMailVO", univMailVO);
		
		return "mail/sendDetail";
	}
	
	/**
	 * 받은 메일 삭제
	 * @param umlCd
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteReceiveMail")
	public String deleteReceiveMail(String umlCd) {
		log.info("umlCd : {}", umlCd);
		
		int result = this.univMailService.deleteMail(umlCd);
		
		if(result > 0) {
			return "/inbox";
		}else {
			return null;
		}
	}
	
	/**
	 * 보낸 메일 삭제
	 * @param umlCd
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteSentMail")
	public String deleteSentMail(String umlCd) {
		log.info("umlCd : {}", umlCd);
		
		int result = this.univMailService.deleteMail(umlCd);

		if(result > 0) {
			return "/sentbox";
		}else {
			return null;
		}
	}
	
	/**
	 * 임시 보관함
	 * @param univMailVO
	 * @param principal
	 * @param model
	 * @param keyword
	 * @param currentPage
	 * @return
	 */
	@GetMapping("/tempMailBox")
	public String tempMailBox(UnivMailVO univMailVO, Principal principal, Model model,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="currentPage",required=false,defaultValue="1") int currentPage) {
		
		String umlSender = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("umlSender", umlSender);
		
		List<UnivMailVO> data = this.univMailService.tempMailBox(map);
		log.info("tempMailBox->data : {}", data);
		
		model.addAttribute("data", data);
		
		//임시 보관함 전체 항목 개수(검색 포함)
		int total = this.univMailService.getTotalTempbox(map);
		log.info("tempMailBox->total : {}", total);
		model.addAttribute("total", total);
		
		ArticlePage<UnivMailVO> articlePage 
		= new ArticlePage<UnivMailVO>(total, currentPage, 10, data);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("articlePage", articlePage);
		
		return "mail/tempMailBox";
	}
	
	/**
	 * 임시 메일 작성
	 * @param umlCd
	 * @param model
	 * @return
	 */
	@GetMapping("/tempMail")
	public String tempMail(String umlCd, Model model) {
		
		UnivMailVO univMailVO = this.univMailService.sendMailDetail(umlCd);
		log.info("tempMail->univMailVO : {}", univMailVO);
		
		model.addAttribute("univMailVO", univMailVO);
		
		return "mail/tempMail";
	}
	
	/**
	 * 임시 메일 업데이트
	 * @param univMailVO
	 * @param umlCd
	 * @param principal
	 * @return
	 */
	@PostMapping("/tempMailUpdate")
	public String tempMailUpdate(UnivMailVO univMailVO,String umlCd, Principal principal) {
	
		String sender = principal.getName();
		univMailVO.setUmlSender(sender);
		univMailVO.setUmlCd(umlCd);
		
		int result = this.univMailService.tempMailUpdate(univMailVO);
		
		if(result > 0) {
			return "redirect:/mail/tempMailBox";
		}else {
			return null;
		}
	}
	
	/**
	 * 임시 메일 파일 삭제
	 * @param filesDetailVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/deleteFileUpdate")
	public int deleteFileUpdate(@RequestBody FilesDetailVO filesDetailVO) {
		log.info("deleteFileUpdate->filesDetailVO : {}", filesDetailVO);
		
		int result = this.univMailService.deleteFileUpdate(filesDetailVO);
		
		return result;
	}
	
	/**
	 * 임시 저장 메일 전송
	 * @param univMailVO
	 * @param umlTemp
	 * @param principal
	 * @return
	 */
	@PostMapping("/sendTempMail")
	public String sendTempMail(UnivMailVO univMailVO,int umlTemp, Principal principal) {
		String sender = principal.getName();
		univMailVO.setUmlSender(sender);
		log.info("sendTempMail->univMailVO : {}", univMailVO);
	
		int result = this.univMailService.sendTempMail(univMailVO);
		
		if(result > 0) {
			return "redirect:/mail/sentbox";
		}else {
			return null;
		}
	}
	
	/**
	 * 선택 메일 읽음
	 * @param umlCdList
	 * @return
	 */
	@PostMapping("/readCheck")
	public String readCheck(@RequestBody List<String> umlCdList) {
		log.info("readCheck->umlCdList : {}", umlCdList);
		
		int result = this.univMailService.readCheck(umlCdList);
		
		if(result > 0) {
			return "mail/inbox";
		}else {
			return null;
		}
	}
	
	/**
	 * 선택 메일 삭제
	 * @param umlCdList
	 * @return
	 */
	@PostMapping("/deleteCheck")
	public String deleteCheck(@RequestBody List<String> umlCdList) {
		log.info("deleteCheck->umlCdList : {}", umlCdList);
		
		int result = this.univMailService.deleteMail(umlCdList);
		
		if(result > 0) {
			return "mail/inbox";
		}else {
			return null;
		}
	}
	
	@ResponseBody
	@GetMapping("/getMailByNtfCd")
	public UnivMailVO getMailByNtfCd(String umlCd) {
		return this.univMailService.getMailByNtfCd(umlCd);
	}
	
	/**
	 * ckeditor로 파일 첨부하기
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@PostMapping("/fileuploadCK")
	public Map<String,Object> image(MultipartHttpServletRequest request) throws Exception {
		
		return fileUtil.uploadCkEditor(request);
	}
	
}
