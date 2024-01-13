package kr.or.ddit.service.student;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.DormitoryVO;

public interface DormitoryService {

	int createApplyDormitoryConsent(DormitoryVO dormitoryVO);

	List<DormitoryVO> list(String stuCd);

	int paymentDormitory(Map<String, Object> map);

	boolean isDuplicatedApplication(String stuCd, int domYear, int domSem);

	List<DormitoryVO> renderDormitory(ApprovalVO approvalVO);


}
