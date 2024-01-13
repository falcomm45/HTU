package kr.or.ddit.service.common.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.mapper.ApprovalMapper;
import kr.or.ddit.mapper.PostReportMapper;
import kr.or.ddit.service.common.PostReportService;
import kr.or.ddit.vo.ApprovalVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.PostReportVO;
import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class PostReportServiceImpl implements PostReportService{
	
	private final ApprovalMapper approvalMapper;
	private final PostReportMapper postReportMapper;
	
	@Transactional
	@Override
	public int insert(PostReportVO postReportVO) {
		//PostReportVO :PostReportVO(prCd=null, userCd=1001, appCd=null, bdCd=BORD02285, prRsn=0, prDetail=sdaf, approvalVO=null)
		log.info("insert->postReportVO : " + postReportVO);
		
//		UserVO userVO = new UserVO();
//		BoardVO boardVO = new BoardVO();
		ApprovalVO appVO = new ApprovalVO();
		appVO.setUserCd(postReportVO.getUserCd());
		appVO.setComdCd("APPR04");
		appVO.setAppTarget("1001");
		
		//관리자의 결재 준비(결재코드 생성)
		log.info("insert->appVO : " + appVO);
		int cnt = this.postReportMapper.insert(appVO);
		
//		userVO.setUserCd(appVO.getUserCd());
//		postReportVO.setApprovalVO(appVO);
		
		//신고 등록
		postReportVO.setAppCd(appVO.getAppCd());
		cnt += this.postReportMapper.createReport(postReportVO);
		
		return cnt;
	}

	@Override
	public List<PostReportVO> renderReport(ApprovalVO approvalVO) {
		return this.postReportMapper.renderReport(approvalVO);
	}

}
