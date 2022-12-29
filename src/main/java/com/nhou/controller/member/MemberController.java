package com.nhou.controller.member;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhou.domain.member.MemberDto;
import com.nhou.service.member.MemberService;


@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("signup")
	public void insert() {
		//singup.jsp로 이동
	}
	
	//@InitBinder //날짜를 bean(vo)에 매핑할때 form에 입력된 날짜는 String형인데 bean의 날짜변수 타입은 Date 타입이라면 typeMisMatch 오류
	@PostMapping("signup")
	public String insert(MemberDto member) {
		memberService.signupMember(member);
		
		return "redirect:/main/main"; //등록 성공-> /main/main로 이동
	}
	
	@GetMapping("login")
	public void login() {
		
	}
}
