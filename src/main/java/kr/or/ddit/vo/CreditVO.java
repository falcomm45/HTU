package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * 학점 계산 VO
 * @author 임형택
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
public class CreditVO {
	
	// 기준 학점
	private int stdCredit;
	
	private String colNm;
	
	public CreditVO (CollegeVO collegeVO) {
		
		int colCrd = collegeVO.getColCrd();
		
		this.stdCredit = (colCrd / 8) + 2;
		
	}
	
	
	
}
