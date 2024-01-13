package kr.or.ddit.vo;

import lombok.Data;

@Data
public class TestDetailVO {

	private String teqCd;		//시험문제코드
	private String teaCd;		//시험응시코드
	private String tedAnswer;	//작성답
	private int tedYn;			//정답여부
}
