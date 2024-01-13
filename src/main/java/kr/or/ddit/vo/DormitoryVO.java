package kr.or.ddit.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DormitoryVO {
	private String userCd;
	private String domCd;
	private String bldCd;
	private String roomCd;
	private String stuCd;
	private String appCd;
	private String comdCd;
	private int domYear;
	private int domSem;
	private Date appReg;
	private String userNm;
	private String comdNm;
	private int payYn;
	
	private int appYn;
	
	private int stuYear;	// 학년
	
	private int stuSem;		// 학기
	
	private String userTel;
	
	private String userMail;
	
	private String userAddr1;
	
	private String userReg1;
	// 승인 정보를 가져오기 위한 필드
	private ApprovalVO approvalVO;
	
	private BuildingVO buildingVO;

	private RoomVO roomVO;
	
	private UserVO userVO;
	
	private CommonDetailVO commonDetailVO;
	
	private StudentVO studentVO;
}
