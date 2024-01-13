package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ObjectionVO;

public interface ObjectionMapper {

	public int insertObjection(ObjectionVO objectionVO);

	public List<ObjectionVO> list(String lecCd);

	public int updateGrade(Map<String, String> paramMap);

	public String getLecCd(String crtrCd);

	public int updateRpl(ObjectionVO objectionVO);

}
