package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.DormitoryVO;

public interface DormitoryMapper {

	public int createApplyDormitoryConsent(ApprovalVO approvalVO);
	
	public int createApplyDormitory(DormitoryVO dormitoryVO);

	public List<DormitoryVO> list(String stuCd);

	public DormitoryVO dormitoryDetail(String domCd);
	
	int updateDormitoryApplyConCd(DormitoryVO dormitoryVO);
	
	public DormitoryVO getDormitoryInfoByStuCd(String stuCd);

	int updateDormitoryRoomCd(DormitoryVO dormitoryVO);

	public int paymentDormitory(Map<String, Object> map);

	public int updateApplyDormitory(DormitoryVO dormitoryVO);

	public List<DormitoryVO> renderDormitory(ApprovalVO approvalVO);

}
