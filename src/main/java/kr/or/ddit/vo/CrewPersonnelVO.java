package kr.or.ddit.vo;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CrewPersonnelVO {

	private String crCd;		//동아리코드
	private String stuCd;		//신청인학번
	private String appCd;		//결재승인코드
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String crpJoin;		//가입일시
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String crpQuit;		//탈퇴일시
	
}
