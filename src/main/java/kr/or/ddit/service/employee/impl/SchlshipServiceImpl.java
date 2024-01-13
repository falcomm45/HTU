package kr.or.ddit.service.employee.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.SchlshipMapper;
import kr.or.ddit.service.employee.SchlshipService;
import kr.or.ddit.vo.SchlshipVO;
import kr.or.ddit.vo.StudentVO;

@Service
public class SchlshipServiceImpl implements SchlshipService {

	@Autowired
	SchlshipMapper schlshipMapper;
	
	//장학금 수여 대상 학생 목록
	@Override
	public List<StudentVO> awardSchlship() {
		return this.schlshipMapper.awardSchlship();
	}

	//장학금 정보
	@Override
	public SchlshipVO scVO(String stuCd) {
		return this.schlshipMapper.scVO(stuCd);
	}

	//장학금 수여
	@Override
	public int award(SchlshipVO schlshipVO) {
		return this.schlshipMapper.award(schlshipVO);
	}

	//장학생 조회
	@Override
	public List<SchlshipVO> schlshipList() {
		return this.schlshipMapper.schlshipList();
	}

	//장학생 정보
	@Override
	public StudentVO stuVO(String stuCd) {
		return this.schlshipMapper.stuVO(stuCd);
	}

	//장학생 조회 - 연도 선택
	@Override
	public List<SchlshipVO> searchYear(String sclYear) {
		return this.schlshipMapper.searchYear(sclYear);
	}

	//장학생 조회 - 학기 선택
	@Override
	public List<SchlshipVO> searchSem(String sclYear, String sclSem) {
		return this.schlshipMapper.searchSem(sclYear, sclSem);
	}

}
