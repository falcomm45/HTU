package kr.or.ddit.mapper;

import kr.or.ddit.vo.GradeCriteriaVO;

public interface GradeCriteriaMapper {

	public int gradeCriteriaCreatePost(GradeCriteriaVO gradeCriteriaVO);
	
	/**
	 * 해당 강의의 성적기준 코드 가져오기
	 * @param lecCd 강의코드
	 * @return
	 */
	public GradeCriteriaVO getGradeCriteria(String lecCd);
	
	/**
	 * 강의기준 코드로 가져오기
	 * @param crtrCd
	 * @return
	 */
	public GradeCriteriaVO getCriteria(String crtrCd);

}
