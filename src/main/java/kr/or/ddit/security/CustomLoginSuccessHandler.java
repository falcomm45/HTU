package kr.or.ddit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import kr.or.ddit.vo.UserVO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@RequiredArgsConstructor
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	private final PasswordEncoder passwordEncoder;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws ServletException, IOException {

		CustomUser customUser = (CustomUser) authentication.getPrincipal();

		UserVO userVO = customUser.getUserVO();

		List<String> roleList = new ArrayList<String>();
		authentication.getAuthorities().forEach(auth -> {
			log.info("auth ==> {}", auth);
			roleList.add(auth.getAuthority());
		});

		if (roleList.contains("ROLE_EMPLOYEE")) {
			response.sendRedirect("/employee/mypage");
			return;
		}

		if (roleList.contains("ROLE_PROFESSOR")) {
			response.sendRedirect("/login?auth=1");
//			response.sendRedirect("/professor/mypage");
			return;
		}

		if (roleList.contains("ROLE_STUDENT")) {

			if (this.passwordEncoder.matches(userVO.getUserReg1(), userVO.getUserPass())) {
				response.sendRedirect("/common/mypage/passwordEdit?firstLogin=1");
				return;
			}

			response.sendRedirect("/student/mypage");
			return;
		}

		super.onAuthenticationSuccess(request, response, authentication);
	}

}
