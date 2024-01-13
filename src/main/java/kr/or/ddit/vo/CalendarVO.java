package kr.or.ddit.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class CalendarVO {
	
	private Date calDate;
	
	private String calStart;
	
	private String calEnd;
	
	private String calRoomCd;
	
	private String formDate;
}
