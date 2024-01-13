package kr.or.ddit.mapper;

import java.util.List;

import kr.or.ddit.vo.CommonDetailVO;
import kr.or.ddit.vo.CounselVO;
import kr.or.ddit.vo.DepartmentVO;
import kr.or.ddit.vo.ProfessorVO;

public interface CounselMapper {

	public List<CounselVO> counselList(String userCd);

	public int counselCreatePost(CounselVO counselVO);

	public List<CommonDetailVO> counselCommon();

	public List<DepartmentVO> counselDept();

	public List<CounselVO> counselProfessor();

	public CounselVO counseldetail(String cnslCd);

	public int counselUpdatePost(CounselVO counselVO);

	public int counselDelete(String cnslCd);

	public List<CounselVO> counselProList(String userCd);

	public int counselAppUpdate(CounselVO counselVO);

	public int counselCancleUpdate(CounselVO counselVO);

	public CounselVO getDetailCounsel(String cnslCd);

	public List<CounselVO> renderHome(String stuCd);

	public List<CounselVO> counselConSelect(CounselVO counselVO);

	public int counselConInsert(CounselVO counselVO);

	public List<CounselVO> renderHomePro(String userCd);

}
