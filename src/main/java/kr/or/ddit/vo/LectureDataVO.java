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
public class LectureDataVO {
	private String lecdCd;		// 자료코드
	private String lecCd;       // 강의코드
	private String fileCd;      // 첨부파일코드
	private Date lecdDt;        // 업로드일자
	private String lecdTitle;   // 자료제목
	private String lecdCon;     // 자료내용
	
	private int rnum;			// 페이징처리용
	private LectureVO lectureVO;// 강의정보
	private List<FilesDetailVO> filesDetailVOList;
	private MultipartFile[] uploadFiles;
	
	
//	<result property="lecdCd" column="LECD_CD"/>
//	<result property="lecCd" column="LEC_CD"/>
//	<result property="fileCd" column="FILE_CD"/>
//	<result property="lecdDt" column="LECD_DT"/>
//	<result property="lecdTitle" column="LECD_TITLE"/>
//	<result property="lecdCon" column="LECD_CON"/>
//	<result property="rnum" column="RNUM"/>
}
