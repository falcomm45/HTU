package kr.or.ddit.controller.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.service.common.impl.KakaoPay;
import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class KakaoPayController {
	
	@Autowired
    private KakaoPay kakaoPay;
    
    
    @GetMapping("/kakaoPay")
    public void kakaoPayGet() {
    	
    }
    
    @PostMapping("/kakaoPay")
    public String kakaoPay() {
        log.info("kakaoPay post............................................");
        
        return "redirect:" + kakaoPay.kakaoPayReady();
 
    }
    
    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
        log.info("kakaoPaySuccess get............................................");
        log.info("kakaoPaySuccess pg_token : " + pg_token);
        
        model.addAttribute("info", kakaoPay.kakaoPayInfo(pg_token));
        
    }
}
