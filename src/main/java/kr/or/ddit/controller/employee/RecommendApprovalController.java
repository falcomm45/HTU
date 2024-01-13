package kr.or.ddit.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.mapper.ScholarshipRecommendMapper;
import kr.or.ddit.mapper.StudentMapper;
import kr.or.ddit.service.employee.RecommendApprovalService;
import kr.or.ddit.vo.ScholarshipRecommendVO;
import kr.or.ddit.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/employee")
public class RecommendApprovalController {

	@Autowired
	RecommendApprovalService recommendApprovalService;
	
	@Autowired
	ScholarshipRecommendMapper scholarshipRecommendMapper;
	
	@Autowired
	StudentMapper StudentMapper;
	
	@GetMapping("/tutionAndScholarship/recommendList")
	public String recommendApplyList(Model model, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		int total = this.recommendApprovalService.getTotal(map);
		
		List<ScholarshipRecommendVO> list = this.recommendApprovalService.getRecommendList(map);
		log.info("list ==> {}", list);
		model.addAttribute("list", list);
		
		
		
		return "employee/tutionAndScholarship/recommendList";
	}
	
	@PostMapping("/approval/recommend")
	public String approvalRecommendApply(ScholarshipRecommendVO scholarshipRecommendVO, RedirectAttributes redirect) {
		
		log.info("scholarshipRecommendVO : " + scholarshipRecommendVO);
		
		int result = this.recommendApprovalService.updateRecommendYn(scholarshipRecommendVO);
		   if(scholarshipRecommendVO.getApprovalVO().getAppYn() == 1) {
		         redirect.addFlashAttribute("recommendApply", 1);
		      }else if(scholarshipRecommendVO.getApprovalVO().getAppYn() == 2) {
		         redirect.addFlashAttribute("recommendApply", 2);
		      };
		return "redirect:/employee/tutionAndScholarship/recommendList";
	}
	
	@ResponseBody
	@PostMapping("/tutionAndScholarship/getStudent")
    public StudentVO getStudentDetails(@RequestBody StudentVO studentVO) {
		//StudentVO(stuCd=21101001,...
		log.info("getStudentDetails->studentVO : " + studentVO);
        // 여기서 학생 상세 정보를 가져오는 서비스 또는 매퍼 호출
        StudentVO studentDetails = this.StudentMapper.getStudentDetails(studentVO.getStuCd());
        log.info("getStudentDetails result: " + studentDetails);
        
        return studentDetails;
	   }
}












































