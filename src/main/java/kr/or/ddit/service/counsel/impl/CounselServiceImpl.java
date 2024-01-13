package kr.or.ddit.service.counsel.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import freemarker.template.SimpleDate;
import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.CounselMapper;
import kr.or.ddit.mapper.NotificationMapper;
import kr.or.ddit.mapper.ProfessorMapper;
import kr.or.ddit.mapper.UserMapper;
import kr.or.ddit.service.counsel.CounselService;
import kr.or.ddit.util.EtcUtil;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.CounselVO;
import kr.or.ddit.vo.NotificationVO;
import kr.or.ddit.vo.ProfessorVO;
import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class CounselServiceImpl implements CounselService {

	private final CounselMapper counselMapper;

	private final NotificationMapper ntfMapper;

	private final ProfessorMapper proMapper;

	private final ApprovalMapper approvalMapper;

	private final UserMapper userMapper;

	@Override
	public List<CounselVO> counselList(String userCd) {
		List<CounselVO> counselList = this.counselMapper.counselList(userCd);

		for (CounselVO counsel : counselList) {
			counsel.setStrcnslDt(EtcUtil.formDate(counsel.getCnslDt()));
		}

		return counselList;
	}

	@Override
	public int counselCreatePost(CounselVO counselVO) {

		int result = 0;

		ProfessorVO proVO = this.proMapper.getProfessor(counselVO.getProCd());

		ApprovalVO appVO = new ApprovalVO();
		appVO.setUserCd(counselVO.getStuCd());
		appVO.setAppTarget(counselVO.getProCd());
		appVO.setComdCd("APPR01");

		result += this.approvalMapper.insert(appVO);
		counselVO.setAppCd(appVO.getAppCd());

		result += this.counselMapper.counselCreatePost(counselVO);

		NotificationVO ntfVO = new NotificationVO();
		ntfVO.setUserCd(proVO.getProCd());
		ntfVO.setComdCd("ALAM02");
		ntfVO.setNtfUrl("/pro/counsel/counseldetail?cnslCd=" + counselVO.getCnslCd());
		ntfVO.setNtfCon(counselVO.getStuCd());

		result += this.ntfMapper.insert(ntfVO);

		return result;
	}

	@Override
	public CounselVO counseldetail(String cnslCd) {
		return this.counselMapper.counseldetail(cnslCd);
	}

	@Override
	public int counselUpdatePost(CounselVO counselVO) {
		Date cnslDt = counselVO.getCnslDt();

		Calendar calendar = Calendar.getInstance();
		calendar.setTime(cnslDt);

		calendar.add(Calendar.HOUR_OF_DAY, -9);

		counselVO.setCnslDt(calendar.getTime());
		
		
		return this.counselMapper.counselUpdatePost(counselVO);
	}

	@Override
	public int counselDelete(String cnslCd) {
		return this.counselMapper.counselDelete(cnslCd);
	}

	@Override
	public List<CounselVO> counselProList(String userCd) {

		List<CounselVO> counselProList = this.counselMapper.counselProList(userCd);

		for (CounselVO counsel : counselProList) {
			counsel.setStrcnslDt(EtcUtil.formDate(counsel.getCnslDt()));
		}

		return counselProList;
	}

	@Override
	public int counselAppUpdate(CounselVO counselVO) {
		int cnt = this.counselMapper.counselAppUpdate(counselVO);

		NotificationVO ntfVO = new NotificationVO("ALAM09", counselVO.getStuCd(),
				"/student/counsel/counselList?cnslCd=" + counselVO.getCnslCd());

		cnt += this.ntfMapper.insert(ntfVO);

		return cnt;
	}

	@Override
	public int counselCancleUpdate(CounselVO counselVO) {
		ApprovalVO appVO = counselVO.getApprovalVO();
		
		int cnt = this.approvalMapper.updateApprovalYn(appVO);
		
		NotificationVO ntfVO = new NotificationVO("ALAM10", counselVO.getStuCd(),
				"/student/counsel/counselList?cnslCd=" + counselVO.getCnslCd());

		cnt += this.ntfMapper.insert(ntfVO);

		return cnt;
	}

	@Override
	public CounselVO getDetailCounsel(String cnslCd) {
		CounselVO counselVO = this.counselMapper.getDetailCounsel(cnslCd);
		counselVO.setCnslCon(new SimpleDateFormat("yy-MM-dd").format(counselVO.getCnslDt()));

		UserVO userVO = this.userMapper.getProfessorInfo(counselVO.getProCd());

		counselVO.getProfessorVO().setUserVO(userVO);

		return counselVO;
	}

	@Override
	public List<CounselVO> renderHome(String stuCd) {
		return this.counselMapper.renderHome(stuCd);
	}

	@Override
	public int counselConInsert(CounselVO counselVO) {
		return this.counselMapper.counselConInsert(counselVO);
	}

	@Override
	public List<CounselVO> renderHomePro(String userCd) {
		return this.counselMapper.renderHomePro(userCd);
	}

}
