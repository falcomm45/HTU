package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class TaskVO {
	private String taskCd;		// 과제코드
	private String lecCd;       // 강의코드
	private String fileCd;      // 첨부파일코드
	private String taskNm;      // 과제명
	private String taskCon;     // 과제내용
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date taskReg;       // 과제등록일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date taskEddt;      // 과제마감일
	
	private int rnum;			// 페이징처리용
	
	private EnrolmentVO enrolmentVO;
	private LectureVO lectureVO;
	private List<FilesDetailVO> filesDetailVOList;
	private MultipartFile[] uploadFiles;
	private TaskSubmitVO taskSubmitVO; // 학생이 자기가 제출한과제 보는용도
	private List<TaskSubmitVO> taskSubmitList; // 교수가 학생들이 제출한 과제들 보는용도
//	<result property="taskCd" column="TASK_CD"/>
//	<result property="lecCd" column="LEC_CD"/>
//	<result property="fileCd" column="FILE_CD"/>
//	<result property="taskNm" column="TASK_NM"/>
//	<result property="taskCon" column="TASK_CON"/>
//	<result property="taskReg" column="TASK_REG"/>
//	<result property="taskEddt" column="TASK_EDDT"/>
//	<result property="rnum" column="RNUM"/>
//	<association property="lectureVO" resultMap="lectureVOMap"></association>
//	<collection property="filesDetailVOList" resultMap="filesDetailMap"></collection>
}
