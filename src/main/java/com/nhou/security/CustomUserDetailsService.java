package com.nhou.security;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import com.nhou.mapper.member.MemberMapper;

@Component //빈을 만들기 위해 컴포넌 :  Bean이 되어야 스프링이 알아보고 UserDetailsService 를 사용한다.
public class CustomUserDetailsService implements UserDetailsService { 
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
		String encodedPw = passwordEncoder.encode(username + "pw");
		
		User user = new User(username, encodedPw, List.of());
		
		return user;
	}
	//public CustomUserDetailsService loadUsername(String userId) {
		//MemberDto member = UserDetailsRepositoryReactiveAuthenticationManager.findUsername(userId);
	//}
}
