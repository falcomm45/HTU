package kr.or.ddit.controller.professor;

import java.util.List;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.service.professor.LectureObjectionService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.ObjectionVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
@Slf4j
@RequestMapping("/professor/objection")
public class LectureObjectionController {
	
	private final LectureObjectionService lectureObjectionService;
	
	@Autowired
	LectureMapper lectureMapper;
	
	@Autowired
	EtcUtil etcUtil;
	
	/**
	 * 해당 강의 이름
	 * @param model
	 * @param lecCd
	 */
//	@ModelAttribute
//	public void lectureNm(Model model, @RequestParam String lecCd) {
//		
//		String lectureNm = this.lectureMapper.lectureNm(lecCd);
//
//		model.addAttribute("lectureNm", lectureNm);
//	}
	
	@GetMapping("/list")
	public String list(Model model, String lecCd) {
		
		List<ObjectionVO> objectionList = this.lectureObjectionService.list(lecCd);
		
		String jsonObjectionList = etcUtil.getJsonList(objectionList);
		
		model.addAttribute("objectionList", objectionList);
		model.addAttribute("jsonObjectionList", jsonObjectionList);
		
		return "professor/lecture/detail/objectionlist";
	}
	
	@PostMapping("/recognizeObjection")
	@ResponseBody
	public int recognizeObjection(@RequestBody ObjectionVO objectionVO) {
		log.info("objectionVO ==> {}", objectionVO);
		return this.lectureObjectionService.recognizeObjection(objectionVO);
	}
	
	@PostMapping("/companionObjection")
	@ResponseBody
	public int companionObjection(@RequestBody ObjectionVO objectionVO) {
		return this.lectureObjectionService.companionObjection(objectionVO);
	}
}
