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
 * 강의일정테이블VO
 * @author PC-20
 *
 */
public class LectureScheduleVO {
	private String lecsCd;
	private String lecCd;
	private String lecDay;
	@DateTimeFormat(pattern = "HH:mm")
	private Date lecsStdt;
	@DateTimeFormat(pattern = "HH:mm")
	private Date lecsEddt;
	
	// 강의코드 정보를 가져오기 위한 필드 
	private LectureVO lectureVO; 
	
// resultMap
// <result property="lecsCd" column="LECS_CD"/>
// <result property="lecCd" column="LEC_CD"/>
// <result property="lecDay" column="LEC_DAY"/>
// <result property="lecsStdt" column="LECS_STDT"/>
// <result property="lecsEddt" column="LECS_EDDT"/>
}
