package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PostReportVO {
	
	private String prCd;	//신고
	private String userCd; //신고한유저
	private String appCd; //승인
	private String bdCd; //게시글
	private int prRsn;  //"0:불건전한내용, 1: 주제에 맞지않음, 2: 욕설, 3: 기타"
	private String prDetail; //상세내용
	
	private String userNm;
	
	private String bdTitle;
	
	private String bdCon;
	private Date appProdt;
	private BoardVO boardVO;
	private UserVO userVO;
	
	// 승인 정보를 가져오기 위한 필드
	private ApprovalVO approvalVO;
	
	//private BoardVO boardVO;
	
	//보드공통번호
	private String CD;
	//신고일
	private Date appReg;
	
	//private int appYn;
	
	private int rnum; 			// 페이징용 변수
	
	private int appYn;
	
	private String comdCd;
}
