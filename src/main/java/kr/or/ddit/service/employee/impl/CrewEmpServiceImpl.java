package kr.or.ddit.service.employee.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.CrewMapper;
import kr.or.ddit.service.employee.CrewEmpService;
import kr.or.ddit.vo.CrewPersonnelVO;
import kr.or.ddit.vo.CrewVO;

@Service
public class CrewEmpServiceImpl implements CrewEmpService {

	@Autowired
	CrewMapper crewMapper;

	//동아리 개설 승인 상태 변경
	@Override
	public int crewUpdateYn(String appCd) {
		return this.crewMapper.crewUpdateYn(appCd);
	}

	//동아리 회장 등록
	@Override
	public int crewJoinApp(CrewPersonnelVO crewPersonnelVO) {
		return this.crewMapper.crewJoinApp(crewPersonnelVO);
	}

	//동아리 조회 (학사 관리자)
	@Override
	public List<CrewVO> crewListEmp(Map<String, Object> map) {
		return this.crewMapper.crewListEmp(map);
	}

	//총 동아리 수
	@Override
	public int crewTotal() {
		return this.crewMapper.crewTotal();
	}
	
	//운영 동아리 수
	@Override
	public int actCrewTotal() {
		return this.crewMapper.actCrewTotal();
	} 
	
	//동아리 상세 (학사 관리자)
	@Override
	public CrewVO crewDetailEmp(String crCd) {
		return this.crewMapper.crewDetailEmp(crCd);
	}
	
	//동아리 폐쇄
	@Override
	public int deleteCrew(String crCd) {
		return this.crewMapper.deleteCrew(crCd);
	}

	//동아리원 삭제
	@Override
	public int deleteCrewPerson(String crCd) {
		return this.crewMapper.deleteCrewPerson(crCd);
	}

	//동아리 개설 신청서 조회
	@Override
	public CrewVO crewAppForm(String crCd) {
		return this.crewMapper.crewAppForm(crCd);
	}

}
