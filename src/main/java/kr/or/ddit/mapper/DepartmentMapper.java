package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.DepartmentVO;

public interface DepartmentMapper {

	public List<DepartmentVO> getDepartmentList(String colCd);

	public List<DepartmentVO> getDepartment();

	public DepartmentVO getDepCdByDepNm(String value);

}
