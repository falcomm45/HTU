package kr.or.ddit.vo;

import lombok.Data;

@Data
public class TestQuestionVO {

	private String teqCd;		//시험문제코드
	private String testCd;		//시험코드
	private int teqNo;			//문제번호
	private String teqCon;		//문제내용
	private String teqOp1;		//1번보기
	private String teqOp2;		//2번보기
	private String teqOp3;		//3번보기
	private String teqOp4;		//4번보기
	private String teqOp5;		//5번보기
	private String teqAnswer;	//정답
	private int teqAllot;		//배점
}
