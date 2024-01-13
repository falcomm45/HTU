package kr.or.ddit.service.professor.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.mapper.LectureMapper;
import kr.or.ddit.mapper.LectureNoticeMapper;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.service.professor.LectureNoticeService;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.EnrolmentVO;
import kr.or.ddit.vo.LectureNoticeVO;
import kr.or.ddit.vo.LectureVO;
import kr.or.ddit.vo.NotificationVO;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class LectureNoticeServiceImpl implements LectureNoticeService{

	@Autowired
	LectureMapper lectureMapper;
	
	@Autowired
	LectureNoticeMapper lectureNoticeMapper;
	
	@Autowired
	FileUtil fileUtil;
	
	@Autowired
	NotificationMapper notificationMapper;
	
	@Override
	/** 강의목록 */
	public List<LectureVO> lectureList(String proCd) {
		return this.lectureMapper.lectureList(proCd);
	}
	
	@Override
	/** 강의상세 */
	public LectureVO lectureDetail(String lecCd) {
		return this.lectureMapper.lectureDetail(lecCd);
	}
	
	@Transactional
	@Override
	/** 강의공지사항 작성*/
	public int lectureNoticeCreatePost(LectureNoticeVO lectureNoticeVO) {
		
		LectureVO lectureVO = new LectureVO();
		
		lectureNoticeVO.setLectureVO(lectureVO);
		log.info("lectureVO@@@@@ => {}", lectureVO);
		
		int result = this.lectureNoticeMapper.lectureNoticeCreatePost(lectureNoticeVO);
		
		// 파일업로드
//		result += this.fileUtil.uploadFile(lectureNoticeVO.getUploadFiles(), lectureNoticeVO.getLecnCd());
		
		return result;
	}
	
	@Override
	/** 작성된 공지사항의 강의를 듣는 학생들 */
	public List<EnrolmentVO> getStudent(String lecCd) {
//		lectureNoticeCreatePost(lectureNoticeVO);
		return this.lectureNoticeMapper.getStudent(lecCd);
	}
	@Transactional
	@Override
	/** 알림보내기 */
	public int lectureNoticeNtf(String lecnCd, List<EnrolmentVO> enrolmentVOList) {
		
		int result = 0;
		NotificationVO notificationVO = new NotificationVO();
		
		for (int i = 0; i < enrolmentVOList.size(); i++) {
			notificationVO.setUserCd(enrolmentVOList.get(i).getStuCd());
			notificationVO.setComdCd("ALAM06");
			notificationVO.setNtfUrl("/student/lecturenotice/detail?lecnCd=" + lecnCd);
			notificationVO.setNtfCon(this.lectureMapper.getLectureNm(enrolmentVOList.get(i).getLecCd()));
			result += this.notificationMapper.insert(notificationVO);
		}
		
		return result;
	}
	

	@Override
	/** 강의공지사랑 리스트 */
	public List<LectureNoticeVO> lectureNoticeList(Map<String, Object> map) {
		return this.lectureNoticeMapper.lectureNoticeList(map);
	}

	@Override
	/** 페이징처리 */
	public int getTotal(Map<String, Object> map) {
		return this.lectureNoticeMapper.getTotal(map);
	}

	@Override
	/** 강의공지사항 상세 */
	public LectureNoticeVO lectureNoticeDetail(String lecnCd) {
		return this.lectureNoticeMapper.lectureNoticeDetail(lecnCd);
	}

	@Override
	/** 강의공지사항 업데이트 */
	public int lectureNoticeUpdate(LectureNoticeVO lectureNoticeVO) {
		
		// 수정
		int result = this.lectureNoticeMapper.lectureNoticeUpdate(lectureNoticeVO);
		
		// 파일업로드위한 세팅
		MultipartFile[] uploadFiles = lectureNoticeVO.getUploadFiles();
		
		// 파일 수정위해 선택하면 파일 수정 아니면 기존 파일 사용
		if(uploadFiles[0].getOriginalFilename().length() > 0) {
			
			// 파일 사용여부 변경
			result += this.fileUtil.updateFileUsed(lectureNoticeVO.getLecnCd());
			// 파일업로드
			result += this.fileUtil.uploadFile(lectureNoticeVO.getUploadFiles(), lectureNoticeVO.getLecnCd());
		}
		
		return result; 
	}

	@Override
	public int lectureNoticeDelete(LectureNoticeVO lectureNoticeVO) {
		
		return this.lectureNoticeMapper.lectureNoticeDelete(lectureNoticeVO);
	}



}
