package kr.or.ddit.service.professor;

import java.util.List;

import kr.or.ddit.vo.GradeCriteriaVO;
import kr.or.ddit.vo.LectureVO;

public interface GradeCriteriaService {

	List<LectureVO> lectureList(String proCd);

	int gradeCriteriaCreatePost(GradeCriteriaVO gradeCriteriaVO);

	GradeCriteriaVO getCriteria(String crtrCd);

}
