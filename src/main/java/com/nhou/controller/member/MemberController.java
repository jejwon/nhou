package com.nhou.controller.member;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	@PostMapping("signup")
	public String insertOk(MemberDto member) {
		memberService.signupMember(member);
		
		return "redirect:/main/list"; //등록 성공-> /main/list로 이동
	}
}
