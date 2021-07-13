package com.levelUp.tour.entity;


import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.*;

@Entity
@Table(name = "TOUR_USER")
@Getter
@Setter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class MemberEntity implements UserDetails{

	@Id
	@Column(length = 100, name ="USER_EMAIL")
	private String email;
	
	@Column(nullable = false, name="USER_NAME")
	private String name;
	
	@Column(nullable = false, name="PASSWORD")
	private String password;
	
	@Column(name="PHONE")
	private String phone;
	
	@Column(nullable = false, name="PLATFORM_TYPE")
	private String platformtype;
	
	@Column(name="AUTH")
	private String auth;


	@Builder
	public MemberEntity(String email, String name, String password, String phone, String platformtype, String auth) {
		this.email = email;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.platformtype = platformtype;	
		this.auth = auth;
	}
	
	  // 사용자의 권한을 콜렉션 형태로 반환
	  // 단, 클래스 자료형은 GrantedAuthority를 구현해야함
	  @Override
	  public Collection<? extends GrantedAuthority> getAuthorities() {
	    Set<GrantedAuthority> roles = new HashSet<>();
	    for (String role : auth.split(",")) {
	      roles.add(new SimpleGrantedAuthority(role));
	    }
	    return roles;
	  }

	  // 사용자의 id를 반환 (unique한 값)
	  @Override
	  public String getUsername() {
	    return email;
	  }

	  // 사용자의 password를 반환
	  @Override
	  public String getPassword() {
	    return password;
	  }

	  // 계정 만료 여부 반환
	  @Override
	  public boolean isAccountNonExpired() {
	    // 만료되었는지 확인하는 로직
	    return true; // true -> 만료되지 않았음
	  }

	  // 계정 잠금 여부 반환
	  @Override
	  public boolean isAccountNonLocked() {
	    // 계정 잠금되었는지 확인하는 로직
	    return true; // true -> 잠금되지 않았음
	  }

	  // 패스워드의 만료 여부 반환
	  @Override
	  public boolean isCredentialsNonExpired() {
	    // 패스워드가 만료되었는지 확인하는 로직
	    return true; // true -> 만료되지 않았음
	  }

	  // 계정 사용 가능 여부 반환
	  @Override
	  public boolean isEnabled() {
	    // 계정이 사용 가능한지 확인하는 로직
	    return true; // true -> 사용 가능
	  }
	
}
