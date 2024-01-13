package kr.or.ddit.service.student;

import java.util.List;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.RecordVO;

public interface RecordService {

	public List<RecordVO> getRecord(String stuCd);

    public List<RecordVO> renderRecord(ApprovalVO approvalVO);

}
