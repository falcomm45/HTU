package kr.or.ddit.service.employee;

import java.util.List;

import kr.or.ddit.vo.TuitionVO;

public interface TuitionService {

	//등록금 내역 조회
	public List<TuitionVO> tuitionList();

}
