package kr.or.ddit.service.student.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.StudentMapper;
import kr.or.ddit.service.student.StudentService;
import kr.or.ddit.vo.OrganizationChartVO;
import kr.or.ddit.vo.StudentVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StudentServiceImpl implements StudentService {
	
	private final StudentMapper stuMapper;
	
	@Override
	public StudentVO getStudent(String userCd) {
		
		return this.stuMapper.getStudent(userCd);
		
	}

	@Override
	public List<OrganizationChartVO> chartList() {
		return this.stuMapper.chartList();
	}

	@Override
	public String sideStatus(String userCd) {
		return this.stuMapper.sideStatus(userCd);
	}

}
