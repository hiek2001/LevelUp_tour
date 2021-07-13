package com.levelUp.tour.dto;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import com.levelUp.tour.entity.MemberEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class MemberDto {

	private String email;
	private String name;
	private String password;
	private String phone;
	private String platformtype;
	private String auth;
	
	
	public MemberEntity toEntity() {
		MemberEntity build = MemberEntity.builder()
				.email(email)
				.name(name)
				.password(new BCryptPasswordEncoder().encode(password))
				.phone(phone)
				.platformtype(platformtype)
				.auth(auth)
				.build();
		return build;
	}
	
	@Builder
	public MemberDto(String email, String name, String password, String phone, String platformtype, String auth) {
		this.email = email;
		this.name = name;
		this.password = password;
		this.phone = phone;
		this.platformtype = platformtype;
		this.auth = auth;
	}
}
