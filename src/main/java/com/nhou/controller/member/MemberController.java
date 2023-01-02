package com.nhou.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UserDetailsRepositoryReactiveAuthenticationManager;
import org.springframework.security.core.userdetails.ReactiveUserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhou.domain.member.MemberDto;
import com.nhou.service.member.MemberService;


@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
		
	@GetMapping("join")
	public void insert() {
		//join.jsp로 이동
	}
	
	//@InitBinder //날짜를 bean(vo)에 매핑할때 form에 입력된 날짜는 String형인데 bean의 날짜변수 타입은 Date 타입이라면 typeMisMatch 오류
	@PostMapping("join")
	public String insert(MemberDto member) { //회원가입
	//String rawPassword = member.getPassword();	
		//static으로 선언되지 않은 메서드나 필드를 참조할 수 없다는 오류
		//다른 멤버보다 static 멤버가 먼저 컴파일됨
		//static 멤버의 컴파일 시점에서는 static이 아닌 메서드나 필드는 정의xx
		//따라서, 모든 메서드나 필드를 static 멤버로 바꾸거나 
		//bcryptPasswordEncoder 클래스의 객체를 직접 생성해서 접근하는 방법으로 우회
	//	BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();
	//	String encPassword = bCryptPasswordEncoder.encode(rawPassword);		
	//	member.setPassword(encPassword);
	//	member.setRole("ROLE_USER");
		
		memberService.signupMember(member);
		
		return "redirect:/main/list"; //등록 성공-> /main/main로 이동
	}
	
	@GetMapping("login")
	public void login() {
		
	}
	
	

	
}
