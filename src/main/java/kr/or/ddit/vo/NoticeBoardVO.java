package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class NoticeBoardVO {
	private String nbCd;
	private String empCd;
	private String fileCd;
	private String nbTitle;
	private String nbCon;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date nbReg;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date nbUdt;
	private int nbCnt;
	private int nbYn;
	
	private int rn; //글번호
	
	private String userNm;
	
	private List<FilesDetailVO> filesDetailVOList; // 첨부파일
	
	private EmployeeVO employeeVO;
	
	private List<EmployeeVO> employeeVOList;
	
	private  MultipartFile[] uploadFiles;

		
	}
	
	
