package kr.or.ddit.service.student;

import java.util.List;

import kr.or.ddit.vo.SchlshipVO;

public interface SchlshipStuService {

	//나의 장학금 조회
	public List<SchlshipVO> mySchlship(String stuCd);

}
