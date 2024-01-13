package kr.or.ddit.controller.professor;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.core.io.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.http.ResponseEntity;

import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.mapper.TaskMapper;
import kr.or.ddit.service.professor.LectureNoticeService;
import kr.or.ddit.service.professor.TaskService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.util.ParamArticlePage;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.TaskSubmitVO;
import kr.or.ddit.vo.TaskVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@PreAuthorize("hasRole('ROLE_PROFESSOR')")
@RequestMapping("/professor")
/**
 * 과제등록을 위한 클래스
 * @author PC-20
 *
 */
public class TaskController {
	@Autowired
	TaskService taskService;
	@Autowired
	FileUtil fileUtil; 
	@Autowired
	EtcUtil etcUtil;
	@Autowired
	TaskMapper taskMapper;
	@Autowired
	LectureMapper lectureMapper;
	
	@ModelAttribute
	/** 개설된 강의에 대한 정보를 알기위한 메서드*/
	public void lectureList(Model model, Principal principal) {
		
		String proCd = principal.getName();
		
		List<LectureVO> lectureVOList = this.taskService.lectureList(proCd);
		
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
	
	@GetMapping("/task/list")
	/** 과제 리스트 */
	public String taskList(Model model,  @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "lecCd") String lecCd ) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("lecCd", lecCd);
		
		int total = this.taskService.getTotal(map);
		
		List<TaskVO> taskVOList = this.taskService.taskList(map);
		List<TaskVO> edTaskVOList = this.taskService.edTaskList(map);
		
		
 		ParamArticlePage<TaskVO> articlePage = new ParamArticlePage<TaskVO>(total, currentPage, 10, taskVOList);
		articlePage.setUrl("/professor/task/list?lecCd=" + lecCd);
		
		model.addAttribute("data", articlePage);
		model.addAttribute("taskVOList", taskVOList);
		model.addAttribute("edTaskVOList", edTaskVOList);
		
	    Map<String, Integer> submitCounts = new HashMap<>();
	    for (TaskVO taskVO : taskVOList) {
	        int submitCount = this.taskService.submitCountByTaskCd(taskVO.getTaskCd());
	        submitCounts.put(taskVO.getTaskCd(), submitCount);
	    }
	    model.addAttribute("submitCounts", submitCounts);
	    
	    Map<String, Integer> endSubmitCounts = new HashMap<>();
	    for (TaskVO taskVO : edTaskVOList) {
	    	int endSubmitCount = this.taskService.endSubmitCountByTaskCd(taskVO.getTaskCd());
	    	endSubmitCounts.put(taskVO.getTaskCd(), endSubmitCount);
	    }
	    model.addAttribute("endSubmitCounts", endSubmitCounts);
		
		return "professor/lecture/detail/tasklist";
	}
	
	@GetMapping("/task/detail")
	/** 과제상세 */
	public String taskDetail(Model model, String taskCd) {
		
		TaskVO taskVO = this.taskService.taskDetail(taskCd);
		
		log.info("taskCd ==> {}", taskCd);
		// 과제 제출한 학생 목록
		List<TaskVO> taskSubmitList = this.taskService.taskSubmitList(taskCd);
		// 과제 제출안한 학생목록
		List<TaskVO> noTaskSubmitList = this.taskService.noTaskSubmitList(taskCd);
		
		Date sysdate = this.taskMapper.getSysdate();
		
		model.addAttribute("taskVO", taskVO);
		model.addAttribute("taskSubmitList", taskSubmitList);
		log.info("!@# ==> {}", taskSubmitList);
		model.addAttribute("noTaskSubmitList", noTaskSubmitList);
		model.addAttribute("sysdate", sysdate);
		
		return "professor/lecture/detail/taskdetail";
	}
	
	@GetMapping("/task/create")
	/** 과제등록 페이지 */
	public String taskCreateGet() {
		
		return "professor/lecture/detail/taskcreate";
	}
	
	@PostMapping("/task/create")
	/** 과제등록 처리 */
	public String taskCreatePost(TaskVO taskVO, RedirectAttributes redirect) {
		
		int result = this.taskService.taskCreatePost(taskVO);
		
		log.info("!@#!@# ==> {}", taskVO.getLecCd());
		
		String lecCd = taskVO.getLecCd();
		String taskCd = taskVO.getTaskCd();
		
		List<EnrolmentVO> enrolmentVOList = this.taskService.getStudent(lecCd);
		
		log.info("!@#!@# ==> {}", enrolmentVOList);
		
		result += this.taskService.taskNtf(taskCd, enrolmentVOList);
		
		String[] strArr = new String[enrolmentVOList.size()];
		for (int i = 0; i < enrolmentVOList.size(); i++) {
			strArr[i] = enrolmentVOList.get(i).getStuCd();
			log.info("알라아암2@@ => {}",enrolmentVOList.get(i).getStuCd());
			
		}
		
		log.info("strArr ==> {}", strArr);
		
		if (result > 2) {
			// 알림보내기
			redirect.addFlashAttribute("alarm", this.etcUtil.getJsonList(strArr));
		}
		
		
		
		redirect.addFlashAttribute("taskCreate", 1);
		
		return "redirect:/professor/task/list?lecCd=" + taskVO.getLecCd();
	}
	@PostMapping("/task/update")
	/** 과제 수정 */
	public String taskUpdate(TaskVO taskVO, RedirectAttributes redirect) {
		
		int result = this.taskService.taskUpdate(taskVO);
		redirect.addFlashAttribute("taskUpdate", 1);
		
		return "redirect:/professor/task/list?lecCd=" + taskVO.getLecCd();
	}
	@ResponseBody
	@PostMapping("/task/delete")
	/** 과제 삭제 */
	public TaskVO taskDelete(@RequestBody TaskVO taskVO, RedirectAttributes redirect) {
		
		int result = this.taskService.taskDelete(taskVO);
		redirect.addFlashAttribute("taskDelete", 1);
		
		return taskVO;
	}
	
	@ResponseBody
	@PostMapping("/fileuploadCKTask")
	public Map<String, Object> image(MultipartHttpServletRequest request) throws Exception{
		
		return fileUtil.uploadCkEditor(request);
	}
	
	@ResponseBody
	@PostMapping("/taskSubmitScore/update")
	public List<Integer> taskSubmitScore(@RequestBody List<TaskSubmitVO> taskSubmitScoreList) {
		
			log.info("@@ ==> {}", taskSubmitScoreList);
			List<Integer> submitScores = new ArrayList<Integer>();
		    for (TaskSubmitVO taskSubmitVO : taskSubmitScoreList) {
		    	Map<String, Object> submitScore = new HashMap<>();
		    	submitScore.put("tsubScore", taskSubmitVO.getTsubScore());
		    	submitScore.put("tsubCd", taskSubmitVO.getTsubCd());
		    	log.info("@@@ ==> {}", submitScore);
		    	if(taskSubmitVO.getTsubScore() != 0) {
		    		int result = this.taskService.taskSubmitScore(submitScore);
		    	}
		    	submitScores.add(taskSubmitVO.getTsubScore());
		    }
		
		return submitScores;
	}
	@ResponseBody
	@PostMapping("/noTaskSubmitScore/update")
	public List<Integer> noTaskSubmitScore(@RequestBody List<TaskSubmitVO> taskSubmitScoreList) {
		
		log.info("@@ ==> {}", taskSubmitScoreList);
		List<Integer> submitScores = new ArrayList<Integer>();
		for (TaskSubmitVO taskSubmitVO : taskSubmitScoreList) {
			Map<String, Object> submitScore = new HashMap<>();
			submitScore.put("tsubScore", taskSubmitVO.getTsubScore());
			submitScore.put("tsubCd", taskSubmitVO.getTsubCd());
			log.info("@@@ ==> {}", submitScore);
			
			int result = this.taskService.taskSubmitScore(submitScore);
			submitScores.add(taskSubmitVO.getTsubScore());
		}
		
		return submitScores;
	}
}






