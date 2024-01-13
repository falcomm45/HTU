package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class AcademicCalendarVO {

	private String acCd;
	
	private String acTitle;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date acStdt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date acEddt;
}
