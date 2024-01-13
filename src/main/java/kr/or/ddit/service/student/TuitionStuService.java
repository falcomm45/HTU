package kr.or.ddit.service.student;

import java.util.List;

import kr.or.ddit.vo.TuitionVO;

public interface TuitionStuService {

	//나의 등록금 조회
	public List<TuitionVO> myTuition(String stuCd);

	public TuitionVO bill(String tutCd);

	public int insert(TuitionVO tuitionVO);

	public TuitionVO check(TuitionVO tuitionVO);

}
