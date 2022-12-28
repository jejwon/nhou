package com.nhou.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import com.nhou.mapper.member.MemberMapper;

@Component //빈을 만들기 위해 컴포넌 :  Bean이 되어야 스프링이 알아보고 UserDetailsService 를 사용한다.
public class CustomUserDetailsService { //implements UserDetailsService
	@Autowired
	private MemberMapper memberMapper;
}
