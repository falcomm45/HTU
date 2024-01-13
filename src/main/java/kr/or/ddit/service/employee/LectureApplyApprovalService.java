package kr.or.ddit.service.employee;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.LectureApplyVO;

public interface LectureApplyApprovalService {

	/**결재완료된 강의계획신청 리스트
	 * @param map */
	List<LectureApplyVO> getLectureApplyList(Map<String, Object> map);
	/**결재요청된 강의계획신청의 상세*/
	LectureApplyVO lecaApplyDetail(String lecaCd);
	/**강의계획신청 승인, 반려*/
	int updateApprovalYn(LectureApplyVO lectureApplyVO);
	/**강의데이터생성 -> 강의일정데이터 생성 (반려시 반려사유등록 강의와 강의일정데이터는 생성X)*/
	int afterUpdate(LectureApplyVO lectureApplyVO);
	/**페이징처리하기*/
	int getTotal(Map<String, Object> map);
	/**결재요청된 강의계획신청 리스트
	 * @param map */
	List<LectureApplyVO> getLectureApplyVOStandbyList(Map<String, Object> map);


}
