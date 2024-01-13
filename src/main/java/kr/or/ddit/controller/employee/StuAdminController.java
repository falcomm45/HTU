package kr.or.ddit.controller.employee;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.service.employee.StuAdminService;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.RecordVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;


/**
 * 학사관리자가 학생을 관리하는 메소드
 * @author user
 *
 */
@Slf4j
@Controller
@RequestMapping("/employee/stuadmin")
public class StuAdminController {
	
	@Autowired
	StuAdminService stuAdminService;
	
	@ModelAttribute
	public void getDepList(Model model) {
		ObjectMapper objectMapper = new ObjectMapper();
		List<DepartmentVO> deptList= this.stuAdminService.deptList();
		String jsonDepartmentList = "";
		try {
			jsonDepartmentList = objectMapper.writeValueAsString(deptList);
		} catch (JsonProcessingException e) {
			log.error(e.getMessage());
		}
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("jsonDepartmentList", jsonDepartmentList);
	}
	
	//학생관리 리스트 출력
	@GetMapping("/stuinfo")
	public String stuinfolist(Model model) {
		List<StudentVO> data = this.stuAdminService.stuinfolist();
		model.addAttribute("data", data);
		
		log.info("stuinfo->vo : {}", data);
		
		return "employee/stuadmin/stuinfo";
	}
	
	@GetMapping
	public void tree(Model model) {
		List<OrganizationChartVO> chartList = this.stuAdminService.chartList();
		model.addAttribute("chartList", chartList);
		
	}
	
// renderTree()의 ajax의 url
	@GetMapping("/list")
	@ResponseBody
	public List<OrganizationChartVO> list() {
		List<OrganizationChartVO> chartList = this.stuAdminService.chartList();
		
		log.info("chartList => {}", chartList);
		return chartList;
	}
	
	@GetMapping("/{nodeName}")
	public String create(@PathVariable String nodeName, Model model) {
		model.addAttribute("nodeName", nodeName);
		return "tree";
	}
	
	// 노드가 선택될 때 ajax방식으로 db에서 해당 노드에 대한 상세정보를 가져옴 
	@GetMapping("/detail")
	@ResponseBody
	public List<StudentVO> detail(String organizationCode, Model model) {
		List<StudentVO> studentList = null;
		log.info("organizationCode ==> {}, length ==> {}", organizationCode, organizationCode.length());
		if (organizationCode.length() == 6) {
			studentList = this.stuAdminService.coldetail(organizationCode);
			
		} else if (organizationCode.length() > 6) {
			
			studentList = this.stuAdminService.deptdetail(organizationCode);
		} else {
			studentList = this.stuAdminService.stuinfolist();
			log.info("studentList-> {}",studentList);
		}
		log.info("studentList =>{}",studentList);
		return studentList;
	}
	
	@ResponseBody
	@PostMapping("/update")
	public int update(@RequestBody UserVO userVO) {
		log.info(" update=>{}", userVO);
		int result = this.stuAdminService.update(userVO);
		log.info(" update result : =>{}", result);
		return result;
		
	}
	
	@ResponseBody
	@PostMapping("/upload")
	public int upload(@RequestBody MultipartFile[] file, @RequestPart String userCd) {
		UserVO userVO = new UserVO();
		userVO.setUploadFiles(file);
		userVO.setUserCd(userCd);
		int result = this.stuAdminService.upload(userVO);
		log.info("file=>{}",result);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/excelUpload")
	public StudentVO excelUpload(@RequestBody MultipartFile file) {
		
		return this.stuAdminService.excelUpload(file);
	}
	
	@ResponseBody
	@PostMapping("/registStudent")
	public String registStudent(@RequestPart("file") MultipartFile[] file, @RequestPart UserVO userVO) {
		
		log.info("userVO ==> {}", userVO);
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("file", file);
		paramMap.put("userVO", userVO);
		
		int cnt = this.stuAdminService.registStudent(paramMap);
		
		log.info("cnt ==> {}", cnt);
		
		if (cnt > 2) {
			return userVO.getStudentVO().getDepCd();
		}
		return null;
	}
	
	//학적관리리스트 출력
	@GetMapping("/recordAdminList")
	public String recordAdminList(Model model) {
		List<RecordVO> data = this.stuAdminService.recordAdminList();
		model.addAttribute("data", data);
		model.addAttribute("now", new Date());
		return "employee/stuadmin/recordAdminList";
	}
	
	//학적관리 승인
	@GetMapping("/recordUpdate")
	public String recordUpdate(RecordVO recordVO,RedirectAttributes redirect) {
		int result = this.stuAdminService.recordUpdate(recordVO);
		log.info("1st result ==> {}", result);
		result+=this.stuAdminService.stuStatusUpdate(recordVO);
		log.info("2st result ==> {}", result);
		if (result == 2) {
			redirect.addFlashAttribute("update", "update");
		}
		return "redirect:/employee/stuadmin/recordAdminList";
	}
	
	//결재탭에서 학적관리리스트 출력
	@GetMapping("/recordApprovalList")
	public String recordApprovalList(Model model) {
		List<RecordVO> data = this.stuAdminService.recordAdminList();
		model.addAttribute("data", data);
		model.addAttribute("now", new Date());
		return "employee/stuadmin/recordApprovalList";
	}
	
	//결재탭에서 학적관리 승인
	@GetMapping("/recordApprovalUpdate")
	public String recordApprovalUpdate(RecordVO recordVO,RedirectAttributes redirect) {
		int result = this.stuAdminService.recordUpdate(recordVO);
		result+=this.stuAdminService.stuStatusUpdate(recordVO);
		if (result == 2) {
			redirect.addFlashAttribute("update", "update");
		}
		return "redirect:/employee/stuadmin/recordApprovalList";
	}
}
