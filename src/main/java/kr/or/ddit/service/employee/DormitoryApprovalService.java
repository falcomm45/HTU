package kr.or.ddit.service.employee;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DormitoryVO;

public interface DormitoryApprovalService {

	int getTotal(Map<String, Object> map);

	List<DormitoryVO> getDormitoryList(Map<String, Object> map);

	DormitoryVO dormitoryDetail(String domCd);

	int updateApprovalYnAndComdCd(DormitoryVO dormitoryVO);

	int afterUpdate(DormitoryVO dormitoryVO);


}
