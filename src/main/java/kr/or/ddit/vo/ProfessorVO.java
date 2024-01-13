package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
/**
 * 교수테이블VO 
 * @author PC-20
 *
 */
public class ProfessorVO {
	private String proCd;
	private String depCd;
	private String roomCd;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date proJoin;
	private String formJoin;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date proRet;
	private String formRet;
	
	private String proPos;
	
	private int rnum;
	
	// 교수가 가지고 있는 교수의 상세 정보를 가져오기 위한 필드
	private UserVO userVO;
	private StudentVO studentVO;
	// 학과정보를 가져오기 위한 필드
	private DepartmentVO departmentVO;
	// 호실정보를 가져오기 위한 필드
	private RoomVO roomVO;
	
	private FilesDetailVO filesDetailVO;
	
	private CommonDetailVO commonDetailVO;
	
	private OrganizationChartVO organizationChartVO;

// resultMap
//	<result property="proCd" column="PRO_CD"/>
//	<result property="depCd" column="DEP_CD"/>
//	<result property="roomCd" column="ROOM_CD"/>
//	<result property="proJoin" column="PRO_JOIN"/>
//	<result property="proRet" column="PRO_RET"/>
//	<result property="proPos" column="PRO_POS"/>
	
}

