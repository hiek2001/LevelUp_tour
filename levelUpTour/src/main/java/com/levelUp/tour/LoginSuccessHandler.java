package com.levelUp.tour;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;


public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

		// 사용자가 직접 로그인 버튼을 누른 경우
		HttpSession session = request.getSession();
		session.setAttribute("welcomeName", authentication.getName());
		System.out.println("LoginSuccessHandler:::"+authentication.getName());
		
		//String uri = request.getContextPath();		
		response.sendRedirect("/");
			
	}
}
