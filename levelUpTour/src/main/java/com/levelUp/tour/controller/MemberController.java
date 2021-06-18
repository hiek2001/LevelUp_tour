package com.levelUp.tour.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.levelUp.tour.service.KakaoAPI;

@Controller
public class MemberController {
	
	@Autowired
	private KakaoAPI kakao;
	
	// 01. 로그인 페이지로 이동
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("login");	
		return modelandview;
		
	}
	
	// 01_1. 카카오 로그인
	@RequestMapping(value="/login/kakao")
	public ModelAndView kakaoLogin(String code, HttpSession session) {
		ModelAndView modelandview = new ModelAndView();
		System.out.println("code ::: "+code);
		String access_Token = kakao.getAccessToken(code);
		HashMap<String,Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("controller access_token : "+access_Token);
		System.out.println("login Controller : "+userInfo);
		
		//클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if(userInfo.get("email") != null) {
			session.setAttribute("userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
		}
		modelandview.setViewName("login/kakao");	
		return modelandview;
	}
	
	
	// 02. 회원가입 페이지로 이동
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("join");	
		return modelandview;
		
	}
	
}
