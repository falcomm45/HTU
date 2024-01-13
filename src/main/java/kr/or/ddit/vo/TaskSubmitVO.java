package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class TaskSubmitVO {
	private String tsubCd;  // 과제제출코드
	private String taskCd;  // 과제코드
	private String stuCd;   // 학번
	private Date tsubDt;    // 과제제출일자
	private String tsubCon; // 과제제출내용
	private int tsubScore;  // 과제점수
	
	private TaskVO taskVO;
	private StudentVO studentVO;
	private int rnum;			// 페이징처리용
	private List<FilesDetailVO> filesDetailVOList;
	private MultipartFile[] uploadFiles;
}
