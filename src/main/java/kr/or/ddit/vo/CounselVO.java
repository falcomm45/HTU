package kr.or.ddit.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CounselVO {
	private String cnslCd; //상담코드
	private String stuCd; //학번
	private String proCd; //교번
	private String appCd; //승인코드
	private String comdCd; //상담구분코드
	private String cnslTitle; //상담제목
	private String cnslCon; //상담내용
	
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date cnslDt; //상담일자
	
	private String strcnslDt; //상담일자 String 변환
	
	private UserVO userVO;
	
	private StudentVO studentVO;
	
	private ProfessorVO professorVO;
	
	private CommonDetailVO commonDetailVO;
	
	private ApprovalVO approvalVO;
	
	private DepartmentVO departmentVO;
	
}
