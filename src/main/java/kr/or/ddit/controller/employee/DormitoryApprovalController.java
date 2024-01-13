package kr.or.ddit.controller.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.service.employee.DormitoryApprovalService;
import kr.or.ddit.util.ArticlePage;
import kr.or.ddit.vo.DormitoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/employee")
public class DormitoryApprovalController {

	@Autowired
	DormitoryApprovalService dormitoryApprovalService;
	
	@GetMapping("/dormitory/list")
	public String dormitoryApprovalList(Model model, @RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
				
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage", currentPage);
		int total = this.dormitoryApprovalService.getTotal(map);
		
		List<DormitoryVO> list = this.dormitoryApprovalService.getDormitoryList(map);
		
		ArticlePage<DormitoryVO> articlePage = new ArticlePage<DormitoryVO>(total, currentPage, 10, list);
		articlePage.setUrl("/emp/dormitory/list");
		
		model.addAttribute("data", articlePage);
		log.info("list : " + list);
		
		return "employee/dormitory/list";
		
	}
	
//	@GetMapping("/dormitory/detail")
//	public String dormitoryApprovalDetail(Model model, String domCd) {
//		
//		DormitoryVO dormitoryVO = this.dormitoryApprovalService.dormitoryDetail(domCd);
//		log.info("dormitoryVO : "  + dormitoryVO);
//		
//		model.addAttribute("dormitoryVO", dormitoryVO);
//		
//		return "employee/dormitory/detail";
//	}
	
	@GetMapping("/dormitory/detail")
    public DormitoryVO getDormitoryDetail(@RequestParam String domCd) {
        // domCd를 기반으로 dormitory 정보 조회
		
		DormitoryVO dormitoryVO = this.dormitoryApprovalService.dormitoryDetail(domCd);
		log.info("dormitoryVO : "  + dormitoryVO);
		
        return dormitoryVO;
    }
	
	@PostMapping("/approval/dormitory")
	public String approvalDormitoryApply(DormitoryVO dormitoryVO, RedirectAttributes redirect) {
		//DormitoryVO(userCd=null, domCd=DO00088, bldCd=BULD10, stuCd=24101001, appCd=454, comdCd=null, domYear=2023
		//, domSem=2, appReg=null, userNm=최주연, comdNm=BULD10, appYn=0, stuYear=1, stuSem=0, userTel=01045273689
		//, userMail=dudo0704@naver.com, userAddr1=null, userReg1=980228, 
			//approvalVO=ApprovalVO(appCd=null, appPcd=null, userCd=null, comdCd=null, appTarget=null, appYn=1
			//, appReg=null, appProdt=null, appRet=, rnum=0, userVO=null, professorVO=null, boardVO=null)
		//, buildingVO=null, userVO=null, commonDetailVO=null, studentVO=null)
		log.info("dormitoryapply : " + dormitoryVO);
		
		int result = this.dormitoryApprovalService.updateApprovalYnAndComdCd(dormitoryVO);
		
		result += this.dormitoryApprovalService.afterUpdate(dormitoryVO);
		if(dormitoryVO.getApprovalVO().getAppYn() == 1) {
	         redirect.addFlashAttribute("domiApply", 1);
	      }else if(dormitoryVO.getApprovalVO().getAppYn() == 2) {
	         redirect.addFlashAttribute("domiApply", 2);
	      };
//		result += this.dormitoryApprovalService.afterUpdate(dormitoryVO);
		
		return "redirect:/employee/dormitory/list";
	}
}


















































