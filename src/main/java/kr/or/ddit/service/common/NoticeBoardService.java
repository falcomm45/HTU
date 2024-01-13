package kr.or.ddit.service.common;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Criteria;
import kr.or.ddit.vo.NoticeBoardVO;

public interface NoticeBoardService {
	


	public List<NoticeBoardVO> list();

	public NoticeBoardVO detail(String nbCd);

	public int count(String nbCd);

	public int create(NoticeBoardVO noticeBoardVO);

	public int update(NoticeBoardVO noticeBoardVO);
	
	public int updatePost(NoticeBoardVO noticeBoardVO);

	public int deletePost(Map<String, String> map);
	
	public List<NoticeBoardVO> getList(Criteria cri);	//페이징처리 후 리스트 조회
	
	public int getTotal(Criteria cri);

	public List<NoticeBoardVO> renderHome();

	public int updateYN(String str);
	
	public int updateYNClear(String str);

	

	

}
