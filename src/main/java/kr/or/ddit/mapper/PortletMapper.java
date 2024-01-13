package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PortletVO;

public interface PortletMapper {

	public List<PortletVO> myPortlet(String userCd);

	public int insert(List<PortletVO> portletList);

	public int getPorCd();

	public int updatePortlet(Map<String, Object> paramMap);

	public int checkPortlet(String userCd);

	public int updateAll(List<PortletVO> portletList);

}
