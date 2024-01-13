package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.FilesDetailVO;
import kr.or.ddit.vo.UnivMailVO;

public interface UnivMailMapper {

	//받은 메일함
	public List<UnivMailVO> inbox(Map<String, Object> map);
	
	//보낸 메일함
	public List<UnivMailVO> sentbox(Map<String, Object> map);
	
	//받은 메일함 전체 항목 개수(검색 포함)
	public int getTotalInbox(Map<String, Object> map);
	
	//보낸 메일함 전체 항목 개수(검색 포함)
	public int getTotalSentbox(Map<String, Object> map);

	//읽지 않은 메일 개수
	public int getUnreadTotal(String umlReceiver);

	//메일 작성
	public int sendMail(UnivMailVO univMailVO);

	//받은 메일 상세
	public UnivMailVO receiveMailDetail(String umlCd);

	//보낸 메일 상세
	public UnivMailVO sendMailDetail(String umlCd);

	//메일 삭제
	public int deleteMail(String umlCd);

	//메일 읽음
	public int readReceiveMail(String umlCd);

	//임시 보관함
	public List<UnivMailVO> tempMailBox(Map<String, Object> map);

	//임시 보관함 전체 항목 개수(검색 포함)
	public int getTotalTempbox(Map<String, Object> map);
	//임시 메일 업데이트
	public int tempMailUpdate(UnivMailVO univMailVO);

	//임시 메일 파일 삭제
	public int deleteFileUpdate(FilesDetailVO filesDetailVO);

	//임시 저장 메일 전송
	public int sendTempMail(UnivMailVO univMailVO);

	//선택 메일 읽음
	public int readCheck(List<String> umlCdList);

	public UnivMailVO getMailByNtfCd(String ntfCd);
	
	// 강의계획신청 결재 메일
	public int lectureApprovalMail(UnivMailVO univMailVO);

}
