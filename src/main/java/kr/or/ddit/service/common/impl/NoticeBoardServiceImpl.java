package kr.or.ddit.service.common.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.FilesDetailMapper;
import kr.or.ddit.mapper.FreeBoardMapper;
import kr.or.ddit.mapper.NoticeBoardMapper;
import kr.or.ddit.service.common.NoticeBoardService;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Criteria;
import kr.or.ddit.vo.NoticeBoardVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class NoticeBoardServiceImpl implements NoticeBoardService{
	
	@Autowired
	NoticeBoardMapper noticeBoardMapper;
	
	@Autowired
	FilesDetailMapper fileMapper;
	
	@Autowired
	FileUtil fileUtil;
	
	
	@Override
	public int create(NoticeBoardVO noticeBoardVO) {
		log.info("create->noticeBoardVO : " + noticeBoardVO);
		
		int result = this.noticeBoardMapper.create(noticeBoardVO);
		
		result += this.fileUtil.uploadFile(noticeBoardVO.getUploadFiles(), noticeBoardVO.getNbCd());
		
		return result;
	}

	@Override
	public List<NoticeBoardVO> list() {
		return this.noticeBoardMapper.list();
	}

	@Override
	public NoticeBoardVO detail(String nbCd) {
		return this.noticeBoardMapper.detail(nbCd);
	}

	@Override
	public int count(String nbCd) {
		NoticeBoardVO noticeBoardVO = new NoticeBoardVO();
		noticeBoardVO.setNbCd(nbCd);
		return this.noticeBoardMapper.count(noticeBoardVO);
	}

	

	@Override
	public int updatePost(NoticeBoardVO noticeBoardVO) {
		return this.noticeBoardMapper.updatePost(noticeBoardVO);
	}
	
	@Override
	public int deletePost(Map<String, String> map) {
		return this.noticeBoardMapper.deletePost(map);
	}

	@Override
	public List<NoticeBoardVO> getList(Criteria cri) {
		return this.noticeBoardMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return this.noticeBoardMapper.getTotalCount(cri);
	}

	@Override
	public List<NoticeBoardVO> renderHome() {
		return this.noticeBoardMapper.renderHome();
	}

	@Override
	public int updateYN(String str) {
		return this.noticeBoardMapper.updateYn(str);
	}
	
	@Override
	public int updateYNClear(String str) {
		return this.noticeBoardMapper.updateYnClear(str);
	}

	@Override
	public int update(NoticeBoardVO noticeBoardVO) {
		return this.noticeBoardMapper.update(noticeBoardVO);
	}
	
	

	
}

