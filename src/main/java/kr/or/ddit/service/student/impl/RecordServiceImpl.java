package kr.or.ddit.service.student.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.RecordMapper;
import kr.or.ddit.service.student.RecordService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.RecordVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class RecordServiceImpl implements RecordService{
	
	private final RecordMapper recordMapper;
	
	@Override
	public List<RecordVO> getRecord(String stuCd) {
		return this.recordMapper.getRecord(stuCd);
	}

	@Override
	public List<RecordVO> renderRecord(ApprovalVO approvalVO) {
		return this.recordMapper.renderRecord(approvalVO);
	}

}
