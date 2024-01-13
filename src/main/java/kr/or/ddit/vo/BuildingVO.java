package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class BuildingVO {
	
	private String 	bldCd;	// 공통상세코드
	
	private String 	colCd;	// 단과대 테이블의 공통상세코드
	
	private int 	bldZip;
	
	private String 	bldAddr1;
	
	private String 	bldAddr2;
	
	private CommonDetailVO commonDetailVO;
	
	private CollegeVO collegeVO;
}
