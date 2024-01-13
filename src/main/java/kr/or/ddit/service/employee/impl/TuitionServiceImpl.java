package kr.or.ddit.service.employee.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.TuitionMapper;
import kr.or.ddit.service.employee.TuitionService;
import kr.or.ddit.vo.TuitionVO;

@Service
public class TuitionServiceImpl implements TuitionService{

	@Autowired
	TuitionMapper tuitionMapper;
	
	//등록금 내역 조회
	@Override
	public List<TuitionVO> tuitionList() {
		return this.tuitionMapper.tuitionList();
	}

}
