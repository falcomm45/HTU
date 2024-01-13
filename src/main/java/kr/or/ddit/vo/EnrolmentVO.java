package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class EnrolmentVO {
	
	private String enrCd;
	private String stuCd;
	private String lecCd;
	private Date enrReg;
	
	private LectureVO lectureVO;
	private StudentVO studentVO;
	private List<StudentVO> studentVOList;
	
}
