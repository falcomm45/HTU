	package kr.or.ddit.controller.student;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.mapper.TaskMapper;
import kr.or.ddit.mapper.TaskSubmitMapper;
import kr.or.ddit.service.professor.LectureDataService;
import kr.or.ddit.service.professor.LectureNoticeService;
import kr.or.ddit.service.student.LectureService;
import kr.or.ddit.service.student.TaskSubmitService;
import kr.or.ddit.util.ParamArticlePage;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.FilesDetailVO;
import kr.or.ddit.vo.LectureDataVO;
import kr.or.ddit.vo.LectureNoticeVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.TaskSubmitVO;
import kr.or.ddit.vo.TaskVO;
import kr.or.ddit.vo.WeekplanVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/student")
public class LectureSynthesisController {
		
	@Autowired
	LectureService lectureService;
	@Autowired
	TaskSubmitService taskSubmitService;
	@Autowired
	TaskMapper taskMapper;
	@Autowired
	LectureMapper lectureMapper; 
	
	@GetMapping("lecture/list")
	/** 로그인한 학생이 수강신청한 강의 목록 */
	public String getLecture(Model model, Principal principal) {
		
		String stuCd = principal.getName(); 
		
		List<EnrolmentVO> enrolmentVOList =  this.lectureService.getEnrolmentLecture(stuCd);
		
		model.addAttribute("enrolmentVOList", enrolmentVOList);
		
		return "student/lecture/list";
	}
	@GetMapping("/aa")
	public String aa() {
		
		return "student/lecture/detail/dd";
	}
	
	@ModelAttribute
	public void emrolmentLecture(Model model, Principal principal) {
		
		String stuCd = principal.getName();
		
		List<EnrolmentVO> enrolmentVOList = this.lectureService.getEnrolmentLecture(stuCd);
		
		model.addAttribute("enrolmentVOList", enrolmentVOList);
		
	}
	@GetMapping(value = "/start/lectureList", produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<Map<String, String>> studentStartLectureList(Principal principal){
		String stuCd = principal.getName();
		List<EnrolmentVO> startLectureVOList = this.lectureMapper.studentStartLectureList(stuCd);
		List<Map<String, String>> resultList = new ArrayList<Map<String,String>>();
		
		for(EnrolmentVO enrolmentVO : startLectureVOList) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("startLecCd", enrolmentVO.getLecCd());
			map.put("startLecaNm", enrolmentVO.getLectureVO().getLectureApplyVO().getLecaNm());
			log.info("강의이름 @ ==> {}", enrolmentVO.getLectureVO().getLectureApplyVO().getLecaNm());
			resultList.add(map);
		}
		return resultList;
	}
	
	
	
	@GetMapping("/lecture/syllabus")
	public String lectureSyllabus(Model model, @RequestParam(name = "lecCd") String lecCd , Principal principal) {
		
		String stuCd = principal.getName();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stuCd", stuCd);
		map.put("lecCd", lecCd);
		
		LectureVO lectureVO = this.lectureService.getLectureSyllabus(map);
		List<WeekplanVO> weekplanVOList = this.lectureService.enrolmentLectureWeekplan(map);
		
		model.addAttribute("lectureVO", lectureVO);
		model.addAttribute("weekplanVOList", weekplanVOList);
		
		return "student/lecture/detail/lectureSyllabus";
	}
	
	
	@GetMapping("/lecturenotice/list")
	public String stuLectureNoticeList(Model model,  @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "lecCd") String lecCd , Principal principal) {
		
		String stuCd = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("stuCd", stuCd);
		map.put("lecCd", lecCd);
		
		int total = this.lectureService.getTotal(map);
		
		List<LectureNoticeVO> lectureNoticeVOList = this.lectureService.stuLectureNoticeList(map);
		
		ParamArticlePage<LectureNoticeVO> articlePage = new ParamArticlePage<LectureNoticeVO>(total, currentPage, 10, lectureNoticeVOList);
		articlePage.setUrl("/student/lecturenotice/list?lecCd=" + lecCd);
		
		model.addAttribute("data", articlePage);
		model.addAttribute("lectureNoticeVOList", lectureNoticeVOList);
		
		return "student/lecture/detail/stulecturenoticelist";
	}
	
	@GetMapping("/lecturenotice/detail")
	public String stuLectureNoticeDetail(Model model, String lecnCd) {
		
		LectureNoticeVO lectureNoticeVO = this.lectureService.stuLectureNoticeDetail(lecnCd);
		
		model.addAttribute("lectureNoticeVO", lectureNoticeVO);
		
		return "student/lecture/detail/stulecturenoticedetail";
	}
	@GetMapping("/count")
	@ResponseBody
	public int count(String lecnCd) {
		
		int cnt = this.lectureService.count(lecnCd);
		
		return cnt;
	}
	
	@GetMapping("/lecturedata/list")
	public String stuLectureDataList(Model model, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "lecCd") String lecCd, Principal principal) {
		
		String stuCd = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("lecCd", lecCd);
		map.put("stuCd", stuCd);
		
		List<LectureDataVO> lectureDataVOList = this.lectureService.stuLectureDataList(map);
		
		model.addAttribute("lectureDataVOList", lectureDataVOList);
		
		
		return "student/lecture/detail/stulecturedatalist";
	}
	
	@GetMapping("/lecturedata/detail")
	public String stuLectureDataDetail(Model model, String lecdCd) {
		
		LectureDataVO lectureDataVO = this.lectureService.stuLectureDataDetail(lecdCd);
		
		model.addAttribute("lectureDataVO", lectureDataVO);
		
		return "student/lecture/detail/stulecturedatadetail";
	}
	
	@GetMapping("/task/list")
	public String stuTaskList(Model model, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name = "lecCd") String lecCd, Principal principal) {
		
		String stuCd = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		map.put("lecCd", lecCd);
		map.put("stuCd", stuCd);
		
		List<TaskVO> taskVOList = this.lectureService.taskList(map);
		List<TaskVO> edTaskVOList = this.lectureService.edTaskList(map);
		
		model.addAttribute("taskVOList",taskVOList);
		model.addAttribute("edTaskVOList",edTaskVOList);
		
		Map<String, Integer> submitCounts = new HashMap<>();
		Map<String, Object> submitCountsMap = new HashMap<>();
	    for (TaskVO taskVO : taskVOList) {
	    	submitCountsMap.put("taskCd", taskVO.getTaskCd());
	    	submitCountsMap.put("stuCd", stuCd);
	        int submitCount = this.lectureService.submitCountByTaskCd(submitCountsMap);
	        submitCounts.put(taskVO.getTaskCd(), submitCount);
	    }
	    model.addAttribute("submitCounts", submitCounts);
		
	    
	    Map<String, Object> endSubmitScoresMap = new HashMap<>();
	    Map<String, Object> endSubmitScores = new HashMap<>();
	    Map<String, Object> endSubmitCountsMap = new HashMap<>();
	    Map<String, Integer> endSubmitCounts = new HashMap<>();
	    for (TaskVO taskVO : edTaskVOList) {
	    	endSubmitCountsMap.put("taskCd", taskVO.getTaskCd());
	    	endSubmitCountsMap.put("stuCd", stuCd);
	    	endSubmitScoresMap.put("taskCd", taskVO.getTaskCd());
	    	endSubmitScoresMap.put("stuCd", stuCd);
	    	int endSubmitCount = this.lectureService.endSubmitCountByTaskCd(endSubmitCountsMap);
	    	
	    	if(endSubmitCount == 1) {
		    	TaskSubmitVO endSubmitScore = this.lectureService.endSubmitScoreByTaskCd(endSubmitScoresMap);
		    	endSubmitScores.put(taskVO.getTaskCd(), endSubmitScore.getTsubScore());
	    	}
	    	
	    	endSubmitCounts.put(taskVO.getTaskCd(), endSubmitCount);
	    }
	    model.addAttribute("endSubmitCounts", endSubmitCounts);
	    model.addAttribute("endSubmitScores", endSubmitScores);
	    
		return "student/lecture/detail/stutasklist";
	}
	
	@GetMapping("/task/detail")
	public String stuTaskDetail(Model model, String taskCd, Principal principal) {
		
		String stuCd = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("taskCd", taskCd);
		map.put("stuCd", stuCd);
		
		TaskVO taskVO = this.lectureService.taskDetail(map);
		TaskSubmitVO taskSubmitVO = this.lectureService.submitTask(map);
		Date sysdate = this.taskMapper.getSysdate();
		
		model.addAttribute("taskVO", taskVO);
		model.addAttribute("taskSubmitVO", taskSubmitVO);
		model.addAttribute("sysdate", sysdate);
		
		return "student/lecture/detail/stutaskdetail";
	}
	
	@PostMapping("/task/submit")
	@ResponseBody
	public List<FilesDetailVO> taskSubmit(@RequestBody MultipartFile[] files, @RequestPart TaskSubmitVO taskSubmitVO) {
		
		taskSubmitVO.setUploadFiles(files);
		
		int result = this.taskSubmitService.taskSubmit(taskSubmitVO);

		List<FilesDetailVO> submitFileList = this.taskSubmitService.submitFileList(taskSubmitVO);
		log.info("@@@@@ ==> {}", taskSubmitVO);
		return submitFileList;
	}
}










