package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Criteria;
import kr.or.ddit.vo.NoticeBoardVO;

public interface NoticeBoardMapper {
	
	public List<NoticeBoardVO> list();
	
	// 공지사항 추가
	public int createNoticeBoard(NoticeBoardVO noticeBoardVO);

	public NoticeBoardVO detail(String nbCd);

	public int count(NoticeBoardVO noticeBoardVO);

	public int create(NoticeBoardVO noticeBoardVO);

	public int updatePost(NoticeBoardVO noticeBoardVO);

	public int deletePost(Map<String, String> map);
	
	//페이징 처리 후 리스트 조회
	public List<NoticeBoardVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);

	public List<NoticeBoardVO> renderHome();

	public int updateYn(String str);

	public int updateYnClear(String str);

	public int update(NoticeBoardVO noticeBoardVO);
	
	

	

}
