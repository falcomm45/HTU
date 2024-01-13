package kr.or.ddit.service.professor.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.ObjectionMapper;
import kr.or.ddit.service.professor.LectureObjectionService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.ObjectionVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LectureObjectionServiceImpl implements LectureObjectionService{
	
	private final ObjectionMapper objectionMapper;
	
	private final ApprovalMapper approvalMapper;
	
	@Override
	public List<ObjectionVO> list(String lecCd) {
		return this.objectionMapper.list(lecCd);
	}

	@Override
	public int recognizeObjection(ObjectionVO objectionVO) {
		
		ApprovalVO appVO = new ApprovalVO();
		appVO.setAppYn(objectionVO.getApprovalVO().getAppYn());
		appVO.setAppCd(objectionVO.getAppCd());
		
		int cnt = this.approvalMapper.updateApprovalYn(appVO);
		
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("crtrCd", objectionVO.getCrtrCd());
		paramMap.put("stuCd", objectionVO.getStuCd());
		paramMap.put("lecgGrade", objectionVO.getLectureGradeVO().getLecgGrade());
		cnt += this.objectionMapper.updateGrade(paramMap);
		
		return cnt;
	}

	@Override
	public int companionObjection(ObjectionVO objectionVO) {
		
		ApprovalVO appVO = new ApprovalVO();
		appVO.setAppCd(objectionVO.getAppCd());
		appVO.setAppYn(objectionVO.getApprovalVO().getAppYn());
		appVO.setAppRet(objectionVO.getApprovalVO().getAppRet());
		
		int result = this.approvalMapper.updateApprovalYn(appVO);
		
		result += this.objectionMapper.updateRpl(objectionVO);
		
		return result;
	}
	
}
