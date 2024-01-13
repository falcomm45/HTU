package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
/**
 * 학과테이블VO
 * @author PC-20
 *
 */
public class DepartmentVO {
	private String depCd;
	private String colCd;
	private String depNm;
	private int depMrc;
	private int depMoc;
	private int depCrc;
	private int depCoc;
	private int depCap;
	private String depTel;
	private int depFee;
	
	private int rnum;
	
	private String colNm;
	
	// 단과대코드 정보를 가져오기 위한 필드
	private CollegeVO collegeVO;

// resultMap
//	<result property="depCd" column="DEP_CD"/>
//	<result property="colCd" column="COL_CD"/>
//	<result property="depNm" column="DEP_NM"/>
//	<result property="depMrc" column="DEP_MRC"/>
//	<result property="depMoc" column="DEP_MOC"/>
//	<result property="depCrc" column="DEP_CRC"/>
//	<result property="depCoc" column="DEP_COC"/>
//	<result property="depCap" column="DEP_CAP"/>
//	<result property="depTel" column="DEP_TEL"/>
//	<result property="depFee" column="DEP_FEE"/>
}
