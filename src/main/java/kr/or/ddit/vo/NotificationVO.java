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
public class NotificationVO {
	
	private String ntfCd;
	
	private String userCd;
	
	private String comdCd;
	
	private int ntfYn;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ntfReg;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ntfDt;
	
	private String ntfUrl;
	
	private String ntfCon;
	
	// 수신인
	private UserVO userVO;
	
	// 발신인
	private UserVO senderVO;
	
	private CommonDetailVO commonDetailVO;
	
	public NotificationVO(String comdCd, String userCd, String ntfUrl) {
		this.comdCd = comdCd;
		this.userCd = userCd;
		this.ntfUrl = ntfUrl;
	}
	
	public NotificationVO(String comdCd, String userCd, String ntfUrl, String ntfCon) {
		this.comdCd = comdCd;
		this.userCd = userCd;
		this.ntfUrl = ntfUrl;
		this.ntfCon = ntfCon;
	}
	
	
	
}
