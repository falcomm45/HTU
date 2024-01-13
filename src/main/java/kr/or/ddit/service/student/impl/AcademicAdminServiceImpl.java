package kr.or.ddit.service.student.impl;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.AcademicAdminMapper;
import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.LectureAttendanceMapper;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.service.student.AcademicAdminService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.AttendanceVO;
import kr.or.ddit.vo.GradeCriteriaVO;
import kr.or.ddit.vo.LectureGradeVO;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.ObjectionVO;
import kr.or.ddit.vo.RecordVO;
import kr.or.ddit.vo.StudentVO;
import kr.or.ddit.vo.TaskSubmitVO;
import kr.or.ddit.vo.TaskVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class AcademicAdminServiceImpl implements AcademicAdminService{

	private final AcademicAdminMapper academicAdminMapper;
	
	private final ApprovalMapper approvalMapper;
	
	private final NotificationMapper notificationMapper;
	
	private final LectureAttendanceMapper lectureAttendanceMapper;
	
	@Override
	public List<LectureGradeVO> getLecList(String stuCd) {
		return this.academicAdminMapper.getLecList(stuCd);
	}

	@Override
	public StudentVO recordApp(String userCd) {
		return this.academicAdminMapper.recordApp(userCd);
	}

	@Override
	public int recordAppPost(RecordVO recordVO) {
		
		int result = 0;
		
		ApprovalVO appVO = new ApprovalVO();
		appVO.setUserCd(recordVO.getStuCd());
		appVO.setAppTarget("1001");
		appVO.setComdCd("APPR08");
		
		result += this.approvalMapper.insert(appVO);
		recordVO.setAppCd(appVO.getAppCd());
		
		result += this.academicAdminMapper.recordAppPost(recordVO);
		
		NotificationVO notificationVO = new NotificationVO();
		notificationVO.setComdCd("ALAM14");
		notificationVO.setUserCd("1001");
		notificationVO.setNtfUrl("/employee/stuadmin/recordApprovalList");
		notificationVO.setNtfCon(recordVO.getStuCd());
		this.notificationMapper.insert(notificationVO);
		
		return result;
	}

	@Override
	public List<RecordVO> recordList(Map<String, Object> map) {
		return this.academicAdminMapper.recordList(map);
	}

	@Override
	public int delete(String recCd) {
		return this.academicAdminMapper.delete(recCd);
	}

	@Override
	public List<LectureGradeVO> getGrade(StudentVO studentVO) {
		return this.academicAdminMapper.getGrade(studentVO);
	}

	@Override
	public List<ObjectionVO> getObjectionList(String userCd) {
		return this.academicAdminMapper.getObjectionList(userCd);
	}

	@Override
	public int getTotalRecord(Map<String, Object> map) {
		return this.academicAdminMapper.getTotalRecord(map);
	}

	@Override
	public int checkGrade(String lecCd) {
		return this.academicAdminMapper.checkGrade(lecCd);
	}

	@Override
	public int endLecture(String lecCd, String maxAtt) {
		List<TaskVO> taskList = this.academicAdminMapper.endLecture(lecCd);
		log.info("taskList ==> {}", taskList);
		List<LectureGradeVO> lectureGradeList = this.academicAdminMapper.getLectureGradeByLecCd(lecCd);
		log.info("lectureGradeList ==> {}", lectureGradeList);
		
		Map<String, List<Integer>> taskSubmitMap = new HashMap<String, List<Integer>>();
		
		for (LectureGradeVO lectureGradeVO : lectureGradeList) {
			taskSubmitMap.put(lectureGradeVO.getStuCd(), new ArrayList<Integer>());
		}
		
		for (TaskVO taskVO : taskList) {
			for(TaskSubmitVO taskSubmitVO : taskVO.getTaskSubmitList()) {
				if (taskSubmitVO.getTsubCd() != null) taskSubmitMap.get(taskSubmitVO.getStuCd()).add(taskSubmitVO.getTsubScore());
			}
		}
		
		int cntTask = taskList.size();
		
		log.info("과제수 ==> {}", cntTask);
		
		taskSubmitMap.forEach((key, value) -> {
			lectureGradeList.forEach(lectureGrade -> {
				if (lectureGrade.getStuCd().equals(key)) {
					value.stream().forEach(val -> {
						lectureGrade.setLecgTs(lectureGrade.getLecgTs().add(BigDecimal.valueOf(val)));
					});
				}
			});
		});
		
		lectureGradeList.forEach(lectureGrade  -> {
			lectureGrade.setLecgTs(lectureGrade.getLecgTs().divide(BigDecimal.valueOf(cntTask), 2, BigDecimal.ROUND_HALF_UP));
		});
		
		List<AttendanceVO> attendanceList = this.lectureAttendanceMapper.getAttendanceListByLecCd(lecCd);
		
		lectureGradeList.forEach(lectureGrade -> lectureGrade.setLecgAs(new BigDecimal(100)));
		
		attendanceList.forEach(attendance -> {
			lectureGradeList.forEach(lectureGrade -> {
				if (lectureGrade.getStuCd().equals(attendance.getStuCd())) {
					if (attendance.getAttYn() == 1) {
						if (lectureGrade.getLecgAs().compareTo(BigDecimal.valueOf(10)) >= 0) {
							lectureGrade.setLecgAs(lectureGrade.getLecgAs().subtract(BigDecimal.valueOf(10)));
						}
					} else if (attendance.getAttYn() == 2) {
						if (lectureGrade.getLecgAs().compareTo(BigDecimal.valueOf(5)) >= 0) {
							lectureGrade.setLecgAs(lectureGrade.getLecgAs().subtract(BigDecimal.valueOf(5)));
						}
					}
				}
			});
		});
		
		lectureGradeList.forEach(lectureGrade -> {
			GradeCriteriaVO gradeCriteriaVO = lectureGrade.getGradeCriteriaVO();
			
			double sum = (double)lectureGrade.getLecgMs() * gradeCriteriaVO.getCrtrMp() / 100;
			log.info("sum => {}", sum);
			sum += (double)lectureGrade.getLecgFs() * gradeCriteriaVO.getCrtrFp() / 100;
			log.info("sum => {}", sum);
			sum += (double)lectureGrade.getLecgAs().intValue() * gradeCriteriaVO.getCrtrAp() / 100;
			log.info("sum => {}", sum);
			sum += (double)lectureGrade.getLecgTs().intValue() * gradeCriteriaVO.getCrtrTp() / 100;
			log.info("sum => {}", sum);
			lectureGrade.setLecgSum(BigDecimal.valueOf(sum));
		});
		
		log.info("before lectureGradeList ==> {}", lectureGradeList);
		
		int result = this.academicAdminMapper.updateGrade(lectureGradeList);
		
		result += this.academicAdminMapper.updateLectureStat(lecCd);
		
		return result;
	}

	@Override
	public String sideStatus(String userCd) {
		return this.academicAdminMapper.sideStatus(userCd);
	}

}
