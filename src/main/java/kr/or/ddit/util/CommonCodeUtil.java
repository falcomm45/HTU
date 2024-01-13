package kr.or.ddit.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.context.ServletContextAware;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.mapper.CommonMapper;
import kr.or.ddit.vo.CommonDetailVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@RequiredArgsConstructor
@Slf4j
public class CommonCodeUtil implements ServletContextAware {

	private final CommonMapper commonMapper;

	@Override
	public void setServletContext(ServletContext servletContext) {

		List<CommonDetailVO> commonDetailList = this.commonMapper.getCommonDetailList();
		
		List<CommonDetailVO> apprCommonList = new ArrayList<CommonDetailVO>();
		List<CommonDetailVO> schlCommonList = new ArrayList<CommonDetailVO>();
		List<CommonDetailVO> portCommonList = new ArrayList<CommonDetailVO>();
		List<CommonDetailVO> recdCommonList = new ArrayList<CommonDetailVO>();
		List<CommonDetailVO> counCommonList = new ArrayList<CommonDetailVO>();
		List<CommonDetailVO> userCommonList = new ArrayList<CommonDetailVO>();
		List<CommonDetailVO> buldCommonList = new ArrayList<CommonDetailVO>();
		List<CommonDetailVO> coleCommonList = new ArrayList<CommonDetailVO>();
		List<CommonDetailVO> bordCommonList = new ArrayList<CommonDetailVO>();
		List<CommonDetailVO> alamCommonList = new ArrayList<CommonDetailVO>();
		
		for (CommonDetailVO commonDetailVO : commonDetailList) {
			switch (commonDetailVO.getComCd()) {
			case "APPR":
				apprCommonList.add(commonDetailVO);
				continue;
			case "SCHL":
				schlCommonList.add(commonDetailVO);
				continue;
			case "PORT":
				portCommonList.add(commonDetailVO);
				continue;
			case "RECD":
				recdCommonList.add(commonDetailVO);
				continue;
			case "COUN":
				counCommonList.add(commonDetailVO);
				continue;
			case "USER":
				userCommonList.add(commonDetailVO);
				continue;
			case "BULD":
				buldCommonList.add(commonDetailVO);
				continue;
			case "COLE":
				coleCommonList.add(commonDetailVO);
				continue;
			case "BORD":
				bordCommonList.add(commonDetailVO);
				continue;
			case "ALAM":
				alamCommonList.add(commonDetailVO);
				continue;
			}
		}
		ObjectMapper objectMapper = new ObjectMapper();
		String jsonCommonDetailList = "";
		String jsonColeCommonList = "";
		String jsonBuldCommonList = "";
		String jsonPortCommonList = "";
		try {
			jsonCommonDetailList = objectMapper.writeValueAsString(commonDetailList);
			jsonColeCommonList = objectMapper.writeValueAsString(coleCommonList);
			jsonBuldCommonList = objectMapper.writeValueAsString(buldCommonList);
			jsonPortCommonList = objectMapper.writeValueAsString(portCommonList);
		} catch (JsonProcessingException e) {
			log.error(e.getMessage());
		}
		
		// 전체 코드 리스트
		servletContext.setAttribute("commonDetailList", commonDetailList);
		// 장학 코드 리스트
		servletContext.setAttribute("schlCommonList", schlCommonList);
		// 승인 코드 리스트
		servletContext.setAttribute("apprCommonList", apprCommonList);
		// 포틀릿 코드 리스트
		servletContext.setAttribute("portCommonList", portCommonList);
		// 학적 코드 리스트
		servletContext.setAttribute("recdCommonList", recdCommonList);
		// 상담 코드 리스트
		servletContext.setAttribute("counCommonList", counCommonList);
		// 사용자 코드 리스트
		servletContext.setAttribute("userCommonList", userCommonList);
		// 시설 코드 리스트
		servletContext.setAttribute("buldCommonList", buldCommonList);
		// 단과대 코드 리스트
		servletContext.setAttribute("coleCommonList", coleCommonList);
		// 게시판 코드 리스트
		servletContext.setAttribute("bordCommonList", bordCommonList);
		// 승인 코드 리스트
		servletContext.setAttribute("alamCommonList", alamCommonList);
		
		
		servletContext.setAttribute("jsonColeCommonList", jsonColeCommonList);
		servletContext.setAttribute("jsonCommonDetailList", jsonCommonDetailList);
		servletContext.setAttribute("jsonBuldCommonList", jsonBuldCommonList);
		servletContext.setAttribute("jsonPortCommonList", jsonPortCommonList);
	}

}
