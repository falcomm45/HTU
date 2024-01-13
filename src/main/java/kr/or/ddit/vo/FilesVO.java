package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FilesVO {

	private String fileCd;
	private Date fileReg;
	
	private List<FilesDetailVO> filesDetailVOList;
}
