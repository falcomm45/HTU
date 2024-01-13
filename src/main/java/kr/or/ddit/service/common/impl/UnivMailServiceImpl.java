package kr.or.ddit.service.common.impl;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.mapper.UnivMailMapper;
import kr.or.ddit.mapper.UserMapper;
import kr.or.ddit.service.common.UnivMailService;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.FilesDetailVO;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.UnivMailVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UnivMailServiceImpl implements UnivMailService {

	@Autowired
	UnivMailMapper univMailMapper;
	
	@Autowired
	private NotificationMapper notificationMapper;
	
	@Autowired
	FileUtil fileUtil;
	
	@Autowired
	private UserMapper userMapper;
	
	//받은 메일함
	@Override
	public List<UnivMailVO> inbox(Map<String, Object> map) {
		return this.univMailMapper.inbox(map);
	}
	
	//보낸 메일함
	@Override
	public List<UnivMailVO> sentbox(Map<String, Object> map) {
		return this.univMailMapper.sentbox(map);
	}

	//받은 메일함 전체 항목 개수(검색 포함)
	@Override
	public int getTotalInbox(Map<String, Object> map) {
		return this.univMailMapper.getTotalInbox(map);
	}
	
	//보낸 메일함 전체 항목 개수(검색 포함)
	@Override
	public int getTotalSentbox(Map<String, Object> map) {
		return this.univMailMapper.getTotalSentbox(map);
	}
	
	//읽지 않은 메일 개수
	@Override
	public int getUnreadTotal(String umlReceiver) {
		return this.univMailMapper.getUnreadTotal(umlReceiver);
	}

	//메일 작성
	@Transactional
	@Override
	public int sendMail(UnivMailVO univMailVO) {
		int result = this.univMailMapper.sendMail(univMailVO);
		
		result += this.fileUtil.uploadFile(univMailVO.getUploadFiles(), univMailVO.getUmlCd());
		
		if (univMailVO.getUmlYn() == 0) {
			NotificationVO ntfVO = new NotificationVO();
			ntfVO.setComdCd("ALAM03");
			ntfVO.setUserCd(univMailVO.getUmlReceiver());
			ntfVO.setNtfUrl("/mail/receiveDetail?umlCd="+univMailVO.getUmlCd());
			ntfVO.setNtfCon(univMailVO.getUmlSender());
			
			result += this.notificationMapper.insert(ntfVO);
		}
		
		log.info("sendMail->univMailVO : {}", univMailVO);
		
		return result;
	}

	//받은 메일 상세
	@Override
	public UnivMailVO receiveMailDetail(String umlCd) {
		return this.univMailMapper.receiveMailDetail(umlCd);
	}
	
	//보낸 메일 상세
	@Override
	public UnivMailVO sendMailDetail(String umlCd) {
		return this.univMailMapper.sendMailDetail(umlCd);
	}
	
	//메일 삭제
	@Override
	public int deleteMail(String umlCd) {
		log.info("umlCd : " + umlCd);
		int result = this.univMailMapper.deleteMail(umlCd);
		
		result += this.fileUtil.updateFileUsed(umlCd);
		
		return result;
	}

	//메일 읽음
	@Override
	public int readReceiveMail(String umlCd) {
		return this.univMailMapper.readReceiveMail(umlCd);
	}

	//임시 보관함
	@Override
	public List<UnivMailVO> tempMailBox(Map<String, Object> map) {
		return this.univMailMapper.tempMailBox(map);
	}

	//임시 보관함 전체 항목 개수(검색 포함)
	@Override
	public int getTotalTempbox(Map<String, Object> map) {
		return this.univMailMapper.getTotalTempbox(map);
	}
	
	//임시 메일 업데이트
	@Override
	public int tempMailUpdate(UnivMailVO univMailVO) {
		int result = this.univMailMapper.tempMailUpdate(univMailVO);
		log.info("tempMailUpdate->univMailVO : " + univMailVO);
		
		result += this.fileUtil.uploadFile(univMailVO.getUploadFiles(), univMailVO.getUmlCd());
		log.info("tempMailUpdate->univMailVO : " + univMailVO);
		
		return result;
	}

	//임시 메일 파일 삭제
	@Override
	public int deleteFileUpdate(FilesDetailVO filesDetailVO) {
		int result = this.fileUtil.deleteFileUpdate(filesDetailVO.getFileCd(), filesDetailVO.getFileSn());
		
		return result;
	}

	//임시 저장 메일 전송
	@Override
	public int sendTempMail(UnivMailVO univMailVO) {
		int result = this.univMailMapper.sendTempMail(univMailVO);
		
		result += this.fileUtil.uploadFile(univMailVO.getUploadFiles(), univMailVO.getUmlCd());
		
		return result;
	}

	//선택 메일 읽음
	@Override
	public int readCheck(List<String> umlCdList) {
		return this.univMailMapper.readCheck(umlCdList);
	}

	//선택 메일 삭제
	@Override
	public int deleteMail(List<String> umlCdList) {
		int result = 0;
		
		for (String umlCd : umlCdList) {
            log.info("deleteMail->umlCd : " + umlCd);
            result += this.univMailMapper.deleteMail(umlCd);
            result += this.fileUtil.updateFileUsed(umlCd);
        }

        return result;
	}

	//메일 알림
	@Override
	public UnivMailVO getMailByNtfCd(String ntfCd) {
		 UnivMailVO mailVO = this.univMailMapper.getMailByNtfCd(ntfCd);
		 String userNm = this.userMapper.getUserNameByUserCd(mailVO.getUmlSender());
		 log.info("userNm ==> {}", userNm);
		 mailVO.setSenderNm(userNm);
		 
		 mailVO.setStrUmlReg(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(mailVO.getUmlReg()));
		 
		 return mailVO;
	}

}
