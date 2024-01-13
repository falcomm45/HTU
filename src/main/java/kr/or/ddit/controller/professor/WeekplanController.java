package kr.or.ddit.controller.professor;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
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

import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.service.professor.LectureApplyService;
import kr.or.ddit.service.professor.LectureAttendanceService;
import kr.or.ddit.service.professor.WeekplanService;
import kr.or.ddit.service.student.AcademicAdminService;
import kr.or.ddit.service.student.LectureService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.util.ParamArticlePage;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.WeekplanVO;
import lombok.Getter;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
@Getter
@Setter
@Controller
@Slf4j
@PreAuthorize("hasRole('ROLE_PROFESSOR')")
@RequestMapping("/professor")
/**
 * 생성된 강의들의 목록을 보여주고 원하는 강의를 선택한
 * 후 주차별 강의 계획을 등록하는 클래스
 * @author PC-20
 *
 */
public class WeekplanController {
	@Autowired
	WeekplanService weekplanService;
	@Autowired
	LectureApplyService lectureApplyService;
	@Autowired
	LectureMapper lectureMapper; 
	@Autowired
	LectureAttendanceService lectureAttendanceService;
	@Autowired
	AcademicAdminService academicAdminService;
	@Autowired
	EtcUtil etcUtil;
	private List<WeekplanVO> weekplanVOList;
	
	@ModelAttribute
	/** 개설된 강의에 대한 정보를 알기위한 메서드*/
	public void lectureList(Model model, Principal principal) {
		
		String proCd = principal.getName();
		// 현학기의 개설된 강의정보 가져옴
		List<LectureVO> lectureVOList = this.weekplanService.lectureList(proCd);
		// 현학기 이전에 개설된 강의정보를 가져옴
		List<LectureVO> endLectureVOList = this.lectureMapper.endLectureList(proCd);
		
		model.addAttribute("lectureVOList", lectureVOList);
		model.addAttribute("endLectureVOList", endLectureVOList);
		
	}
	
	@GetMapping(value = "/start/lectureList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public  List<Map<String, String>> startLectureList(Principal principal) {
		
		String proCd = principal.getName();
		List<LectureVO> startLectureVOList = this.lectureMapper.startLectureList(proCd);
		List<Map<String, String>> resultList = new ArrayList<>();
		for (LectureVO lectureVO : startLectureVOList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("startLecCd", lectureVO.getLecCd());
			map.put("startLecaNm", lectureVO.getLectureApplyVO().getLecaNm());
			resultList.add(map);
		}
		log.info("@@ ==> {}", startLectureVOList);
		
		return resultList;
	}
	@GetMapping(value = "/end/lectureList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public  List<Map<String, String>> endLectureList(Principal principal) {
		
		String proCd = principal.getName();
		List<LectureVO> endLectureVOList = this.lectureMapper.endLectureNameList(proCd);
		List<Map<String, String>> resultList = new ArrayList<>();
		for (LectureVO lectureVO : endLectureVOList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("endLecCd", lectureVO.getLecCd());
			map.put("endLecaNm", lectureVO.getLectureApplyVO().getLecaNm());
			resultList.add(map);
		}
		log.info("@@ ==> {}", endLectureVOList);
		
		return resultList;
	}
	
	@GetMapping("/lecture/list")
	/** 로그인한 교수의 개설된 강의 목록을 보여주는 메서드*/
	public String lecture() {
		
		return "professor/lecture/detail/list";
	}
	@GetMapping("/endlecture/list")
	/** 로그인한 교수의 종강된 강의 목록을 보여주는 메서드*/
	public String endLecture() {
		
		return "professor/lecture/detail/endlist";
	}
	
	@GetMapping("/lecture/detail")
	/** 개설된 강의에 대한 상세 */
	public String lectureDetail(Model model, String lecCd, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		
		LectureVO lectureVO = this.weekplanService.lectureDetail(lecCd);
		
		log.info("@lecCd ==> {}", lecCd);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("lecCd", lecCd);
		
		List<WeekplanVO> weekplanVOList = this.weekplanService.weekplanList(map);
		List<EnrolmentVO> enrolmentVOList = this.weekplanService.getEnrolmentStudentList(map);
		
		String jsonLectureVO = etcUtil.getJsonList(lectureVO);
		
		model.addAttribute("lectureVO", lectureVO);
		model.addAttribute("jsonLectureVO", jsonLectureVO);
		model.addAttribute("weekplanVOList", weekplanVOList);
		model.addAttribute("enrolmentVOList", enrolmentVOList);
		
		return "professor/lecture/detail/detail";
	}
	@GetMapping("/weekplan/create")
	/** 강의에 대한 주차별계획을 작성하기 위한 jsp를 불러오는 메서드 */
	public String weekplanCreateGet() {
		
		return "professor/lecture/detail/weekplancreate";
	}
	@PostMapping("/weekplan/create")
	/** 주차별계획을 작성하는 메서드 */
	public String weekplanCreatePost(Model model, @ModelAttribute WeekplanController weekplanForm, RedirectAttributes redirect) {
		
		List<WeekplanVO> weekplanVOList = weekplanForm.getWeekplanVOList();
		
		int result = this.weekplanService.weekplanCreatePost(weekplanVOList);
		
		String lecNm = this.weekplanService.getLecName(weekplanVOList.get(0).getLecCd());
		
	    try {
	        lecNm = URLEncoder.encode(lecNm, "UTF-8");
	    } catch (UnsupportedEncodingException e) {
	    	log.error(e.getMessage());
	    }
		
		redirect.addFlashAttribute("weekCreate", 1);
		
		log.info("링크 나오냐 ==> {}", "redirect:/professor/lecture/detail?lecCd=" + weekplanVOList.get(0).getLecCd() + "&lecNm=" + lecNm);
		
		return "redirect:/professor/lecture/detail?lecCd=" + weekplanVOList.get(0).getLecCd() + "&lecNm=" + lecNm;
	}
	
//	@GetMapping("/weekplan/list")
//	/** 주차별계획 리스트 */
//	public String weekplanList(Model model,  @RequestParam(value = "keyword", required = false) String keyword,
//			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
//			@RequestParam(name = "lecCd") String lecCd) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("keyword", keyword);
//		map.put("currentPage", currentPage);
//		map.put("lecCd", lecCd);
//		
//		int total = this.weekplanService.getTotal(map);
//		
//		List<WeekplanVO> weekplanVOList = this.weekplanService.weekplanList(map);
//		
//		ParamArticlePage<WeekplanVO> articlePage = new ParamArticlePage<WeekplanVO>(total, currentPage, 10, weekplanVOList);
//		articlePage.setUrl("/professor/weekplan/list?lecCd=" + lecCd);
//		
//		model.addAttribute("data", articlePage);
//		
//		return "professor/lecture/detail/weekplanlist";
//	}
	
//	@GetMapping("/weekplan/detail")
//	/** 주차별계획 상세 */
//	public String weekplanDetail(Model model, String wpNo, String lecCd) {
//		
//		Map<String, String> map = new HashMap<String, String>();
//		
//		map.put("wpNo", wpNo);
//		map.put("lecCd", lecCd);
//		
//		WeekplanVO weekplanVO = this.weekplanService.weekplanDetail(map);
//		
//		model.addAttribute("weekplanVO", weekplanVO);
//		return "professor/lecture/detail/weekplandetail";
//	}

	@ResponseBody
	@PostMapping("/weekplan/update")
	/** 주차별계획 업데이트 */
	public WeekplanVO weekplanUpdate(@RequestBody WeekplanVO weekplanVO, RedirectAttributes redirect) {
		
		int result = this.weekplanService.weekplanUpdate(weekplanVO);
		redirect.addFlashAttribute("weekUpdate", 1);
		return weekplanVO;
	}
	
	@ResponseBody
	@PostMapping("/weekplan/delete")
	/** 주차별계획 삭제 */
	public WeekplanVO weekplanDelete(@RequestBody WeekplanVO weekplanVO, RedirectAttributes redirect) {
		
		int result = this.weekplanService.weekplanDelete(weekplanVO);
		redirect.addFlashAttribute("weekDelete", 1);
		
		return weekplanVO;
	}
	
	
	@ResponseBody
	@GetMapping("/checkAttendance")
	public int checkAttendance(String lecCd) {
		return this.lectureAttendanceService.count(lecCd);
	}

	@ResponseBody
	@GetMapping("/checkGrade")
	public int checkGrade(String lecCd) {
		return this.academicAdminService.checkGrade(lecCd);
	}
	
	@ResponseBody
	@GetMapping("/endLecture")
	public int endLecture(String lecCd, String maxAtt) {
		return this.academicAdminService.endLecture(lecCd, maxAtt);
	}
	
}






