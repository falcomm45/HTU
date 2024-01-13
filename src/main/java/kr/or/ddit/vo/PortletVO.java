package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class PortletVO {
	
	private String userCd;
	private String comdCd;
	private int porYn;
	private int porX;
	private int porY;
	private int porH;
	private int porW;
	private CommonDetailVO commonDetailVO;
	
}
