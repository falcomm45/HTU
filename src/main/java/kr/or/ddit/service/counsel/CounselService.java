package kr.or.ddit.service.counsel;

import java.util.List;

import kr.or.ddit.vo.CounselVO;

public interface CounselService {

	public List<CounselVO> counselList(String userCd);

	public int counselCreatePost(CounselVO counselVO);

	public CounselVO counseldetail(String cnslCd);

	public int counselUpdatePost(CounselVO counselVO);

	public int counselDelete(String cnslCd);

	public List<CounselVO> counselProList(String userCd);

	public int counselAppUpdate(CounselVO counselVO);

	public int counselCancleUpdate(CounselVO counselVO);

	public CounselVO getDetailCounsel(String cnslCd);

	public List<CounselVO> renderHome(String stuCd);

	public int counselConInsert(CounselVO counselVO);

	public List<CounselVO> renderHomePro(String userCd);

}
