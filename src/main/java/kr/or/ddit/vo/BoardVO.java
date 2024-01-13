package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class BoardVO {
	
	private String bdCd;
	private String userCd;
	private String comdCd;
	private String bdTitle;
	private String bdCon;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bdReg;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bdUdt;
	private int bdCnt;
	private int rnum;
	private int rn; //글번호
	private String newFiles;
	private int bdYn;
	private String fileCd;
	
	private UserVO userVO; // 작성자
	private String userNm; // 유저이름
	
	private List<FilesDetailVO> fileList; // 첨부파일
	
	private CommonDetailVO commonDetailVO; // 게시판 구분 공통코드
	
	private MultipartFile[] uploadFiles; // 파일첨부
	
	private List<CommentVO> commentList;
	
	
	
//	<result property="bdCd" column="BD_CD"/>
//	<result property="userCd" column="USER_CD"/>
//	<result property="fileCd" column="FILE_CD"/>
//	<result property="comdCd" column="COMD_CD"/>
//	<result property="bdTitle" column="BD_TITLE"/>
//	<result property="bdCon" column="BD_CON"/>
//	<result property="bdReg" column="BD_REG"/>
//	<result property="bdUdt" column="BD_UDT"/>
//	<result property="bdCnt" column="BD_CNT"/>
	
}
