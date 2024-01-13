package kr.or.ddit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.TestApplyVO;
import kr.or.ddit.vo.TestDetailVO;
import kr.or.ddit.vo.TestQuestionVO;
import kr.or.ddit.vo.TestVO;

public interface TestMapper {

	//시험 목록
	public List<TestVO> testList(String lecCd);

	//시험 등록
	public int testCreatePost(TestVO testVO);

	//시험 문제 등록
	public int testQustionInsert(TestQuestionVO testQuestionVO);

	//시험 상세
	public TestVO testDetail(String testCd);

	//시험 문제 리스트
	public List<TestQuestionVO> tqVOList(String testCd);

	//시험 수정
	public int testUpdate(TestVO testVO);

	//시험 문제 삭제
	public int deleteQuestion(String testCd);

	//시험 제출
	public int testApply(TestApplyVO testApplyVO);

	//시험 상세 추가
	public int testDetailInsert(TestDetailVO testDetailVO);

	//시험 점수 입력
	public int testScoreUpdate(TestApplyVO testApplyVO);

	//시험 결과 상세 - 학생
	public TestApplyVO testResult(@Param(value = "testCd") String testCd, @Param(value = "stuCd") String stuCd);

	//제출 시험지
	public List<TestDetailVO> testResultDetail(String teaCd);

	//성적 처리 기준 코드 가져오기
	public String getCrtrCd(String lecCd);

	//중간고사 점수 입력
	public int updateMsGrade(@Param(value = "crtrCd") String crtrCd, @Param(value = "stuCd") String stuCd);

	//기말고사 점수 입력
	public int updateFsGrade(@Param(value = "crtrCd") String crtrCd, @Param(value = "stuCd") String stuCd);

	//시험 응시 결과
	public List<TestApplyVO> testResultList(TestVO testVO);

	//시험 결과 상세 - 교수
	public TestApplyVO testResultPro(String teaCd);

}
