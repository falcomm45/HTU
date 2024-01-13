package kr.or.ddit.service.student.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.TestMapper;
import kr.or.ddit.service.student.TestStuService;
import kr.or.ddit.vo.TestApplyVO;
import kr.or.ddit.vo.TestDetailVO;
import kr.or.ddit.vo.TestQuestionVO;
import kr.or.ddit.vo.TestVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TestStuServiceImpl implements TestStuService {

	@Autowired
	TestMapper testMapper;

	//시험 목록
	@Override
	public List<TestVO> testList(String lecCd) {
		return this.testMapper.testList(lecCd);
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

	//시험 제출
	@Override
	public int testApply(TestApplyVO testApplyVO) {

		int result = this.testMapper.testApply(testApplyVO);
		log.info("testApply->testApplyVO : " + testApplyVO);
		
		List<TestDetailVO> testDetailVOList = testApplyVO.getTestDetailVOList();
		List<TestQuestionVO> testQeustionVOList = testApplyVO.getTestQuestionVOList();
		log.info("testApply->testQeustionVOList : " + testQeustionVOList);
		
		//시험 점수
		int sum = 0;
		
		for(TestDetailVO testDetailVO : testDetailVOList) {
			
			testDetailVO.setTeaCd(testApplyVO.getTeaCd());

			for(int i = 0; i < testQeustionVOList.size(); i++) {
				
				if(testQeustionVOList.get(i).getTeqCd().equals(testDetailVO.getTeqCd())) {
					
					if(testQeustionVOList.get(i).getTeqAnswer().equals(testDetailVO.getTedAnswer())) {
						testDetailVO.setTedYn(1);
						sum += testQeustionVOList.get(i).getTeqAllot();
					}
				}
			}
			
			log.info("testApply->testDetailVO : " + testDetailVO);
			
			//시험 상세 추가
			result += this.testMapper.testDetailInsert(testDetailVO);

			//시험 점수 입력
			testApplyVO.setTeaScore(sum);
			result += this.testMapper.testScoreUpdate(testApplyVO);
			
			//강의 코드 = 시험 코드에서 중간/기말 구분 코드 뺀 것
			String lecCd = testApplyVO.getTestCd().substring(0, testApplyVO.getTestCd().length() - 1);
			//성적 처리 기준 코드 가져오기
			String crtrCd = this.testMapper.getCrtrCd(lecCd);
			log.info("testApply->crtrCd : " + crtrCd);
			String stuCd = testApplyVO.getStuCd();
			
			if(testApplyVO.getTestCd().substring(testApplyVO.getTestCd().length() - 1).equals("1")) {
				//중간고사 점수 입력
				result += this.testMapper.updateMsGrade(crtrCd, stuCd);
			}else if(testApplyVO.getTestCd().substring(testApplyVO.getTestCd().length() - 1).equals("2")) {
				//기말고사 점수 입력
				result += this.testMapper.updateFsGrade(crtrCd, stuCd);
			}
			
		}
		
		log.info("testApply->testApplyVO(2) : " + testApplyVO);
		
		return result;
	}

	//시험 결과 상세 - 학생
	@Override
	public TestApplyVO testResult(String teaCd, String stuCd) {
		return this.testMapper.testResult(teaCd, stuCd);
	}

	//제출 시험지
	@Override
	public List<TestDetailVO> testResultDetail(String teaCd) {
		return this.testMapper.testResultDetail(teaCd);
	}

}
