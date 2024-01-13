package kr.or.ddit.service.common.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.FilesDetailMapper;
import kr.or.ddit.mapper.FreeBoardMapper;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CommentVO;
import kr.or.ddit.vo.Criteria;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class FreeBoardServiceImpl implements kr.or.ddit.service.common.FreeBoardService {

	@Autowired
	FreeBoardMapper freeBoardMapper;

	@Autowired
	FilesDetailMapper fileMapper;


	@Autowired
	FileUtil fileUtil;

	// 자유게시판 목록
	@Override
	public List<BoardVO> list(Criteria cri) {
		return this.freeBoardMapper.list(cri);
	}

	// 자유게시판 등록
	@Override
	public int create(BoardVO boardVO) {

		int result = this.freeBoardMapper.create(boardVO);

		result += fileUtil.uploadFile(boardVO.getUploadFiles(), boardVO.getBdCd());

		return result;
	}

	// 자유게시판 상세
	public BoardVO detail(String bdCd) {
		BoardVO boardVO = this.freeBoardMapper.detail(bdCd);
		
		List<CommentVO> commentList = this.freeBoardMapper.getCommentList(bdCd);
		boardVO.setCommentList(commentList);
		
		return boardVO;
	}

	// 자유게시판 수정
	@Override
	public int update(BoardVO boardVO) {
		int result = this.freeBoardMapper.update(boardVO);

		result += fileUtil.uploadFile(boardVO.getUploadFiles(), boardVO.getBdCd());

		return result;
	}

	// 조회수 카운트
	@Override
	public int count(String bdCd) {
		BoardVO boardVO = new BoardVO();
		boardVO.setBdCd(bdCd);
		return this.freeBoardMapper.count(boardVO);
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return this.freeBoardMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return this.freeBoardMapper.getTotalCount(cri);
	}

	@Override
	public int delete(Map<String, String> map) {
		return this.freeBoardMapper.delete(map);
	}

}