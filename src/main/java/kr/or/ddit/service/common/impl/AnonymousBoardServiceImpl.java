package kr.or.ddit.service.common.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.FilesDetailMapper;
import kr.or.ddit.mapper.AnonymousBoardMapper;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Criteria;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AnonymousBoardServiceImpl implements kr.or.ddit.service.common.AnonymousBoardService {

	@Autowired
	FilesDetailMapper fileMapper;

	@Autowired
	AnonymousBoardMapper anonymousBoardMapper;

	@Autowired
	FileUtil fileUtil;

	// 자유게시판 목록
	@Override
	public List<BoardVO> list(Criteria cri) {
		return this.anonymousBoardMapper.list(cri);
	}

	// 자유게시판 등록
	@Override
	public int create(BoardVO boardVO) {
		// BoardVO(bdCd=null, userCd=1001, comdCd=null, bdTitle=1212, bdCon=sfd,
		// bdReg=null, bdUdt=null, bdCnt=0, userVO=null,
		// userNm=작성자, fileList=null, commonDetailVO=null,
		// uploadFiles=[org.springframew..], commentList=null)
		int result = this.anonymousBoardMapper.create(boardVO);

		result += fileUtil.uploadFile(boardVO.getUploadFiles(), boardVO.getBdCd());

		return result;
	}

	// 자유게시판 상세
	public BoardVO detail(String bdCd) {
		return this.anonymousBoardMapper.detail(bdCd);
	}

	// 자유게시판 수정
	@Override
	public int update(BoardVO boardVO) {
		int result = this.anonymousBoardMapper.update(boardVO);

		result += fileUtil.uploadFile(boardVO.getUploadFiles(), boardVO.getBdCd());

		return result;
	}

	// 조회수 카운트
	@Override
	public int count(String bdCd) {
		BoardVO boardVO = new BoardVO();
		boardVO.setBdCd(bdCd);
		return this.anonymousBoardMapper.count(boardVO);
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return this.anonymousBoardMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return this.anonymousBoardMapper.getTotalCount(cri);
	}

	@Override
	public int delete(Map<String, String> map) {
		return this.anonymousBoardMapper.delete(map);
	}

}