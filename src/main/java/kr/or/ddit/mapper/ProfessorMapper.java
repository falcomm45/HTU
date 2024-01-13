package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.ProfessorVO;

public interface ProfessorMapper {

	public ProfessorVO getProfessor(String proCd);
	
	public List<ProfessorVO> getProfessorList();

}
