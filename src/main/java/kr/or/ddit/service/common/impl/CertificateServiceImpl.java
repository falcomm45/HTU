package kr.or.ddit.service.common.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.CertificateMapper;
import kr.or.ddit.service.common.CertificateService;
import kr.or.ddit.vo.StudentVO;

@Service
public class CertificateServiceImpl implements CertificateService{
	
	@Autowired
	CertificateMapper certificateMapper;
	
	@Override
	public StudentVO stuPrivacyInfo(String stuCd) {
		return this.certificateMapper.stuPrivacyInfo(stuCd);
	}

}
