package kr.or.ddit.service.professor;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LectureDataVO;
import kr.or.ddit.vo.LectureVO;

public interface LectureDataService {

	List<LectureVO> lectureList(String proCd);

	int getTotal(Map<String, Object> map);

	List<LectureDataVO> lectureDataList(Map<String, Object> map);

	LectureDataVO lectureDataDetail(String lecdCd);

	int lectureDataCreatePost(LectureDataVO lectureDataVO);

	int lectureDataUpdate(LectureDataVO lectureDataVO);

	int lectureDataDelete(String lecdCd);

}
