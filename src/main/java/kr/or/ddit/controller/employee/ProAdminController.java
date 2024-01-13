package kr.or.ddit.controller.employee;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.service.employee.ProAdminService;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.ProfessorVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;


/**
 * 학사관리자가 교수를 관리하는 메소드
 * @author user
 *
 */
@Slf4j
@Controller
@RequestMapping("/employee/proadmin")
public class ProAdminController {
	
	@Autowired
	ProAdminService proAdminService;
	
	@ModelAttribute
	public void getDepList(Model model) {
		ObjectMapper objectMapper = new ObjectMapper();
		List<DepartmentVO> deptList= this.proAdminService.deptList();
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
	@GetMapping("/proinfo")
	public String proinfolist(Model model) {
		List<ProfessorVO> data = this.proAdminService.proinfolist();
		model.addAttribute("data", data);
		
		log.info("proinfo->vo : {}", data);
		
		return "employee/proadmin/proinfo";
	}
	
	@GetMapping
	public void tree(Model model) {
		List<OrganizationChartVO> chartList = this.proAdminService.chartList();
		model.addAttribute("chartList", chartList);
		
	}
	
// renderTree()의 ajax의 url
	@GetMapping("/list")
	@ResponseBody
	public List<OrganizationChartVO> list() {
		List<OrganizationChartVO> chartList = this.proAdminService.chartList();
		
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
	public List<ProfessorVO> detail(String organizationCode, Model model) {
		List<ProfessorVO> professorList = null;
		log.info("organizationCode ==> {}, length ==> {}", organizationCode, organizationCode.length());
		if (organizationCode.length() == 6) {
			professorList = this.proAdminService.coldetail(organizationCode);
			
		} else if (organizationCode.length() > 6) {
			
			professorList = this.proAdminService.deptdetail(organizationCode);
		} else {
			professorList = this.proAdminService.proinfolist();
			log.info("professorList-> {}",professorList);
		}
		log.info("prodentList =>{}",professorList);
		return professorList;
	}
	
	@ResponseBody
	@PostMapping("/update")
	public int update(@RequestBody UserVO userVO) {
		log.info(" update=>{}", userVO);
		int result = this.proAdminService.update(userVO);
		log.info(" update result : =>{}", result);
		return result;
		
	}
	
	@ResponseBody
	@PostMapping("/upload")
	public int upload(@RequestBody MultipartFile[] file, @RequestPart String userCd) {
		UserVO userVO = new UserVO();
		userVO.setUploadFiles(file);
		userVO.setUserCd(userCd);
		int result = this.proAdminService.upload(userVO);
		log.info("file=>{}",result);
		return result;
	}
	
//	@ResponseBody
//	@PostMapping("/excelUpload")
//	public ProfessorVO excelUpload(@RequestBody MultipartFile file) {
//		
//		return this.proAdminService.excelUpload(file);
//	}
//	
//	@ResponseBody
//	@PostMapping("/registStudent")
//	public String registStudent(@RequestPart("file") MultipartFile[] file, @RequestPart UserVO userVO) {
//		
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		paramMap.put("file", file);
//		paramMap.put("userVO", userVO);
//		
//		int cnt = this.proAdminService.registStudent(paramMap);
//		
//		log.info("cnt ==> {}", cnt);
//		
//		if (cnt > 2) {
//			return userVO.getStudentVO().getDepCd();
//		}
//		return null;
//	}
	
}
