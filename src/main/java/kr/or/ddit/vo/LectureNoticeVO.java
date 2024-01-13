package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
/** 강의공기사항 VO*/
public class LectureNoticeVO {
	private String lecnCd;		// 공지사항코드
	private String lecCd;		// 강의코드
	private String fileCd;		// 첨부파일코드
	private String lecnTitle;   // 공지사항제목
	private String lecnCon;     // 공지사항내용
	private Date lecnReg;       // 공지사항작성일
	private Date lecnUdt;       // 공지사항수정일
	private int lecnCnt;        // 조회수
	
	private int rnum;			// 페이징처리용
	
	private LectureVO lectureVO;
	private List<FilesDetailVO> filesDetailVOList;
	private MultipartFile[] uploadFiles;
	
//	<result property="lecnCd" column="LECN_CD"/>
//	<result property="lecCd" column="LEC_CD"/>
//	<result property="fileCd" column="FILE_CD"/>
//	<result property="lecnTitle" column="LECN_TITLE"/>
//	<result property="lecnCon" column="LECN_CON"/>
//	<result property="lecnReg" column="LECN_REG"/>
//	<result property="lecnUdt" column="LECN_UDT"/>
//	<result property="lecnCnt" column="LECN_CNT"/>
}
