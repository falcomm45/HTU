package kr.or.ddit.service.common.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.FilesDetailMapper;
import kr.or.ddit.mapper.PublicizeBoardMapper;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Criteria;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PublicizeBoardServiceImpl implements kr.or.ddit.service.common.PublicizeBoardService {

	@Autowired
	FilesDetailMapper fileMapper;

	@Autowired
	PublicizeBoardMapper publicizeBoardMapper;

	@Autowired
	FileUtil fileUtil;

	// 자유게시판 목록
	@Override
	public List<BoardVO> list(Criteria cri) {
		return this.publicizeBoardMapper.list(cri);
	}

	// 자유게시판 등록
	@Override
	public int create(BoardVO boardVO) {
		// BoardVO(bdCd=null, userCd=1001, comdCd=null, bdTitle=1212, bdCon=sfd,
		// bdReg=null, bdUdt=null, bdCnt=0, userVO=null,
		// userNm=작성자, fileList=null, commonDetailVO=null,
		// uploadFiles=[org.springframew..], commentList=null)
		int result = this.publicizeBoardMapper.create(boardVO);

		result += fileUtil.uploadFile(boardVO.getUploadFiles(), boardVO.getBdCd());

		return result;
	}

	// 자유게시판 상세
	public BoardVO detail(String bdCd) {
		return this.publicizeBoardMapper.detail(bdCd);
	}

	// 자유게시판 수정
	@Override
	public int update(BoardVO boardVO) {
		int result = this.publicizeBoardMapper.update(boardVO);

		result += fileUtil.uploadFile(boardVO.getUploadFiles(), boardVO.getBdCd());

		return result;
	}

	// 조회수 카운트
	@Override
	public int count(String bdCd) {
		BoardVO boardVO = new BoardVO();
		boardVO.setBdCd(bdCd);
		return this.publicizeBoardMapper.count(boardVO);
	}

	@Override
	public List<BoardVO> getList(Criteria cri) {
		return this.publicizeBoardMapper.getListWithPaging(cri);
	}

	@Override
	public int getTotal(Criteria cri) {
		return this.publicizeBoardMapper.getTotalCount(cri);
	}

	@Override
	public int delete(Map<String, String> map) {
		return this.publicizeBoardMapper.delete(map);
	}

}