package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@NoArgsConstructor
@ToString
/**
 * 승인테이블VO
 * @author PC-20
 *
 */
public class ApprovalVO {
	private String appCd;
	private String appPcd;
	private String userCd;
	private String comdCd;
	private String appTarget;
	private int appYn;
	private Date appReg;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date appProdt;
	private String appRet;
	
	private int rnum;
	private String stuNm;	//결재 신청 학생명
	
	// 유저 정보를 가져오기 위한 필드
	private UserVO userVO;
	
	// 교수 정보를 가져오기 위한 필드
	private ProfessorVO professorVO;
	//게시판 정보를 가져오기 위한 필드
	private BoardVO boardVO;
	
	private LectureGradeVO lectureGradeVO;

	private ScholarshipRecommendVO scholarshipRecommendVO;

// resultMap
//	<result property="conCd" column="CON_CD"/>
//	<result property="userCd" column="USER_CD"/>
//	<result property="comdCd" column="COMD_CD"/>
//	<result property="conTarget" column="CON_TARGET"/>
//	<result property="conYn" column="CON_YN"/>
//	<result property="conReg" column="CON_REG"/>
//	<result property="conProdt" column="CON_PRODT"/>
//	<result property="conRet" column="CON_RET"/>
}
