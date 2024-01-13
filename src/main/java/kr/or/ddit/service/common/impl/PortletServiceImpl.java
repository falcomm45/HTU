package kr.or.ddit.service.common.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.PortletMapper;
import kr.or.ddit.service.common.PortletService;
import kr.or.ddit.vo.PortletVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PortletServiceImpl implements PortletService{

	private final PortletMapper portletMapper;
	
	@Override
	public List<PortletVO> myPortlet(String userCd) {
		return this.portletMapper.myPortlet(userCd);
	}

	@Override
	public int insert(List<PortletVO> portletList) {
		return this.portletMapper.insert(portletList);
	}

	@Override
	public int updatePortlet(Map<String, Object> paramMap) {
		return this.portletMapper.updatePortlet(paramMap);
	}

	@Override
	public boolean checkPortlet(String userCd) {
		int cnt = this.portletMapper.checkPortlet(userCd);
		if (cnt != 0) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public int updateAll(List<PortletVO> portletList) {
		return this.portletMapper.updateAll(portletList);
	}

}
