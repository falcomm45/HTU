package kr.or.ddit.util;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.security.CustomUser;
import kr.or.ddit.service.professor.GradeCriteriaService;
import kr.or.ddit.vo.GradeCriteriaVO;
import kr.or.ddit.vo.LectureGradeVO;
import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
@RequiredArgsConstructor
public class EtcUtil {
	
	public static String formDate(Date date) {
		return new SimpleDateFormat("yyyy-MM-dd").format(date); 
	}
	
	
	// login 사용자 detail 정보를 가져오기
	public UserVO getUserVO() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		CustomUser customUser = (CustomUser)authentication.getPrincipal();
		
		return customUser.getUserVO();
	}
	
	
	public <T> String getJsonList(T list) {
		
		ObjectMapper objectMapper = new ObjectMapper();
		
		String result = "";
		
		try {
			result = objectMapper.writeValueAsString(list);
		} catch (JsonProcessingException e) {
			log.error(e.getMessage());
		}
		
		return result;
	}
	
	
}
