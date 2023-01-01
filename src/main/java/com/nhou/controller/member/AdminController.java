package com.nhou.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhou.service.member.MemberService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("memberInfo")
	public void list(Model model) {
		model.addAttribute("memberList", memberService.list());
		//System.out.println(model);
	}
	
	@GetMapping("QnAList")
	public void getByQnAId() {
		
	}
}
