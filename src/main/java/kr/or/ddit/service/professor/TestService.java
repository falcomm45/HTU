package kr.or.ddit.service.professor;

import java.util.List;

import kr.or.ddit.vo.TestApplyVO;
import kr.or.ddit.vo.TestQuestionVO;
import kr.or.ddit.vo.TestVO;

public interface TestService {

	//시험 목록
	public List<TestVO> testList(String lecCd);

	//시험 등록
	public int testCreatePost(TestVO testVO);

	//시험 상세
	public TestVO testDetail(String testCd);

	//시험 문제 리스트
	public List<TestQuestionVO> tqVOList(String testCd);

	//시험 수정
	public int testUpdate(TestVO testVO);

	//시험 응시 결과
	public List<TestApplyVO> testResultList(TestVO testVO);

	//시험 결과 상세 - 교수
	public TestApplyVO testResult(String teaCd);




}
