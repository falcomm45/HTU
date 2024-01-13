package kr.or.ddit.vo;

import lombok.Data;

@Data
public class FilesDetailVO {

	private int fileSn;
	private String fileCd;
	private String filePath;
	private String fileOrnm;
	private String fileSvnm;
	private String fileExtsn;
	private String fileCon;
	private int fileSize;
	private int fileUsed;
}
