package kr.or.ddit.service.mypage.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.FilesDetailMapper;
import kr.or.ddit.mapper.MyPageMapper;
import kr.or.ddit.mapper.UserMapper;
import kr.or.ddit.security.CustomUser;
import kr.or.ddit.service.mypage.MyPageService;
import kr.or.ddit.util.FileUtil;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Criteria;
import kr.or.ddit.vo.UserVO;

@Service
public class MypageServiceImpl implements MyPageService {

	@Autowired
	MyPageMapper myPageMapper;
	
	@Autowired
	UserMapper userMapper;
	
	@Autowired
	FilesDetailMapper fileMapper;
	
	@Autowired
	FileUtil fileUtil;
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
	
	@Override
	public UserVO profile(String userCd) {
		return this.myPageMapper.profile(userCd);
	}

	@Override
	public UserVO profileEdit(String userCd) {
		return this.myPageMapper.profileEdit(userCd);
	}

	@Override
	public int profileEditPost(UserVO userVO) {
		return this.myPageMapper.profileEditPost(userVO);
	}

	@Override
	public void changeAuthentication(String userCd) {
		
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
		
		
		List<SimpleGrantedAuthority> authroties = new ArrayList<SimpleGrantedAuthority>();
		authroties.add(new SimpleGrantedAuthority(role));
		
		
		// 신규 authenticaation 설정
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		
		SecurityContextHolder.getContext().setAuthentication(new UsernamePasswordAuthenticationToken(new CustomUser(userVO), null, authroties));
		
	}

	@Override
	public int passEditPost(UserVO userVO) {
		
		// 현재 비밀번호
		String encodedPass = this.myPageMapper.getEncodedPassword(userVO.getUserCd()).getUserPass();
		
		// 현재 비밀번호와 같은가
		if (this.passwordEncoder.matches(userVO.getUserReg1(), encodedPass)) {
			// 변경할 비밀번호와 같은가
			if (this.passwordEncoder.matches(userVO.getUserPass(), encodedPass)) {
				return -1;
			}
			// 현재 비밀번호와 같고 변경할 비밀번호와 다른경우
			userVO.setUserPass(this.passwordEncoder.encode(userVO.getUserPass()));
			return this.myPageMapper.passEditPost(userVO);
		} else {
			return 0;
		}
	}

	@Override
	public List<BoardVO> getMyBoardList(Criteria cri) {
		return this.myPageMapper.getMyBoardWithPaging(cri);
	}

	@Override
	public int getMyBoardTotal(Criteria cri) {
		return this.myPageMapper.getMyBoardTotalCount(cri);
	}


}
