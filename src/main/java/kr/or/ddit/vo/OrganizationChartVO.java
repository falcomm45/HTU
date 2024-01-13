package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class OrganizationChartVO {
	
	private String organizationCode;
	private String organizationName;
	private String organizationParentCode;
	private String organizationDescription;
	
}
