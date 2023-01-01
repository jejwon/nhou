package com.nhou.controller.member;
import java.lang.ProcessBuilder.Redirect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@GetMapping("myPageOrderList")
	public void listOrder() {
		
	}
	
	@GetMapping("myPageQnA")
	public void getQnA() {
		
	}
	
	@GetMapping("myPageModify")
	public void modify(String userId, Model model) {
		MemberDto member = memberService.getById(userId);
		
		model.addAttribute("member", member);
		
	}
	
	@PostMapping("myPageModify")
	public String modify(MemberDto member, RedirectAttributes rttr) {
		memberService.update(member);
		
		rttr.addAttribute("userId", member.getUserId());
		
		return "redirect:/myPage/myPageList";
	}
	
}
