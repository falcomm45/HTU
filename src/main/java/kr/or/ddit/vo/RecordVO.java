package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class RecordVO {
	
	private String recCd;
	private String stuCd;
	private String appCd;
	private String comdCd;
	private int recYear;
	private int recSem;
	private int recPer;
	private String recRsn;
	
	//학적 변동 신청학생정보
	private StudentVO studentVO;
	//승인코드
	private ApprovalVO approvalVO;
	
	private CommonDetailVO commonDetailVO;
	
	private UserVO userVO;
	
	private DepartmentVO departmentVO;
}
