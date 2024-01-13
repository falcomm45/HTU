package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CrewVO {

	private String crCd;		//동아리코드
	private String roomCd;		//희망호실코드
	private String appCd;		//결재승인코드
	private String stuCd;		//신청인학번
	private String fileCd;		//첨부파일코드
	private String crLeader;	//동아리장
	private String crNm;		//동아리명
	private int crYn;			//동아리운영여부
	private String crCon;		//동아리내용
	
	private String ldrNm;		//동아리장이름
	private String stuNm;		//동아리원이름
	private String 	roomNm; 	//호실이름
	private String 	crPs; 		//동아리인원
	private String 	depNm; 		//동아리원학과
	
	private MultipartFile[] uploadFiles;
	
	private List<FilesDetailVO> filesDetailVOList;
	
	private RoomVO roomVO;
	
	private CommonDetailVO commonDetailVO;
	
	private StudentVO studentVO;
	
	private ApprovalVO approvalVO;
	
	private UserVO userVO;
	
}
