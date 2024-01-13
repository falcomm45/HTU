package kr.or.ddit.vo;

import java.util.List;

import lombok.Data;

@Data
public class TestApplyVO {

	private String teaCd;		//시험응시코드
	private String testCd;		//시험코드
	private String stuCd;		//학번
	private int teaScore;		//시험점수
	
	private String stuNm;		//학생명
	private String depNm;		//학과명
	private String rank;		//석차
	
	List<TestDetailVO> testDetailVOList;
	
	List<TestQuestionVO> testQuestionVOList;
}
