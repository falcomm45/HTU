package kr.or.ddit.service.professor.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.LectureNoticeMapper;
import kr.or.ddit.mapper.TestMapper;
import kr.or.ddit.service.professor.TestService;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureApplyVO;
import kr.or.ddit.vo.TestApplyVO;
import kr.or.ddit.vo.TestQuestionVO;
import kr.or.ddit.vo.TestVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TestServiceImpl implements TestService {

	@Autowired
	TestMapper testMapper;
	
	//시험 목록
	@Override
	public List<TestVO> testList(String lecCd) {
		return this.testMapper.testList(lecCd);
	}

	//시험 등록
	@Override
	public int testCreatePost(TestVO testVO) {
		
		int result = this.testMapper.testCreatePost(testVO);
		
		log.info("testCreatePost->testVO : " + testVO);
		
		List<TestQuestionVO> testQuestionVOList = testVO.getTestQuestionVOList();		
		for(TestQuestionVO testQuestionVO : testQuestionVOList) {
			
			testQuestionVO.setTestCd(testVO.getTestCd());
			log.info("testCreatePost->testQuestionVO : " + testQuestionVO);
			
			//시험 문제 등록
			result += this.testMapper.testQustionInsert(testQuestionVO);
		}
		
		log.info("testCreatePost->testQuestionVOList : " + testQuestionVOList);
		
		return result;
	}

	//시험 상세
	@Override
	public TestVO testDetail(String testCd) {
		return this.testMapper.testDetail(testCd);
	}

	//시험 문제 리스트
	@Override
	public List<TestQuestionVO> tqVOList(String testCd) {
		return this.testMapper.tqVOList(testCd);
	}

	//시험 수정
	@Override
	public int testUpdate(TestVO testVO) {
		
		int result = this.testMapper.testUpdate(testVO);
		log.info("testUpdate->testVO11111 : " + testVO);
		
		//시험 문제 삭제
		result += this.testMapper.deleteQuestion(testVO.getTestCd());
		log.info("testUpdate->testVO : " + testVO);
		
		List<TestQuestionVO> testQuestionVOList = testVO.getTestQuestionVOList();
		log.info("testUpdate->testQuestionVOList : " + testQuestionVOList);
		for(TestQuestionVO testQuestionVO : testQuestionVOList) {
			
			testQuestionVO.setTestCd(testVO.getTestCd());
			log.info("testCreatePost->testQuestionVO : " + testQuestionVO);
			
			//시험 문제 등록
			result += this.testMapper.testQustionInsert(testQuestionVO);
		}
		
		return result;
	}

	//시험 응시 결과
	@Override
	public List<TestApplyVO> testResultList(TestVO testVO) {
		return this.testMapper.testResultList(testVO);
	}

	//시험 결과 상세 - 교수
	@Override
	public TestApplyVO testResult(String teaCd) {
		return this.testMapper.testResultPro(teaCd);
	}

}
