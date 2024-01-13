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
public class AttendanceVO {
	
	@DateTimeFormat(pattern =  "yyyy-MM-dd")
	private Date attDt;
	
	private String lecsCd;
	
	private String stuCd;
	
	private int attYn;
	
	private String formDate;
}
