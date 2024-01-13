package kr.or.ddit.service.student.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.CalendarMapper;
import kr.or.ddit.mapper.EnrolmentMapper;
import kr.or.ddit.mapper.GradeCriteriaMapper;
import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.service.student.EnrolmentService;
import kr.or.ddit.service.student.TuitionStuService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.CalendarVO;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.GradeCriteriaVO;
import kr.or.ddit.vo.LectureGradeVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TuitionVO;
import kr.or.ddit.vo.UserVO;
import kr.or.ddit.vo.WishLectureVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class EnrolmentServiceImpl implements EnrolmentService{
	
	private final EnrolmentMapper enrolmentMapper;
	
	private final CalendarMapper calendarMapper;
	
	private final LectureMapper lectureMapper;
	
	private final GradeCriteriaMapper gradeCriteriaMapper;
	
	private final TuitionStuService tuitionStuService;
	
	private final EtcUtil etcUtil;

	@Override
	public List<LectureVO> list(StudentVO studentVO) {
		List<LectureVO> lectureList = this.enrolmentMapper.list(studentVO);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for (LectureVO lectureVO : lectureList) {
			
			if (lectureVO.getLectureApplyVO().getLecaSem() == 1) {
				map.put("startDate", lectureVO.getLectureApplyVO().getLecaYear() + "0302");
				map.put("endDate", lectureVO.getLectureApplyVO().getLecaYear() + "0617");
			} else if (lectureVO.getLectureApplyVO().getLecaSem() == 2) {
				map.put("startDate", lectureVO.getLectureApplyVO().getLecaYear() + "0901");
				map.put("endDate", lectureVO.getLectureApplyVO().getLecaYear() + "1215");
			}
			
			map.put("startTime", lectureVO.getLectureApplyVO().getLecaStdt());
			map.put("endTime", lectureVO.getLectureApplyVO().getLecaEddt());
			map.put("roomCd", lectureVO.getLectureApplyVO().getRoomCd());
			map.put("days", lectureVO.getLectureScheduleVO().getLecDay().split("/"));
			
			List<CalendarVO> calendarList = this.calendarMapper.dateTransfer(map);
			
			calendarList.stream().forEach(calendar -> {
				calendar.setFormDate(EtcUtil.formDate(calendar.getCalDate()));
			});
			
			lectureVO.setCalendarList(calendarList);
		}
		return lectureList;
	}

	@Override
	public String getColNm(String userCd) {
		return this.enrolmentMapper.getColNm(userCd);
	}

	@Override
	public int addWishLecture(WishLectureVO wishLectureVO) {
		return this.enrolmentMapper.addWishLecture(wishLectureVO);
	}

	@Override
	public int removeWishLecture(WishLectureVO wishLectureVO) {
		return this.enrolmentMapper.removeWishLecture(wishLectureVO);
	}

	@Override
	public List<LectureVO> searchLecture(Map<String, Object> paramMap) {
		return this.enrolmentMapper.searchLecture(paramMap);
	}

	@Override
	public int insertEnrolment(EnrolmentVO enrolmentVO) {
		LectureVO lectureVO = new LectureVO();
		lectureVO.setLecCd(enrolmentVO.getLecCd());
		// 수강신청 정원 비교
		LectureVO lectureDetail = this.lectureMapper.lectureDetail(enrolmentVO.getLecCd());
		if (lectureDetail.getLectureApplyVO().getLecaCap() <= lectureDetail.getLecHcnt()) {
			return 0;
		}
		
		// 강의 수강인원 업데이트
		int cnt = this.enrolmentMapper.updateLectureCnt(lectureVO);
		
		log.info("enrolmentVO ==> {}", enrolmentVO);
		
		WishLectureVO wishLectureVO = new WishLectureVO(enrolmentVO.getStuCd(), enrolmentVO.getLecCd());
		// 관심강의 목록 삭제
		cnt += this.enrolmentMapper.removeWishLecture(wishLectureVO);
		
		// 수강신청 insert
		cnt += this.enrolmentMapper.insertEnrolment(enrolmentVO);
		
		GradeCriteriaVO gradeCriteriaVO = this.gradeCriteriaMapper.getGradeCriteria(enrolmentVO.getLecCd());
		
		LectureGradeVO lectureGradeVO = new LectureGradeVO(gradeCriteriaVO.getCrtrCd(), enrolmentVO.getStuCd());
		
		cnt += this.enrolmentMapper.insertLectureGrade(lectureGradeVO);
		
		TuitionVO tuitionVO = new TuitionVO();
		tuitionVO.setStuCd(enrolmentVO.getStuCd());
		tuitionVO.setTutYear(enrolmentVO.getLectureVO().getLectureApplyVO().getLecaYear());
		tuitionVO.setTutSem(enrolmentVO.getLectureVO().getLectureApplyVO().getLecaSem());
		tuitionVO.setTutTuition(enrolmentVO.getLectureVO().getLectureApplyVO().getDepartmentVO().getDepFee());
		
		TuitionVO tuitionV = this.tuitionStuService.check(tuitionVO);
		
		log.info("tuition {}", tuitionV);
		
		if (tuitionV == null) {
			cnt += this.tuitionStuService.insert(tuitionVO);
		}
		
		return cnt;
	}

	@Override
	public List<EnrolmentVO> getEnrolmentList(String lecCd) {
		return this.enrolmentMapper.getEnrolmentList(lecCd);
	}

	@Override
	public List<EnrolmentVO> getEnrolmentListByStuCd(String stuCd) {
		return this.enrolmentMapper.getEnrolmentListByStuCd(stuCd);
	}

	@Override
	public List<WishLectureVO> getWishLectureListByStuCd(String stuCd) {
		return this.enrolmentMapper.getWishLectureListByStuCd(stuCd);
	}

	@Override
	public List<LectureVO> changeMenu(String keyword) {
		
		List<LectureVO> lectureList = null;
		
		UserVO userVO = this.etcUtil.getUserVO();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("keyword", keyword);
		paramMap.put("stuYear", userVO.getStudentVO().getStuYear());
		paramMap.put("stuSem", userVO.getStudentVO().getStuSem());
		
		if (keyword.length() > 2) {
			lectureList = this.enrolmentMapper.changeMenu1(paramMap);
		} else {
			lectureList = this.enrolmentMapper.changeMenu2(paramMap);
		}
		
		return lectureList;
	}

	@Override
	public int cancelEnrolment(EnrolmentVO enrolmentVO) {
		
		int result = this.enrolmentMapper.cancelEnrolment(enrolmentVO);
		
		String crtrCd = enrolmentMapper.getCrtrCd(enrolmentVO.getLecCd());
		
		LectureGradeVO lectureGradeVO = new LectureGradeVO(crtrCd, enrolmentVO.getStuCd());
		
		result += this.enrolmentMapper.deleteCriteria(lectureGradeVO);
		
		LectureVO lectureVO = new LectureVO();
		lectureVO.setLecCd(enrolmentVO.getLecCd());
		
		result += this.enrolmentMapper.updateLectureMinus(lectureVO);
		
		return result;
	}


	
}
