package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CommonDetailVO;
import kr.or.ddit.vo.CommonVO;

public interface CommonMapper {
	
	// 공통코드 추가
	public int insert(CommonVO common);
	
	// 전체 공통상세코드 가져오기
	public List<CommonDetailVO> getCommonDetailList();

	public List<CommonDetailVO> getCommonDetails(String comCd);

	public String getRecordCd(String value);

	public List<BoardVO> renderHome(String category);

	public String getLectureName(String lecCd);
}
