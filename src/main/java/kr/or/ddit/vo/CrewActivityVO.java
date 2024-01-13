package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CrewActivityVO {
	
	private String craCd;					//활동코드
	private String crCd;					//동아리코드
	private String userCd;					//작성자
	private String fileCd;					//첨부파일코드
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")	
	private Date craStdt;					//활동시작시간
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date craEddt;					//활동종료시간
	private String craCon;					//활동내용
	
	private MultipartFile[] uploadFiles;
	
	private List<FilesDetailVO> filesDetailVOList;
	
	private String stuNm;					//학생이름
}
