package kr.or.ddit.service.professor;

import java.util.List;

import kr.or.ddit.vo.ObjectionVO;

public interface LectureObjectionService {

	public List<ObjectionVO> list(String lecCd);

	public int recognizeObjection(ObjectionVO objectionVO);

	public int companionObjection(ObjectionVO objectionVO);

}
