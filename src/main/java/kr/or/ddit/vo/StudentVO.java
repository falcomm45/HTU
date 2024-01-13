package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
@NoArgsConstructor
public class StudentVO {
	
	private String stuCd;	// 학번
	
	private String depCd;	// 학과코드
	
	private String comdCd;	// 학적구분코드(휴학, 복학..)
	
	private int stuYear;	// 학년

	private int stuSem;		// 학기
	
	private int stuMrc;		// 전필
	
	private int stuMoc;		// 전선
	
	private int stuCrc; 	// 교필
	
	private int stuCoc;		// 교선
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date stuAddt;	// 입학일자
	
	private String formAddt;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date stuGrdt;	// 졸업일자
	
	private String formGrdt;
	
	private String colNm;	//단과대명
	private String depNm;	//학과명
	private String stuNm;	//학생명
	private double score;	//학점
	private int rank;		//석차
	private int depFee;		//등록금
	private int lecaYear;	//장학년도
	private int lecaSem;	//장학학기
	
	private SchlshipVO schlshipVO; 
	
	private UserVO userVO;
	
	private DepartmentVO departmentVO;

	private ProfessorVO professorVO;
	
	private String proCd;
	
	private ScholarshipRecommendVO scholarshipRecommendVO;
	
	private FilesDetailVO filesDetailVO;
	
	private String filePath;
	
	private CommonDetailVO commonDetailVO;
	
	private OrganizationChartVO organizationChartVO;
	
	// 학생의 출결 리스트
	private List<AttendanceVO> attendanceList;
	
	// 관심강의 리스트
	private List<WishLectureVO> wishLectureList;
	
	// 수강신청강의리스트
	private List<EnrolmentVO> enrolmentList;
	
	private ApprovalVO approvalVO;
	
	private int appYn;
//	private int rnum;
	
}
