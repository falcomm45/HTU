package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class CollegeVO {
	
	private String 	colCd;
	
	private int 	colCrd; // 신청 가능 학점
	
	// 단과대 코드를 가져오기위한 공통코드 필드
	private CommonDetailVO commonDetailVO;
	
}
