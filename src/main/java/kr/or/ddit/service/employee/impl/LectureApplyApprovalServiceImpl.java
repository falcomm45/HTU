package kr.or.ddit.service.employee.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.GradeCriteriaMapper;
import kr.or.ddit.mapper.LectureApplyMapper;
import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.mapper.LectureScheduleMapper;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.mapper.UnivMailMapper;
import kr.or.ddit.service.employee.LectureApplyApprovalService;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.GradeCriteriaVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.LectureScheduleVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.UnivMailVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class LectureApplyApprovalServiceImpl implements LectureApplyApprovalService{
	@Autowired
	ApprovalMapper approvalMapper; 
	@Autowired
	LectureApplyMapper lectureApplyMapper;
	@Autowired
	LectureMapper lectureMapper;
	@Autowired
	LectureScheduleMapper lectureScheduleMapper;
	@Autowired
	UnivMailMapper univMailMapper;
	@Autowired
	NotificationMapper notificationMapper;
	@Autowired
	GradeCriteriaMapper gradeCriteriaMapper;
	
	@Override
	/** 강의계획신청 목록 */
	public List<LectureApplyVO> getLectureApplyList(Map<String, Object> map) {
		return this.approvalMapper.getLectureApplyList(map);
	}

	@Override
	/** 강의계획신청에 대한 상세*/
	public LectureApplyVO lecaApplyDetail(String lecaCd) {
		LectureApplyVO lectureApplyVO = this.lectureApplyMapper.lecaApplyDetail(lecaCd);
		
		return lectureApplyVO;
	}
	@Override
	/** 강의계획신청 결재 */
	public int updateApprovalYn(LectureApplyVO lectureApplyVO) {
		
		ApprovalVO approvalVO = new ApprovalVO();
		approvalVO.setAppCd(lectureApplyVO.getAppCd());
		// 승인여부 1 = 승인, 2 = 반려
		approvalVO.setAppYn(lectureApplyVO.getApprovalVO().getAppYn());
		// 반려사유 등록 appYn = 2 일때만 입력됨
		approvalVO.setAppRet(lectureApplyVO.getApprovalVO().getAppRet());
		
		int result = this.approvalMapper.updateApprovalYn(approvalVO);
		
		return result;
	}
	
	@Transactional
	@Override
	/** 결재가 승인되었을때 실행되는 메서드 강의, 강의일정 데이터가 생성된다 */
	public int afterUpdate(LectureApplyVO lectureApplyVO) {
		
		lectureApplyVO = lecaApplyDetail(lectureApplyVO.getLecaCd());
		NotificationVO notificationVO = new NotificationVO();
		int result = updateApprovalYn(lectureApplyVO);
		log.info("Yn@@ => {}",lectureApplyVO);
		UnivMailVO univMailVO = new UnivMailVO();
		
		// 반려
		if (lectureApplyVO.getApprovalVO().getAppYn() == 2) {
			// 결재가 반려되었을때 결재 반려 메일이 전송됨
			univMailVO.setUmlSender(lectureApplyVO.getApprovalVO().getAppTarget());
			univMailVO.setUmlReceiver(lectureApplyVO.getApprovalVO().getUserCd());
			univMailVO.setUmlTitle("강의계획 신청이 반려되었습니다.");
			univMailVO.setUmlCon("반려사유 : " + lectureApplyVO.getApprovalVO().getAppRet());
			univMailVO.setUmlTemp(0);
			univMailVO.setUmlYn(0);
			
			result += this.univMailMapper.lectureApprovalMail(univMailVO);
		}
		
		// 승인
		if(lectureApplyVO.getApprovalVO().getAppYn() == 1) {
			
			// 결재가 승인되었을때 결재 승인 메일이 전송됨 
			univMailVO.setUmlSender(lectureApplyVO.getApprovalVO().getAppTarget());
			univMailVO.setUmlReceiver(lectureApplyVO.getApprovalVO().getUserCd());
			univMailVO.setUmlTitle("강의계획 신청이 승인되었습니다.");
			univMailVO.setUmlCon("'" + lectureApplyVO.getLecaNm() + "'" + " 강의가 개설되었습니다.");
			univMailVO.setUmlTemp(0);
			univMailVO.setUmlYn(0);
			
			LectureVO lectureVO = new LectureVO();
			LectureScheduleVO lectureScheduleVO = new LectureScheduleVO();
			GradeCriteriaVO gradeCriteriaVO = new GradeCriteriaVO();
			// 강의 생성
			lectureVO.setLectureApplyVO(lectureApplyVO);
			lectureVO.setLecCd(lectureApplyVO.getLecaCd());
			// 강의 일정 생성
			lectureScheduleVO.setLectureVO(lectureVO);
			lectureScheduleVO.setLecCd(lectureScheduleVO.getLectureVO().getLecCd());
			// 성적 처리 기준 생성
			gradeCriteriaVO.setLectureVO(lectureVO);
			gradeCriteriaVO.setLecCd(gradeCriteriaVO.getLectureVO().getLecCd());
			
//			notificationVO.setComdCd("ALAM12");
//			notificationVO.setUserCd(univMailVO.getUmlReceiver());
//			notificationVO.setNtfUrl("/professor/gradecriteria/create?lecCd=" + lectureApplyVO.getLecaCd());
			
			result += this.lectureMapper.createLecture(lectureVO);
			result += this.lectureScheduleMapper.createLectureSchedule(lectureScheduleVO);
			result += this.gradeCriteriaMapper.gradeCriteriaCreatePost(gradeCriteriaVO);
			result += this.univMailMapper.lectureApprovalMail(univMailVO);
//			result += this.notificationMapper.insert(notificationVO);
		}
		// 결재결과 메일 알림
		if (univMailVO.getUmlYn() == 0) {
			
			notificationVO.setComdCd("ALAM03");
			notificationVO.setUserCd(univMailVO.getUmlReceiver());
			notificationVO.setNtfUrl("/mail/receiveDetail?umlCd="+univMailVO.getUmlCd());
			notificationVO.setNtfCon(univMailVO.getUmlSender());
			
			result += this.notificationMapper.insert(notificationVO);
		}
		return result;
	}

	@Override
	/** 페이징처리용 */
	public int getTotal(Map<String, Object> map) {
		return this.approvalMapper.getTotal(map);
	}

	@Override
	public List<LectureApplyVO> getLectureApplyVOStandbyList(Map<String, Object> map) {
		return this.approvalMapper.getLectureApplyVOStandbyList(map);
	}

}
