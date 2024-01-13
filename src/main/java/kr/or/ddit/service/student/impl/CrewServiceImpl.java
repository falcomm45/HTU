package kr.or.ddit.service.student.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.CrewMapper;
import kr.or.ddit.service.student.CrewService;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.CrewActivityVO;
import kr.or.ddit.vo.CrewPersonnelVO;
import kr.or.ddit.vo.CrewVO;
import kr.or.ddit.vo.FilesDetailVO;
import kr.or.ddit.vo.NotificationVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CrewServiceImpl implements CrewService{

	@Autowired
	CrewMapper crewMapper;
	
	@Autowired
	ApprovalMapper approvalMapper;
	
	@Autowired
	FileUtil fileUtil;
	
	//동아리 조회
	@Override
	public List<CrewVO> crewList(Map<String, Object> map) {
		return this.crewMapper.crewList(map);
	}

	//나의 동아리
	@Override
	public List<CrewVO> myCrew(String stuCd) {
		return this.crewMapper.myCrew(stuCd);
	}
	
	//동아리 개설 신청
	@Override
	public int crewApply(CrewVO crewVO) {
		int result = this.crewMapper.crewApply(crewVO);
		
		//첨부파일 등록
		result += this.fileUtil.uploadFile(crewVO.getUploadFiles(), crewVO.getCrCd());
		log.info("crewApply->crewVO : " + crewVO);
		
		return result;
	}
	
	//동아리 상세
	@Override
	public CrewVO crewDetail(String crCd) {
		return this.crewMapper.crewDetail(crCd);
	}
	
	//동아리 가입 여부 확인
	@Override
	public CrewPersonnelVO crewJoinCheck(String crCd, String userCd) {
		return this.crewMapper.crewJoinCheck(crCd, userCd);
	}
	
	//동아리원 조회
	@Override
	public List<CrewVO> crewPersonnel(String crCd) {
		return this.crewMapper.crewPersonnel(crCd);
	}
	
	//동아리 활동 내역 조회
	@Override
	public List<CrewActivityVO> activityList(String crCd) {
		return this.crewMapper.activityList(crCd);
	}
	
	//가입 신청 여부(중복 신청 방지)
	@Override
	public CrewVO joinAppCheck(String stuCd, String crCd) {
		return this.crewMapper.joinAppCheck(stuCd, crCd);
	}
	
	//동아리 가입 승인
	@Override
	public int crewJoinApp(CrewPersonnelVO crewPersonnelVO) {
		return this.crewMapper.crewJoinApp(crewPersonnelVO);
	}

	//동아리 수정
	@Override
	public int crewUpdate(CrewVO crewVO) {
		int result = this.crewMapper.crewUpdate(crewVO);
		
		//첨부파일 등록
		result += this.fileUtil.uploadFile(crewVO.getUploadFiles(), crewVO.getCrCd());
		log.info("crewUpdate->crewVO : " + crewVO);
		
		return result;
	}
	
	//동아리 수정 중 파일 삭제
	@Override
	public int deleteFileUpdate(FilesDetailVO filesDetailVO) {
		int result = this.fileUtil.deleteFileUpdate(filesDetailVO.getFileCd(), filesDetailVO.getFileSn());
		
		return result;
	}

	//동아리 탈퇴
	@Override
	public int crewQuit(String stuCd, String crCd) {
		return this.crewMapper.crewQuit(stuCd, crCd);
	}

	//동아리 개설 신청 내역 조회
	@Override
	public List<CrewVO> myAppList(String userCd) {
		return this.crewMapper.myAppList(userCd);
	}

	//동아리 가입 신청 내역 조회
	@Override
	public List<CrewVO> myJoinAppList(String userCd) {
		return this.crewMapper.myJoinAppList(userCd);
	}

	//동아리 활동 등록
	@Override
	public int addCrewActivity(CrewActivityVO crewActivityVO) {
		
		int result = this.crewMapper.addCrewActivity(crewActivityVO);
		
		//첨부파일 등록
		result += this.fileUtil.uploadFile(crewActivityVO.getUploadFiles(), crewActivityVO.getCraCd());
		log.info("addCrewActivity->crewActivityVO : " + crewActivityVO);
		
		return result;
	}
	
//	//반려 사유 등록
//	@Override
//	public ApprovalVO appRetReason(String appCd) {
//		return this.crewMapper.appRetReason(appCd);
//	}

	//동아리 활동 상세
	@Override
	public CrewActivityVO crewActivityDetail(String craCd) {
		return this.crewMapper.crewActivityDetail(craCd);
	}



}
