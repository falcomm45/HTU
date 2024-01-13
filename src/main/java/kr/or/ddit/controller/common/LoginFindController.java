package kr.or.ddit.controller.common;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.common.LoginFindService;
import kr.or.ddit.util.SmsUtil;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

@Slf4j
@Controller
@RequestMapping("/findinfo")
public class LoginFindController {
	
	@Autowired
	LoginFindService loginFindService; 
	
	@Autowired
	SmsUtil smsUtil;
	
	@ResponseBody
	@PostMapping("/loginSearchId")
	public Map<String, Object> findId(@RequestBody UserVO userVO) {
		
		Map<String, String> map = new HashedMap<String, String>();
		map.put("USER_NM", userVO.getUserNm());
		map.put("USER_REG1", userVO.getUserReg1());
		map.put("USER_REG2", userVO.getUserReg2());
		
		UserVO userVO2 =  this.loginFindService.findId(map);
		log.info("userNm : " + userVO.getUserNm());
		log.info("userReg1 : " + userVO.getUserReg1());
		log.info("userReg2 : " + userVO.getUserReg2());
		
		Map<String, Object> resultMap = new HashedMap<String, Object>();
		resultMap.put("result", userVO2);
		
		return resultMap;
		
		
	}
	
	@ResponseBody
	@PostMapping("/loginSearchPw")
	public Map<String, Object> findPw(@RequestBody UserVO userVO) {
		Map<String, String> map = new HashedMap<String, String>();
		map.put("USER_CD", userVO.getUserCd());
		map.put("USER_TEL", userVO.getUserTel());
		UserVO userVO3 =  this.loginFindService.findPw(map);
		
		Random random = new Random();
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (userVO3 != null) {
			
			int rndNumber = random.nextInt(900000) + 100000;
			
			SingleMessageSentResponse sendOne = smsUtil.sendOne(userVO.getUserTel(), String.valueOf(rndNumber));
			result.put("message", sendOne);
			result.put("code", rndNumber);
		}
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/modPassword")
	public int modPassword(@RequestBody UserVO userVO, Principal principal) {
		return this.loginFindService.modPassword(userVO);
	}
	
}