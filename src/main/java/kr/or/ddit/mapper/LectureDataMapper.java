package kr.or.ddit.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LectureDataVO;

public interface LectureDataMapper {

	int getTotal(Map<String, Object> map);

	List<LectureDataVO> lectureDataList(Map<String, Object> map);

	LectureDataVO lectureDataDetail(String lecdCd);

	int lectureDataCreatePost(LectureDataVO lectureDataVO);

	int lectureDataUpdate(LectureDataVO lectureDataVO);

	int lectureDataDelete(String lecdCd);

}