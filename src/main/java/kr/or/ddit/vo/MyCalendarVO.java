package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MyCalendarVO {
	
	private String mcCd;
	private String mcTitle;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date mcStdt;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date mcEddt;
	private String userCd;
}
