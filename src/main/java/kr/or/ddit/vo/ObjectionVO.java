package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ObjectionVO {
	
	private String crtrCd;
	private String stuCd;
	private String appCd;
	private String objCon;
	private String objRpl;
	private ApprovalVO approvalVO;
	private StudentVO studentVO;
	private LectureGradeVO lectureGradeVO;
}
