package kr.or.ddit.service.employee.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.DormitoryMapper;
import kr.or.ddit.mapper.RoomMapper;
import kr.or.ddit.service.employee.DormitoryApprovalService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.CommonDetailVO;
import kr.or.ddit.vo.DormitoryVO;
import kr.or.ddit.vo.RoomVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DormitoryApprovalServiceImpl implements DormitoryApprovalService {
	
	@Autowired
	ApprovalMapper approvalMapper; 
	
	@Autowired
	DormitoryMapper dormitoryMapper;
	
	@Autowired
	RoomMapper roomMapper;
	
	@Override
	public int getTotal(Map<String, Object> map) {
		return this.approvalMapper.getTotal(map);
	}

	@Override
	public List<DormitoryVO> getDormitoryList(Map<String, Object> map) {
		return this.approvalMapper.getDormitoryList(map);
	}

	@Override
	public DormitoryVO dormitoryDetail(String domCd) {
		DormitoryVO dormitoryVO =  this.dormitoryMapper.dormitoryDetail(domCd);
		
		return dormitoryVO;
	}

	@Override
	public int updateApprovalYnAndComdCd(DormitoryVO dormitoryVO) {
		
		// 신청 학생 정보 없으면 승인 불가능
		if (dormitoryVO.getStuCd() == null || dormitoryVO.getStuCd().equals("")) {
			return -1;
		}
		
		// 신청한 학생 정보로 기숙사 신청정보 가져오기
//		DormitoryVO getDormitoryVO = new DormitoryVO();
//		getDormitoryVO = dormitoryMapper.getDormitoryInfoByStuCd(dormitoryVO.getStuCd());	
		
//		// 신청정보 없으면 승인 불가능
//		if (dormitoryVO.getDomCd() == null) {
//			return -1;
//		}
		
		// 방번호 가져오기
		RoomVO roomVO = roomMapper.getEmptyRoomCd(dormitoryVO.getBldCd());
		
		// 방번호 없으면 승인 불가능
		if (roomVO.getRoomCd() == null) {
			return -1;
		}
		
		// 방번호 TEL +1 업데이트해주기
		roomMapper.updateRoomTel(roomVO);
		
		// 도미토리 ROOM_CD에 방번호 업데이트
		DormitoryVO updateDormitoryVO = new DormitoryVO();
//		updateDormitoryVO.setDomCd(dormitoryVO.getDomCd());
		updateDormitoryVO.setAppCd(dormitoryVO.getAppCd());
		updateDormitoryVO.setRoomCd(roomVO.getRoomCd());
		dormitoryMapper.updateDormitoryRoomCd(updateDormitoryVO);
		
		// 최종 승인처리
		ApprovalVO approvalVO = new ApprovalVO();
		approvalVO.setAppCd(dormitoryVO.getAppCd());
		approvalVO.setAppYn(dormitoryVO.getApprovalVO().getAppYn());
		
		approvalVO.setAppRet(dormitoryVO.getApprovalVO().getAppRet());
		dormitoryVO.setApprovalVO(approvalVO);
		
		//1) APP_YN을 Y처리
		int result = this.approvalMapper.updateApprovalYn(approvalVO);
//		//updateApprovalYnAndComdCd->approvalVO : ApprovalVO(appCd=442, appPcd=null, userCd=null, comdCd=null, appTarget=null, appYn=1,
//		log.info("updateApprovalYnAndComdCd->approvalVO : " + approvalVO);
//		//2) PAYM01 / PAYM02 처리
//		if(approvalVO.getAppYn()==1) {
//			dormitoryVO.setApprovalVO(approvalVO);
//			log.info("왔다");
//			result += this.approvalMapper.updateApprovalYnAndComdCd(dormitoryVO);
//		}
		return result;
	}
	
	@Transactional
	@Override
	public int afterUpdate(DormitoryVO dormitoryVO) {
		
		int result = 0;
		
		log.info("ㅇㅇ : " + dormitoryVO.getApprovalVO());
		if(dormitoryVO.getApprovalVO().getAppYn() == 1) {
			
//			CommonDetailVO commonDetailVO = new CommonDetailVO();
//			dormitoryVO.setComdCd(commonDetailVO.getComdCd());
			if(dormitoryVO.getBldCd().equals("BULD10")) {
				dormitoryVO.setComdCd("PAYM01");
			}else if(dormitoryVO.getBldCd().equals("BULD11")) {
				dormitoryVO.setComdCd("PAYM02");
			}
			result += this.dormitoryMapper.updateApplyDormitory(dormitoryVO);
			log.info("ㅇㅇ2 : " + dormitoryVO);
			
		}
		
		return result;
	}
}
