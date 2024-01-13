package kr.or.ddit.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class UserVO {
	
	private String userCd;
	
	private String userNm;
	
	private String userNme;
	
	private String userTel;
	
	private int userZip;
	
	private String userAddr1;
	
	private String userAddr2;
	
	private String userReg1;
	
	private String userReg2;
	
	private String userMail;
	
	private String userPass;
	
	private String userBank;
	
	private String userDepo;
	
	private String userAcc;
	
	private String fileCd;
	
	private String comdCd;	// 공통상세코드
	
	private int rnum;
	
	private CommonDetailVO commonDetailVO;
	
	private StudentVO studentVO;
	
	private ProfessorVO professorVO;
	
	private EmployeeVO employeeVO;
	
	private FilesDetailVO filesDetailVO;
	
	private MultipartFile[] uploadFiles;
	
	private PostReportVO postReportVO;
	
}
