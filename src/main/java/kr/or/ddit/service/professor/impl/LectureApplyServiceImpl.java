package kr.or.ddit.service.professor.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.LectureApplyMapper;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.service.professor.LectureApplyService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.ProfessorVO;
import kr.or.ddit.vo.UserVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class LectureApplyServiceImpl implements LectureApplyService{
	
	@Autowired
	LectureApplyMapper lectureApplyMapper;
	
	@Autowired
	NotificationMapper notificationMapper; 
	
	
	@Transactional
	@Override
	/** 강의계획신청서 작성 */
	public int createLectureApplyApproval(LectureApplyVO lectureApplyVO) {
		UserVO userVO = new UserVO();
		ProfessorVO professorVO = new ProfessorVO();
		ApprovalVO approvalVO = lectureApplyVO.getApprovalVO();
		// 승인데이터 생성
		int result = this.lectureApplyMapper.createLectureApplyApproval(approvalVO);
		
		userVO.setUserCd(approvalVO.getUserCd());
		professorVO.setUserVO(userVO);
		professorVO.setProCd(professorVO.getUserVO().getUserCd());
		
		// 강의신청테이블 교번에 세팅된 교번세팅
		lectureApplyVO.setApprovalVO(approvalVO);
		lectureApplyVO.setProfessorVO(professorVO);
		
		lectureApplyVO.setProCd(professorVO.getProCd());
		lectureApplyVO.setAppCd(approvalVO.getAppCd());
	
		// 강의신청계획 데이터 생성
		result += this.lectureApplyMapper.createLectureApply(lectureApplyVO);
		
		log.info("@@@@ => {},", lectureApplyVO);
		
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setUserCd(approvalVO.getAppTarget());
		notificationVO.setComdCd("ALAM11");
		notificationVO.setNtfUrl("/employee/lectureapprovla/detail?lecaCd=" + lectureApplyVO.getLecaCd());
		notificationVO.setNtfCon(lectureApplyVO.getLecaNm());
		result += this.notificationMapper.insert(notificationVO);
		
		return result;
	}


	@Override
	public List<UserVO> getEmployee() {
		return this.lectureApplyMapper.getEmployee();
	}


	@Override
	public List<LectureApplyVO> standbyLectureApplyList(String proCd) {
		return this.lectureApplyMapper.standbyLectureApplyList(proCd);
	}


	@Override
	public List<LectureVO> approveLectureApplyList(String proCd) {
		return this.lectureApplyMapper.approveLectureApplyList(proCd);
	}


	@Override
	public List<LectureApplyVO> returnLectureApplyList(String proCd) {
		return this.lectureApplyMapper.returnLectureApplyList(proCd);
	}


	@Override
	public LectureApplyVO proLectureApplyDetail(Map<String, Object> map) {
		return this.lectureApplyMapper.proLectureApplyDetail(map);
	}


	@Override
	public List<LectureApplyVO> renderLectureApply(ApprovalVO approvalVO) {
		return this.lectureApplyMapper.renderLectureApply(approvalVO);
	}

}
