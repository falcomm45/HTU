package kr.or.ddit.vo;

import lombok.Data;

@Data
public class SchlshipVO {

	private String sclCd;		//장학코드
	private String stuCd;		//학번
	private String siCd;		//장학구분코드
	private int sclYear;		//장학년도
	private int sclSem;			//장학학기
	
	private String sclNm;		//장학금명
	private String depFee;		//학과별 등록금
	private String sclSum;		//장학금액
	
	private StudentVO studentVO;
}
