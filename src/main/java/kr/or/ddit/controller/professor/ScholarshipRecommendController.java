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

import kr.or.ddit.mapper.CommonMapper;
import kr.or.ddit.mapper.StudentMapper;
import kr.or.ddit.service.professor.ScholarshipRecommendService;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.RoomVO;
import kr.or.ddit.vo.ScholarshipRecommendVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasRole('ROLE_PROFESSOR')")
@RequestMapping("/professor/scholarshipRecommend")
/** 강의계획신청 컨트롤러 */
public class ScholarshipRecommendController {

	@Autowired
	ScholarshipRecommendService scholarshipRecommendService;
	
	@Autowired
	StudentMapper StudentMapper;

	@ModelAttribute
	@GetMapping("/list")
	/** 교수가 조회/추천하는 학생의 정보 */
	public String getStudent(Model model, Principal principal) {
		
		String proCd = principal.getName();
		
		List<StudentVO> data = this.scholarshipRecommendService.getStudent(proCd);
		log.info("data==> {}", data);
		
		model.addAttribute("data", data);
		
		return "professor/scholarshipRecommend/list";
	}
	
	@GetMapping("/recommendApplyList")
	public String recommendApplyList(Principal principal, Model model) {
		
		String proCd = principal.getName();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
//		int total = this.scholarshipRecommendService.getTotal(map);
		
		map.put("proCd", proCd);
		
		List<ScholarshipRecommendVO> list = this.scholarshipRecommendService.getRecommendedList(map);
		
		model.addAttribute("list", list);
		
		return "professor/scholarshipRecommend/recommendApplyList";
	}
	
	
	@ResponseBody
	@PostMapping("/getStudent")
    public StudentVO getStudentDetails(@RequestBody StudentVO studentVO) {
		//StudentVO(stuCd=21101001,...
		log.info("getStudentDetails->studentVO : " + studentVO);
        // 여기서 학생 상세 정보를 가져오는 서비스 또는 매퍼 호출
        StudentVO studentDetails = this.StudentMapper.getStudentDetails(studentVO.getStuCd());
        
        return studentDetails;
	   }
	
	@ResponseBody
	@PostMapping("/applySCH")
	public int createScholarshipRecommend(@RequestBody ScholarshipRecommendVO scholarshipRecommendVO, Principal principal) {
		
//		String proCd = principal.getName();
//		scholarshipRecommendVO.setProCd(proCd);
		
		log.info("scholarshipRecommendVO : " + scholarshipRecommendVO);
		
		return this.scholarshipRecommendService.createScholarshipRecommend(scholarshipRecommendVO, principal);
		
		
	}
	
	
}






