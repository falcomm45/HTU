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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.service.professor.LectureNoticeService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.util.ParamArticlePage;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureNoticeVO;
import kr.or.ddit.vo.LectureVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasRole('ROLE_PROFESSOR')")
@RequestMapping("/professor")
public class LectureNoticeController {
	
	@Autowired
	LectureNoticeService lectureNoticeService; 
	@Autowired
	FileUtil fileUtil;
	@Autowired
	EtcUtil etcUtil;
	@Autowired
	LectureMapper lectureMapper;
	
	@ModelAttribute
	/** 개설된 강의에 대한 정보를 알기위한 메서드*/
	public void lectureList(Model model, Principal principal) {
		
		String proCd = principal.getName();
		
		List<LectureVO> lectureVOList = this.lectureNoticeService.lectureList(proCd);
		
		model.addAttribute("lectureVOList", lectureVOList);
		
	}
	
//	/**
//	 * 해당 강의 이름
//	 * @param model
//	 * @param lecCd
//	 */
//	@ModelAttribute
//	public void lectureNm(Model model, @RequestParam String lecCd) {
//		
//		String lectureNm = this.lectureMapper.lectureNm(lecCd);
//
//		model.addAttribute("lectureNm", lectureNm);
//	}
	
	@GetMapping("/lecturenotice/list")
	/** 강의공지사항 리스트 */
	public String lectureNoticeList(Model model,  @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "lecCd") String lecCd ) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("lecCd", lecCd);
		
		int total = this.lectureNoticeService.getTotal(map);
		
		List<LectureNoticeVO> lectureNoticeVOList = this.lectureNoticeService.lectureNoticeList(map);
		
		log.info("lectureNoticeVOList==>{}", lectureNoticeVOList);
		
		ParamArticlePage<LectureNoticeVO> articlePage = new ParamArticlePage<LectureNoticeVO>(total, currentPage, 10, lectureNoticeVOList);
		articlePage.setUrl("/professor/lecturenotice/list?lecCd=" + lecCd);
		
		model.addAttribute("data", articlePage);
		model.addAttribute("lectureNoticeVOList", lectureNoticeVOList);
		
		return "professor/lecture/detail/lecturenoticelist";
	}
	@GetMapping("lecturenotice/detail")
	/** 강의공지사항 상세 */
	public String lectureNoticeDetail(Model model, String lecnCd) {
		
		LectureNoticeVO lectureNoticeVO = this.lectureNoticeService.lectureNoticeDetail(lecnCd);
		
		model.addAttribute("lectureNoticeVO", lectureNoticeVO);
		
		return "professor/lecture/detail/lecturenoticedetail";
	}
	@GetMapping("/lecturenotice/create")
	/** 강의공지사항 작성 페이지*/
	public String lectureNoticeCreateGet() {
		
		return "professor/lecture/detail/lecturenoticecreate";
	}
	
	
	
	@PostMapping("/lecturenotice/create")
	/** 강의공지사항 작성*/
	public String lectureNoticeCreatePost(LectureNoticeVO lectureNoticeVO, RedirectAttributes redirect) {
		
		log.info("lectureNotiveVO ==> {}", lectureNoticeVO);
		
		int result = this.lectureNoticeService.lectureNoticeCreatePost(lectureNoticeVO);
		
		String lecCd = lectureNoticeVO.getLecCd();
		String lecnCd = lectureNoticeVO.getLecnCd();
		
		
		// 작성된 공지사항의 강의를 듣는 학생의 리스트
		List<EnrolmentVO> enrolmentVOList = this.lectureNoticeService.getStudent(lecCd);
		log.info("알라아암@@ => {}", enrolmentVOList);
		
		// 위의 리스트의 학생들에게 알림보내기 설정
		result += this.lectureNoticeService.lectureNoticeNtf(lecnCd, enrolmentVOList);
		
		String[] strArr = new String[enrolmentVOList.size()];
		for (int i = 0; i < enrolmentVOList.size(); i++) {
			strArr[i] = enrolmentVOList.get(i).getStuCd();
			log.info("알라아암2@@ => {}",enrolmentVOList.get(i).getStuCd());
		}
		
		if (result > 2) {
			// 알림보내기
			redirect.addFlashAttribute("alarm", etcUtil.getJsonList(strArr));
		}
		
		redirect.addFlashAttribute("lecnCreate", 1);
		
		return "redirect:/professor/lecturenotice/list?lecCd=" + lectureNoticeVO.getLecCd();
	}
	@PostMapping("/lecturenotice/update")
	/** 강의공지사항 업데이트 */
	public String lectureNoticeUpdate(LectureNoticeVO lectureNoticeVO, RedirectAttributes redirect) {
		
		int result = this.lectureNoticeService.lectureNoticeUpdate(lectureNoticeVO);
		redirect.addFlashAttribute("lecnUpdate", 1);
		
		return "redirect:/professor/lecturenotice/list?lecCd=" + lectureNoticeVO.getLecCd();
	}
	@PostMapping("/lecturenotice/delete")
	@ResponseBody
	public LectureNoticeVO lectureNoticeDelete(@RequestBody LectureNoticeVO lectureNoticeVO) {
		
		int result = this.lectureNoticeService.lectureNoticeDelete(lectureNoticeVO);
		
		return lectureNoticeVO;
	}
	@ResponseBody
	@PostMapping("/fileuploadCKNotice")
	public Map<String, Object> image(MultipartHttpServletRequest request) throws Exception{
		
		return this.fileUtil.uploadCkEditor(request);
		
	}
}










