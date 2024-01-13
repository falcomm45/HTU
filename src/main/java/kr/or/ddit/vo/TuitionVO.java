package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TuitionVO {

	private String tutCd;			//등록금코드
	private String stuCd;			//학번
	private String sclCd;			//장학코드
	private int tutYear;			//등록년도
	private int tutSem;				//등록학기
	private int tutTuition;			//등록금
	private int tutSchl;			//장학금액
	@DateTimeFormat(pattern = "yyyy-MM-dd")	
	private Date tutDt;				//납부일
	private int tutPayment;			//납부금액
	
	private String stuNm;			//학생명
	private String depNm;			//학과명
}
