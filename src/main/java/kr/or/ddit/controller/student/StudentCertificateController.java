package kr.or.ddit.controller.student;

import java.security.Principal;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.mapper.CertificateMapper;
import kr.or.ddit.service.common.CertificateService;
import kr.or.ddit.vo.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/student")
public class StudentCertificateController {
	
	@Autowired
	CertificateService certificateService;
	@Autowired
	CertificateMapper certificateMapper;
	
	@ModelAttribute
	/** 로그인한 학생의 정보 */
	public void getStuPrivacyInfo(Model model, Principal principal) {
		
		String stuCd = principal.getName();
		
		StudentVO stuPrivacyInfoVO = this.certificateService.stuPrivacyInfo(stuCd);
		
		model.addAttribute("stuPrivacyInfoVO", stuPrivacyInfoVO);
		
	}
	
	@GetMapping("/certificate/payment")
	/** 증명서 발급 결제 화면 */
	public String certificatePayment() {
		
		return "student/certificate/payment";
	}
	
	@GetMapping("/certificate/paymentGraduation")
	/** 증명서 발급 결제 화면 */
	public String certificatePayment2() {
		
		return "student/certificate/paymentGraduation";
	}
	
	@GetMapping("/graduate/certificate/issued")
	/** 졸업증명서 */
	public String graduateCertificate() {
		
		return "student/certificate/graduateCertificate";
		
	}
	@GetMapping("/emrolment/certificate/issued")
	/** 재학증명서 */
	public String enrolmentCertificate() {
		
		return "student/certificate/enrolmentCertificate";
		
	}
	
}
