package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class CommonDetailVO {
	
	private String comdCd;
	
	private String comCd;
	
	private String comdNm;
	
	private String comdDesc;
	
	private CommonVO commonVO;
	
}
