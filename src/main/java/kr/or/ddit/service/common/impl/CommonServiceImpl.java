package kr.or.ddit.service.common.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.CommonMapper;
import kr.or.ddit.service.common.CommonService;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CommonDetailVO;
import kr.or.ddit.vo.CommonVO;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommonServiceImpl implements CommonService{
	
	private final CommonMapper commonMapper;

	@Override
	public int insert(CommonVO common) {
		return this.commonMapper.insert(common);
	}

	@Override
	public List<CommonDetailVO> getCommonDetails(String comCd) {
		return this.commonMapper.getCommonDetails(comCd);
	}

	@Override
	public List<BoardVO> renderHome(String category) {
		if (category.equals("free")) {
			return this.commonMapper.renderHome("BORD01");
		} else if (category.equals("publicize")) {
			return this.commonMapper.renderHome("BORD02");
		} else if (category.equals("anonymous")) {
			return this.commonMapper.renderHome("BORD03");
		}
		return null;
	}

	@Override
	public String getLectureName(String lecCd) {
		return commonMapper.getLectureName(lecCd);
	}
	
}
