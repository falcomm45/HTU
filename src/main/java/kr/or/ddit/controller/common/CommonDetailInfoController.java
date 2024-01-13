package kr.or.ddit.controller.common;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.mapper.CommonMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class CommonDetailInfoController {
	
	@Autowired
	CommonMapper commonMapper;
	// 모든 JSP에서 ${commonDetailList}를 통해
	
//	@ModelAttribute()
//	public void commonDetailInfo(Model model) {
//		log.info("왔다 : " + StartApplicationUtil.getCommonDetailList());
//		model.addAttribute("commonDetailList", StartApplicationUtil.getCommonDetailList());
//	}
}
