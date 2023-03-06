package com.nhou.controller.member;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhou.domain.member.MemberDto;
import com.nhou.domain.member.PageInfo;
import com.nhou.service.member.MemberService;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("memberInfo")
	public void list(@RequestParam(name="page", defaultValue = "1") int page,
					PageInfo memberPageInfo,
					@RequestParam(name="q") String keyword,
					@RequestParam(name="t") String type,
					Model model, Principal principal) {
		String loginId = principal.getName();
		MemberDto member = memberService.getById(loginId);
		
		List<MemberDto> memberList = memberService.selectMemberList(page, memberPageInfo, keyword, type);
		
		model.addAttribute("member", member);
		model.addAttribute("memberList", memberList);
		model.addAttribute("memberPageInfo", memberPageInfo);
		//System.out.println(model);
	}
	
	@GetMapping("manageMember") 
	public void modify(Principal principal, Model model) { 
		String loginId = principal.getName(); //로그인한 아이디 구하기
		MemberDto member = memberService.getById(loginId); //아이디 구해서 데이터베이스에서 회원정보 얻기
		
		model.addAttribute("member", member);
		
		
	}
	
	@PostMapping("manageMember")
	public String edit(MemberDto member, RedirectAttributes rttr) {
		memberService.update(member);
		
		rttr.addAttribute("userId", member.getUserId());
		System.out.println(member);
		
		return "redirect:/admin/memberInfo";
	}
	
	
}