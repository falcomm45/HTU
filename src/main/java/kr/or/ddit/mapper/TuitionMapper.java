package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.TuitionVO;

public interface TuitionMapper {

	//등록금 내역 조회
	public List<TuitionVO> tuitionList();

	//나의 등록금 조회
	public List<TuitionVO> myTuition(String stuCd);

	public TuitionVO bill(String tutCd);

	public int insert(TuitionVO tuitionVO);

	public TuitionVO check(TuitionVO tuitionVO);

}
