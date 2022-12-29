package com.nhou.controller.myPage;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhou.domain.member.MemberDto;
import com.nhou.service.member.MemberService;

@Controller
@RequestMapping("myPage")
public class MyPageController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("myPageList")
	public void listMenu() {
		
	}
	
	@GetMapping("myPageModify")
	public void modifyMember() {
		
	}
	
	@GetMapping("myPageOrderList")
	public void listOrder() {
		
	}
	
	@GetMapping("myPageQnA")
	public void getQnA() {
		
	}
	
	/*
	 * @PostMapping("myPageModify") public String modifyMember(MemberDto member) {
	 * memberService.updateMemberInfo(member);
	 * 
	 * return "redirect:/myPage/myPageList"; }
	 */

}
