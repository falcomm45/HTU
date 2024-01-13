package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class ReservationVO {
	
	private String resCd;
	
	private String roomCd;
	
	private String userCd;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date resStdt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date resEddt;
	
	private String resRsn;
	
	private UserVO userVO;
	
	private RoomVO roomVO;
	
	private CommonDetailVO commonDetailVO;
	
	private String resDate;
	
	private String startTime;
	
	private String endTime;
	
}
