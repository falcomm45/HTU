package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UnivMailVO {
	
	private String umlCd;
	private String umlSender;
	private String umlReceiver;
	private String umlTitle;
	private String umlCon;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH12:mm:ss")
	private Date umlReg;
	private int umlTemp;
	private int umlYn;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH12:mm:ss")
	private Date umlDt;
	
	private MultipartFile[] uploadFiles;
	
	private List<FilesDetailVO> filesDetailVOList;
	
	private UserVO userVO;	
	
	private List<UserVO> userVOList;
	
	private String senderNm;	//보내는 사람 이름

	private String receiverNm;	//받는 사람 이름
	
	private String strUmlReg; // 보낸시간 문자열

}
