package kr.or.ddit.service.student.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.SchlshipMapper;
import kr.or.ddit.mapper.TuitionMapper;
import kr.or.ddit.service.employee.SchlshipService;
import kr.or.ddit.service.student.SchlshipStuService;
import kr.or.ddit.vo.SchlshipVO;

@Service
public class SchlshipStuServiceImpl implements SchlshipStuService{

	@Autowired
	SchlshipMapper schlshipMapper;

	//나의 장학금 조회
	@Override
	public List<SchlshipVO> mySchlship(String stuCd) {
		return this.schlshipMapper.mySchlship(stuCd);
	}
}
