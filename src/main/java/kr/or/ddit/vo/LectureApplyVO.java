package kr.or.ddit.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
/**
 * 강의계획신청 테이블VO
 * @author PC-20
 *
 */
public class LectureApplyVO {
	private String lecaCd;		// 강의계획신청코드 	
	private String proCd;		// 교번				1-2(이름이보이게 출력) *
	private String appCd;		// 승인코드			
	private String depCd;		// 강의대상학과		2-3 * 
	private String roomCd;		// 호실코드			5 *
	private int lecaYear;		// 년도				2-1 *
	private int lecaSem;		// 학기				2-2 *
	private String lecaNm;		// 강의명			1-1 *
	private String lecaCon;		// 교과목개요			7 * 
	private int lecaTrg;		// 개설학년			1-3
	private int lecaCrd;		// 학점				4-1 * 
	private int lecaPer;		// 강의시수			4-2 *
	private int lecaCap;		// 정원				4-3 *
	private String lecaSche;	// 희망일정(요일)		3-1 *
	private String lecaBook;	// 교재 및 참고서		6  *
	private String lecaNote;	// 비고				8
	private int lecaEva;		// 평가구분(0:상대평가/1:절대평가) 호실코드위에넣기 * 
	private int lecaTemp;		// 임시저장(0:전송완료/1:임시저장)
	private int lecaType; 		// 전공유형 
	
	
	private int crtrMp;			// 중간비율
	private int crtrFp;         // 기말비율
	private int crtrTp;         // 과제비율
	private int crtrAp;         // 출결비율
	
	private int rnum; 			// 페이징용 변수
	
	// 데이터 입력시 10:00 의 형식으로 입력
	private String lecaStdt;	// 강의시작시간		3-2
	// 데이터 입력시 10:00 의 형식으로 입력		
	private String lecaEddt;	// 강의종료시간		3-3
	// 교수의 정보를 가져오기 위한 필드
	private ProfessorVO professorVO;
	// 승인 정보를 가져오기 위한 필드
	private ApprovalVO approvalVO;
	// 학과 정보를 가져오기 위한 필드
	private DepartmentVO departmentVO;
	// 전공 정보를 가져오기 위한 필드
//	private CommonDetailVO commonDetailVO;
	// 호실 정보를 가져오기 위한 필드
	private RoomVO roomVO;
// resultMap
//	<result property="lecaStdt" column="LECA_STDT"/>
//	<result property="lecaEddt" column="LECA_EDDT"/>
//	<result property="lecaCd" column="LECA_CD"/>
//	<result property="proCd" column="PRO_CD"/>
//	<result property="appCd" column="APP_CD"/>
//	<result property="depCd" column="DEP_CD"/>
//	<result property="roomCd" column="ROOM_CD"/>
//	<result property="lecaYear" column="LECA_YEAR"/>
//	<result property="lecaSem" column="LECA_SEM"/>
//	<result property="lecaNm" column="LECA_NM"/>
//	<result property="lecaCon" column="LECA_CON"/>
//	<result property="lecaTrg" column="LECA_TRG"/>
//	<result property="lecaCrd" column="LECA_CRD"/>
//	<result property="lecaPer" column="LECA_PER"/>
//	<result property="lecaCap" column="LECA_CAP"/>
//	<result property="lecaSche" column="LECA_SCHE"/>
//	<result property="lecaBook" column="LECA_BOOK"/>
//	<result property="lecaNote" column="LECA_NOTE"/>
//	<result property="lecaEva" column="LECA_EVA"/>
//	<result property="lecaTemp" column="LECA_TEMP"/>
}
