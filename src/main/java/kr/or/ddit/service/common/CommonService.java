package kr.or.ddit.service.common;

import java.util.List;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CommonDetailVO;
import kr.or.ddit.vo.CommonVO;

public interface CommonService {

	public int insert(CommonVO common);

	public List<CommonDetailVO> getCommonDetails(String comCd);

	public List<BoardVO> renderHome(String category);

	public String getLectureName(String lecCd);
	
	
	
}
