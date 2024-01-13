package kr.or.ddit.service.professor.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.GradeCriteriaMapper;
import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.service.professor.GradeCriteriaService;
import kr.or.ddit.vo.GradeCriteriaVO;
import kr.or.ddit.vo.LectureVO;

@Service
public class GradeCriteriaServiceImpl implements GradeCriteriaService{
	@Autowired
	LectureMapper lectureMapper;
	
	@Autowired
	GradeCriteriaMapper gradeCriteriaMapper;
	
	@Override
	public List<LectureVO> lectureList(String proCd) {
		return this.lectureMapper.lectureList(proCd);
	}

	@Override
	public int gradeCriteriaCreatePost(GradeCriteriaVO gradeCriteriaVO) {
		
		LectureVO lectureVO = new LectureVO();
		
		gradeCriteriaVO.setLectureVO(lectureVO);
		
		return this.gradeCriteriaMapper.gradeCriteriaCreatePost(gradeCriteriaVO);
	}

	@Override
	public GradeCriteriaVO getCriteria(String crtrCd) {
		return this.gradeCriteriaMapper.getCriteria(crtrCd);
	}

}
