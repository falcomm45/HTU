package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class TestVO {

	private String testCd;					//시험코드
	private String lecCd;					//강의코드
	private int testOpt;					//시험구분 (중간 1, 기말 2)
	private String testNm;					//시험명
	private String testCon;					//시험내용
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date testReg;					//시험등록일자
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date testDt;					//시험일자
	private int testLmt;					//시험제한시간

	private String lecNm;					//강의명

	List<TestQuestionVO> testQuestionVOList; //시험문제 
	
	List<TestApplyVO> testApplyVOList;		//시험응시학생목록
}
