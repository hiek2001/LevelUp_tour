package com.levelUp.tour.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.levelUp.tour.service.MemberService;

import lombok.AllArgsConstructor;


@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	// 유저 정보 가져올 클래스
	MemberService memberService;
	
	// 비밀번호 암호화
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	// kakao api 로그인을 위한 의존성 주입
//	@Autowired
//	private CustomOAuth2UserService customAutowireConfigurer;
	
	// static resource들이 인증 무시할 수 있게 설정, 무조건 접근이 가능해야 함
	@Override
	public void configure(WebSecurity web) throws Exception{
		web.ignoring().antMatchers("/api/**", "/index/**", "/member/**", "/tourSpot/**");
	}	
	
	
	// http 관련 인증 설정 가능
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			// 페이지 권한 설정
			.authorizeRequests() //접근에 대한 인증 설정
			  .antMatchers("/", "/join/**", "/tourSpot", "/tourSpotDetail","/login/**").permitAll() //antMatchers를 통해 경로 설정과 권한 설정 가능 / permitAll : 누구나 접근 가능
			  .anyRequest().authenticated() //나머지 요청들은 권한 종류에 상관없이 권한이 있어야 접근
			 
			
			// 로그인 설정
			.and()
			 .formLogin()
			  .loginPage("/join") //로그인 페이지 링크
			  .loginProcessingUrl("/login/normal")
			  .defaultSuccessUrl("/") //로그인 성공 후 리다이렉트 주소
			  .usernameParameter("email")
			  .usernameParameter("password")
			  .permitAll()
			  
			// 로그아웃 설정
			.and()
			 .logout()
			  .logoutSuccessUrl("/") //로그아웃 성공 시 리다이렉트 주소
			  .invalidateHttpSession(true); //세션 날리기
			  
		http.cors().and();
		http.csrf().disable();
			// oauth2를 이용해 kakao login 구현
			//.and()
			 //.oauth2Login()
			 // .userInfoEndpoint()
			  // .MemberService(customAutowireConfigurer);
		
	}
	
	// 로그인할 때 필요한 정보 가져옴
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(memberService)
			//해당 서비스(meberService)에서는 memberDetailService를 implements 해서 loadUserByUsername() 구현해야 함
		.passwordEncoder(new BCryptPasswordEncoder());
	}
}
