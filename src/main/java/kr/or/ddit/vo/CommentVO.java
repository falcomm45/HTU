package kr.or.ddit.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class CommentVO {
	
	private String cmtCd;
	private String userCd;
	private String bdCd;
	private String cmtPcd;
	private String cmtCon;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cmtReg;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cmtUdt;
	private int cmtAnony;
	private int cmtYn;
	private UserVO userVO;
	private BoardVO boardVO;
	private int level;
	
	private String writer;
}
