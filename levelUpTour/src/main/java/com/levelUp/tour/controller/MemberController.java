package com.levelUp.tour.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.levelUp.tour.dto.MemberDto;
import com.levelUp.tour.service.KakaoAPI;
import com.levelUp.tour.service.MemberService;

@Controller
@RequestMapping("/")
public class MemberController {
	
	@Autowired
	private KakaoAPI kakao;
	
	@Autowired
	private MemberService memberService;
	
	// 01_1. 카카오 로그인
	@RequestMapping(value="/kaoLogin")
	public ModelAndView kakaoLogin(String code, HttpSession session) {
		ModelAndView modelandview = new ModelAndView();
		System.out.println("code ::: "+code);
		String access_Token = kakao.getAccessToken(code);
		HashMap<String,Object> userInfo = kakao.getUserInfo(access_Token);
		System.out.println("controller access_token : "+access_Token);
		System.out.println("login Controller : "+userInfo);
		
		//클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		if(userInfo.get("email") != null) {
			session.setAttribute("kakao_userId", userInfo.get("email"));
			session.setAttribute("access_Token", access_Token);
		}
		modelandview.setViewName("/index");
		modelandview.addObject("kakao_nickname",userInfo.get("nickname"));
		modelandview.addObject("kakao_userId",userInfo.get("email"));		
		return modelandview;
	}
	
	
	// 02. 회원가입 페이지로 이동
	@RequestMapping(value="/join", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView join() {
		ModelAndView modelandview = new ModelAndView();
		modelandview.setViewName("join");	
		return modelandview;
		
	}
	
	// 03. 카카오 로그아웃 구현
	@RequestMapping(value="/kaoLogout")
	public String kakaoLogout(HttpSession session) {
		kakao.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");
		session.removeAttribute("kakao_userId");
		return "redirect:/";
	}
	
	// 04. 회원가입 처리
	@PostMapping(value="/join/end")
	public String joinEnd(MemberDto memberDto) {
		System.out.println("01) Controller ::::::회원가입!!!!!");
		System.out.println("memberDto 값 넘어가는거 확인:::"+memberDto);
		memberService.joinEnd(memberDto);
		return "redirect:/";
	}
	
	// 05. 일반 로그아웃 구현
	@GetMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		new SecurityContextLogoutHandler().logout(request, response, SecurityContextHolder.getContext().getAuthentication());
		return "redirect:/";
	}
	
}
