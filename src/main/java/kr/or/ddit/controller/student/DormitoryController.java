package kr.or.ddit.controller.student;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.student.DormitoryService;
import kr.or.ddit.service.student.StudentService;
import kr.or.ddit.vo.DormitoryVO;
import kr.or.ddit.vo.StudentVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/student/dormitory")
public class DormitoryController {
	
	private final DormitoryService dormitoryService;
	
	
	@GetMapping("/home")
	public String myPage() {
		return "student/dormitory/home";
	}
	
	@GetMapping("/list")
	public String list(Model model, Principal principal) {
		
		String stuCd = principal.getName();
		
		List<DormitoryVO> list = this.dormitoryService.list(stuCd);
		log.info("list : " + list);
		
		model.addAttribute("list",list);
		
		return "student/dormitory/list";
	}
	
	@GetMapping("/apply")
	public String applyDormitory(Model model, Principal principal) {
		
		String stuCd = principal.getName();
		
		model.addAttribute("stuCd", stuCd);
		
		return "student/dormitory/apply";
	}
	
	@PostMapping("/checkDuplicate")
	public ResponseEntity<?> checkDuplicateApplication(@RequestBody DormitoryVO dormitoryVO) {
	   
		boolean isDuplicated = dormitoryService.isDuplicatedApplication(
	       
	    	dormitoryVO.getStuCd(),
	        dormitoryVO.getDomYear(),
	        dormitoryVO.getDomSem()
	    );

	    // 중복 여부를 클라이언트에게 반환
	    Map<String, Object> responseMap = new HashMap<>();
	    responseMap.put("duplicated", isDuplicated);

	    return ResponseEntity.ok(responseMap);
	}
	/**
	 * 기숙사 신청데이터 /student/dormitory/applyPost
	 * @param dormitoryVO
	 * @return
	 */
	@ResponseBody
	@PostMapping("/applyPost")
	public DormitoryVO createApplyDormitoryConsent(@RequestBody DormitoryVO dormitoryVO) {
		
		log.info("dormitoryVO : " + dormitoryVO);
		
		
		int result = this.dormitoryService.createApplyDormitoryConsent(dormitoryVO);
		
		return dormitoryVO;
		
	}
	
	@PostMapping("/payment")
	@ResponseBody // 요청 결과를 HTTP 응답으로 직접 반환하기 위해 사용
	public ResponseEntity<String> paymentDormitory(@RequestBody Map<String, Object> requestData) {
	    // 클라이언트로부터 받은 JSON 데이터를 Map으로 변환하여 수신합니다.
	    String domCd = (String) requestData.get("domCd"); // "domCd" 키에 해당하는 값 가져오기
	    int payYn = (int) requestData.get("payYn");      // "payYn" 키에 해당하는 값 가져오기

	    log.info("domCd: {}, payYn: {}", domCd, payYn);
	    
	    // 수신한 데이터를 가공하여 사용하거나 비즈니스 로직을 수행합니다.
	    Map<String, Object> map = new HashMap<>();
	    map.put("domCd", domCd);
	    map.put("payYn", payYn);

	    try {
	        // 비즈니스 로직을 수행하고, 데이터베이스 등에 업데이트를 합니다.
	        this.dormitoryService.paymentDormitory(map);

	        // 성공적인 응답을 클라이언트에게 반환합니다.
	        return new ResponseEntity<>("Success", HttpStatus.OK);
	    } catch (Exception e) {
	        e.printStackTrace(); 

	        // 에러 발생 시 클라이언트에게 에러 응답을 반환합니다.
	        return new ResponseEntity<>("Error", HttpStatus.INTERNAL_SERVER_ERROR);
	    }
	}
}
