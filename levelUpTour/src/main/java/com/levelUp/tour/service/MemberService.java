package com.levelUp.tour.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.levelUp.tour.dto.MemberDto;
import com.levelUp.tour.entity.MemberEntity;
import com.levelUp.tour.repository.MemberRepository;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService implements UserDetailsService{

	@Autowired
	private MemberRepository memberRepository;
	
	// 01. 회원가입
	// 회원정보가 들어가있는 memberDto, 저장되는 회원의 PK가 return 됨
	@Transactional
	public MemberEntity joinEnd(MemberDto memberDto) {
		// 비밀번호 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		memberDto.setPassword(passwordEncoder.encode(memberDto.getPassword()));
		System.out.println("02) Service ::::::회원가입!!!!!");
		return memberRepository.save(memberDto.toEntity());
	}
	
	// 02. 로그인
	// db에서 user 정보 직접 가져옴, UserDetailsService를 상속했기에 필수로 생성해야 함.
	@Override 
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		System.out.println("로그인::::email::::"+email);
		return memberRepository.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException((email)));
	}
}
