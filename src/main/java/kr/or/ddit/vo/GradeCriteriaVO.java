package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class GradeCriteriaVO {
	private String crtrCd;	// 처리기준코드
	private String lecCd;   // 강의코드
	private int crtrMp;     // 중간고사비율
	private int crtrFp;     // 기말고사비율
	private int crtrTp;     // 과제비율
	private int crtrAp;     // 출결비율
	
	private LectureVO lectureVO;
}
