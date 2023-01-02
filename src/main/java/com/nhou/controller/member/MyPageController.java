package com.nhou.controller.member;
import java.lang.ProcessBuilder.Redirect;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhou.domain.member.MemberDto;
import com.nhou.service.member.MemberService;

@Controller
@RequestMapping("myPage")
public class MyPageController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
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
	public void modify(Principal principal, String userId, Model model) {
		String loginId = principal.getName();
		MemberDto member = memberService.getById(loginId);
		
		model.addAttribute("member", member);
		
	}
	
	@PostMapping("myPageModify")
	public String modify(MemberDto member, RedirectAttributes rttr) {
		memberService.update(member);
		
		rttr.addAttribute("userId", member.getUserId());
		
		return "redirect:/myPage/myPageList";
	}
	
}
