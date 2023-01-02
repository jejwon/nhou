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
	public void listMenu(Principal principal, Model model) {
		String loginId = principal.getName(); //로그인한 아이디 구하기
		MemberDto member = memberService.getById(loginId); //아이디 구해서 데이터베이스에서 회원정보 얻기
		
		model.addAttribute("member", member);
	}
	
	@GetMapping("myPageOrderList")
	public void listOrder() {
		
	}
	
	@GetMapping("myPageQnA")
	public void getQnA() {
		
	}
	
	//사용자가 로그인한 상태: 스프링 mvc는 컨트롤러 메소드에 회원정보를 저장하고 있는 Principal 객체를 파라미터로 받을 수 있음
	//public String memberInfo(Principal principal, ModelMap modelMap) 메소드: 로그인한 회원정보를 받기 위해 Principal을 파라미터로 선언
	@GetMapping("myPageModify") 
	public void modify(Principal principal, Model model) { 
		String loginId = principal.getName(); //로그인한 아이디 구하기
		MemberDto member = memberService.getById(loginId); //아이디 구해서 데이터베이스에서 회원정보 얻기
		
		model.addAttribute("member", member);
		

	}
	
	@PostMapping("myPageModify")
	public String modify(MemberDto member, RedirectAttributes rttr) {
		memberService.update(member);
		
		rttr.addAttribute("userId", member.getUserId());
		System.out.println(member);
		
		return "redirect:/myPage/myPageList";
	}
	
}
