package kr.or.ddit.security;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.ddit.vo.UserVO;

public class CustomUser extends User{

	private UserVO userVO;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(UserVO userVO) {
		super(userVO.getUserCd(), userVO.getUserPass(), 
				Collections.singletonList(new SimpleGrantedAuthority(userVO.getCommonDetailVO().getComdDesc())));
		
		this.setUserVO(userVO);
	}
	
	public UserVO getUserVO() {
		return this.userVO;
	}
	
	public void setUserVO(UserVO userVO) {
		this.userVO = userVO;
	}

}
