package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.RecordVO;

public interface RecordMapper {

	public List<RecordVO> getRecord(String stuCd);

    public List<RecordVO> renderRecord(ApprovalVO approvalVO);

}
