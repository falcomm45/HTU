package kr.or.ddit.service.student.impl;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.mapper.ObjectionMapper;
import kr.or.ddit.service.student.ObjectionService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.ObjectionVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ObjectionServiceImpl implements ObjectionService{
	
	private final ObjectionMapper objectionMapper;
	
	private final ApprovalMapper approvalMapper;
	
	private final NotificationMapper notificationMapper;

	@Override
	public int appObjection(ObjectionVO objectionVO) {
		
		ApprovalVO approvalVO = new ApprovalVO();
		approvalVO.setUserCd(objectionVO.getStuCd());
		approvalVO.setAppTarget(objectionVO.getAppCd());
		approvalVO.setComdCd("APPR07");
		
		int cnt = this.approvalMapper.insert(approvalVO);
		objectionVO.setAppCd(approvalVO.getAppCd());
		
		cnt += this.objectionMapper.insertObjection(objectionVO);
		
		String lecCd = objectionMapper.getLecCd(objectionVO.getCrtrCd());
		
		NotificationVO notificationVO = new NotificationVO("ALAM13", approvalVO.getAppTarget(), "/professor/objection/list?lecCd=" + lecCd, objectionVO.getStuCd());
		
		cnt += this.notificationMapper.insert(notificationVO);
		
		return cnt;
	}

}
