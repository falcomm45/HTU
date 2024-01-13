package kr.or.ddit.service.common;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.PortletVO;

public interface PortletService {

	public List<PortletVO> myPortlet(String userCd);

	public int insert(List<PortletVO> portletList);

	public int updatePortlet(Map<String, Object> paramMap);

	public boolean checkPortlet(String userCd);

	public int updateAll(List<PortletVO> portletList);

}
