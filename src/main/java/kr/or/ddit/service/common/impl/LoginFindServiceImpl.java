package kr.or.ddit.service.common.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.LoginFindMapper;
import kr.or.ddit.service.common.LoginFindService;
import kr.or.ddit.vo.UserVO;

@Service
public class LoginFindServiceImpl implements LoginFindService {

	@Autowired
	LoginFindMapper loginFindMapper; 
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Override
	public UserVO findId(Map<String, String> map) {
		return this.loginFindMapper.findId(map);
	}

	@Override
	public UserVO findPw(Map<String, String> map) {
		return this.loginFindMapper.findPw(map);
	}

	@Override
	public int modPassword(UserVO userVO) {
		
		userVO.setUserPass(this.passwordEncoder.encode(userVO.getUserPass()));
		return this.loginFindMapper.modPassword(userVO);
	}

}
