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
import kr.or.ddit.service.professor.LectureDataService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.util.ParamArticlePage;
import kr.or.ddit.vo.LectureDataVO;
import kr.or.ddit.vo.LectureVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@PreAuthorize("hasRole('ROLE_PROFESSOR')")
@RequestMapping("/professor")
public class LectureDataController {
	
	@Autowired
	LectureDataService lectureDataService;
	@Autowired
	FileUtil fileUtil;
	@Autowired
	LectureMapper lectureMapper;
	
	@ModelAttribute
	/** 개설된 강의에 대한 정보를 알기위한 메서드*/
	public void lectureList(Model model, Principal principal) {
		String proCd = principal.getName();
		List<LectureVO> lectureVOList = this.lectureDataService.lectureList(proCd);
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
	
	@GetMapping("/lecturedata/list")
	public String lectureDataList(Model model,  @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "lecCd") String lecCd, Principal principal) {
		
		String proCd = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("lecCd", lecCd);
		map.put("proCd", proCd);
		
		int total = this.lectureDataService.getTotal(map);
		
		List<LectureDataVO> lectureDataVOList = this.lectureDataService.lectureDataList(map);
		
		ParamArticlePage<LectureDataVO> articlePage = new ParamArticlePage<LectureDataVO>(total, currentPage, 10, lectureDataVOList);
		articlePage.setUrl("/professor/lecturedata/list?lecCd=" + lecCd);
		
		model.addAttribute("data", articlePage);
		
		return "professor/lecture/detail/lecturedatalist";
	}
	
	@GetMapping("/lecturedata/detail")
	public String lectureDataDetail(Model model, String lecdCd) {
		
		LectureDataVO lectureDataVO = this.lectureDataService.lectureDataDetail(lecdCd);
		
		model.addAttribute("lectureDataVO", lectureDataVO);
		
		return "professor/lecture/detail/lecturedatadetail";
	}
	
	@GetMapping("/lecturedata/create")
	public String lectureDataCreateGet() {
		
		return "professor/lecture/detail/lecturedatacreate";
	}
	
	@PostMapping("/lecturedata/create")
	public String lectureDataCreatePost(LectureDataVO lectureDataVO, RedirectAttributes redirect) {
		
		this.lectureDataService.lectureDataCreatePost(lectureDataVO);
		redirect.addFlashAttribute("lecturedataCreate", 1);
		
		return "redirect:/professor/lecturedata/list?lecCd=" + lectureDataVO.getLecCd();
	}
	
	@PostMapping("/lecturedata/update")
	public String lectureDataUpdate(LectureDataVO lectureDataVO, RedirectAttributes redirect) {
		
		this.lectureDataService.lectureDataUpdate(lectureDataVO);
		redirect.addFlashAttribute("lecturedataUpdate", 1);
		
		return "redirect:/professor/lecturedata/list?lecCd=" + lectureDataVO.getLecCd();
	}
	@ResponseBody
	@PostMapping("/lecturedata/delete")
	public int lectureDataDelete(@RequestBody LectureDataVO lectureDataVO) {
		
		String lecdCd = lectureDataVO.getLecdCd();
		log.info("lecdCd ==> {}", lecdCd);
		int result = this.lectureDataService.lectureDataDelete(lecdCd);
		
		return result;
	}
	@ResponseBody
	@PostMapping("/fileuploadCKData")
	public Map<String, Object> image(MultipartHttpServletRequest request) throws Exception{
		
		return fileUtil.uploadCkEditor(request);
	}

}














