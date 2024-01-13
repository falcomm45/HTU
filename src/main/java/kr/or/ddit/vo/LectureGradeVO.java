package kr.or.ddit.vo;

import java.math.BigDecimal;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class LectureGradeVO {
	
	// 성적처리기준 코드 => GradeCriteria pk
	private String crtrCd;
	private String stuCd;
	// 중간고사 점수
	private int lecgMs;
	// 기말고사 점수
	private int lecgFs;
	// 과제 점수
	private BigDecimal lecgTs;
	// 출결 점수
	private BigDecimal lecgAs;
	// 총점
	private BigDecimal lecgSum;
	// 강의성적
	private String lecgGrade;
	
	private GradeCriteriaVO gradeCriteriaVO;
	
	private ObjectionVO objectionVO;
	
	public LectureGradeVO(String crtrCd, String stuCd) {
		this.crtrCd = crtrCd;
		this.stuCd = stuCd;
	}
	
}
