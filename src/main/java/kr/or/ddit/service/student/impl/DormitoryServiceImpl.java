package kr.or.ddit.service.student.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.DormitoryMapper;
import kr.or.ddit.service.student.DormitoryService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.DormitoryVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DormitoryServiceImpl implements DormitoryService {
	
	@Autowired 
	DormitoryMapper dormitoryMapper;
	@Autowired
	ApprovalMapper approvalMapper;

@Override
public int createApplyDormitoryConsent(DormitoryVO dormitoryVO) {
	
	log.info("const-> dormitoryVO : " + dormitoryVO);
	
	ApprovalVO appVO = new ApprovalVO();
	appVO.setUserCd(dormitoryVO.getStuCd());
	appVO.setComdCd("APPR05");
	appVO.setAppTarget("1001");
	
	log.info("appVO : " + appVO);
	int cnt = this.dormitoryMapper.createApplyDormitoryConsent(appVO);
	
	dormitoryVO.setAppCd(appVO.getAppCd());
	cnt += this.dormitoryMapper.createApplyDormitory(dormitoryVO);
	
	return cnt;
}

@Override
public List<DormitoryVO> list(String stuCd) {
	return this.dormitoryMapper.list(stuCd);
}

@Override
public int paymentDormitory(Map<String, Object> map) {
	return this.dormitoryMapper.paymentDormitory(map);
}
/**
 * 기숙사중복신청 방지
 */
@Override
public boolean isDuplicatedApplication(String stuCd, int domYear, int domSem) {
	
		List<DormitoryVO> list = this.list(stuCd);
		boolean check = false;
		
		log.info("list@@ ==> {}", list);
		log.info("stuCd@@ ==> {}", stuCd);
		log.info("domYear@@ ==> {}", domYear);
		log.info("domSem@@ ==> {}", domSem);
		
		for(DormitoryVO dormitoryVO : list) {
			
			if (dormitoryVO.getStuCd().equals(stuCd) &&
		            dormitoryVO.getDomYear() == domYear &&
		            dormitoryVO.getDomSem() == domSem) {
				check = true;
				break;
		}
	}
		return check;

	}

@Override
public List<DormitoryVO> renderDormitory(ApprovalVO approvalVO) {
	return this.dormitoryMapper.renderDormitory(approvalVO);
}
}