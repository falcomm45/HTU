package kr.or.ddit.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.FilesDetailVO;

@Mapper
public interface FilesDetailMapper {

	public int insertFile(String fileCd);
	
	public int insertFilesDetail(FilesDetailVO filesDetailVO);

	public int updateFileUsed(String fileCd);

	public int searchFileCd(String fileCd);

	public int deleteFileUpdate(@Param("fileCd")String fileCd, @Param("fileSn")int fileSn);

	public void deleteFiles(String fileCd);

}
