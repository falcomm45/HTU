package kr.or.ddit.service.professor.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.LectureDataMapper;
import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.service.professor.LectureDataService;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.LectureDataVO;
import kr.or.ddit.vo.LectureVO;

@Service
public class LectureDataServiceImpl implements LectureDataService{
	
	@Autowired
	LectureMapper lectureMapper;
	
	@Autowired
	FileUtil fileUtil;
	
	@Autowired
	LectureDataMapper lectureDataMapper;
	
	
	@Override
	/** 강의목록 */
	public List<LectureVO> lectureList(String proCd) {
		return this.lectureMapper.lectureList(proCd);
	}

	@Override
	public int getTotal(Map<String, Object> map) {
		return this.lectureDataMapper.getTotal(map);
	}

	@Override
	public List<LectureDataVO> lectureDataList(Map<String, Object> map) {
		return this.lectureDataMapper.lectureDataList(map);
	}

	@Override
	public LectureDataVO lectureDataDetail(String lecdCd) {
		return this.lectureDataMapper.lectureDataDetail(lecdCd);
	}

	@Override
	public int lectureDataCreatePost(LectureDataVO lectureDataVO) {
		
		LectureVO lectureVO = new LectureVO();
		
		lectureDataVO.setLectureVO(lectureVO);
		
		int result = this.lectureDataMapper.lectureDataCreatePost(lectureDataVO);
		
		result += this.fileUtil.uploadFile(lectureDataVO.getUploadFiles(), lectureDataVO.getLecdCd());
		
		return result;
	}

	@Override
	public int lectureDataUpdate(LectureDataVO lectureDataVO) {
		
		int result = this.lectureDataMapper.lectureDataUpdate(lectureDataVO);
		
		MultipartFile[] uploadFiles = lectureDataVO.getUploadFiles();
		
		if(uploadFiles[0].getOriginalFilename().length() > 0) {
			
			result += this.fileUtil.updateFileUsed(lectureDataVO.getLecdCd());
			
			result += this.fileUtil.uploadFile(lectureDataVO.getUploadFiles(), lectureDataVO.getLecdCd());
		}
		
		return result;
	}

	@Override
	public int lectureDataDelete(String lecdCd) {
		return this.lectureDataMapper.lectureDataDelete(lecdCd);
	}

}
