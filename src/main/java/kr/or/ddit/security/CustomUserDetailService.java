package kr.or.ddit.security;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import kr.or.ddit.mapper.UserMapper;
import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@RequiredArgsConstructor
@Slf4j
public class CustomUserDetailService implements UserDetailsService{
	
	private final UserMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String userCd) throws UsernameNotFoundException {
		
		String role = userMapper.getAuthority(userCd);
		
		UserVO userVO = null;
		
		switch (role) {
		case "USER01":
			userVO = userMapper.getStudentInfo(userCd);
			break;
		case "USER02":
			userVO = userMapper.getProfessorInfo(userCd);
			break;
		case "USER03":
			userVO = userMapper.getEmployeeInfo(userCd);
			break;
		}
		
		if (userVO == null) throw new UsernameNotFoundException("사용자 정보를 찾을 수 없습니다.");
		
		log.info("CustomUserDetailService: userVO ==> {}", userVO);
		
		return new CustomUser(userVO);
	}
	
}
