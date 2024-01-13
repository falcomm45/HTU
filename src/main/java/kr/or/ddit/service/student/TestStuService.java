package kr.or.ddit.service.student;

import java.util.List;

import kr.or.ddit.vo.TestApplyVO;
import kr.or.ddit.vo.TestDetailVO;
import kr.or.ddit.vo.TestQuestionVO;
import kr.or.ddit.vo.TestVO;

public interface TestStuService {

	//시험 목록
	public List<TestVO> testList(String lecCd);

	//시험 상세
	public TestVO testDetail(String testCd);

	//시험 문제 리스트
	public List<TestQuestionVO> tqVOList(String testCd);

	//시험 제출
	public int testApply(TestApplyVO testApplyVO);

	//시험 결과 상세 - 학생
	public TestApplyVO testResult(String teaCd, String stuCd);

	//제출 시험지
	public List<TestDetailVO> testResultDetail(String teaCd);


}
