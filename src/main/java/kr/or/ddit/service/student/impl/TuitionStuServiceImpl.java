package kr.or.ddit.service.student.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.TuitionMapper;
import kr.or.ddit.service.student.TuitionStuService;
import kr.or.ddit.vo.TuitionVO;

@Service
public class TuitionStuServiceImpl implements TuitionStuService{

	@Autowired
	TuitionMapper tuitionMapper;
	
	//나의 등록금 조회
	@Override
	public List<TuitionVO> myTuition(String stuCd) {
		return this.tuitionMapper.myTuition(stuCd);
	}

	@Override
	public TuitionVO bill(String tutCd) {
		return this.tuitionMapper.bill(tutCd);
	}

	@Override
	public int insert(TuitionVO tuitionVO) {
		return this.tuitionMapper.insert(tuitionVO);
	}

	@Override
	public TuitionVO check(TuitionVO tuitionVO) {
		return this.tuitionMapper.check(tuitionVO);
	}

}
