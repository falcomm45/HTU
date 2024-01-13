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
 * 주차별계획테이블VO
 * @author PC-20
 *
 */
public class WeekplanVO {
	private int wpNo;
	private String lecCd;
	private String wpCon;
	
	
	private int rnum;
	// 강의코드 정보를 가져오기 위한 필드
	private LectureVO lectureVO;
	
// resultMap	
//	<result property="wpNo" column="WP_NO"/>
//	<result property="lecCd" column="LEC_CD"/>
//	<result property="wpCon" column="WP_CON"/>
	
}
