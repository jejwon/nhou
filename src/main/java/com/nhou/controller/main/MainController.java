package com.nhou.controller.main;

import java.security.Principal;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nhou.domain.main.MainDto;
import com.nhou.domain.member.MemberDto;
import com.nhou.domain.store.StoreDto;
import com.nhou.service.main.MainService;
import com.nhou.service.member.MemberService;

import com.nhou.domain.member.MemberDto;

@Controller
@RequestMapping("main")
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	private MemberService memberService;

	
	@GetMapping("list")
	public void list(MemberDto member, Model model, Principal principal) {
		String username = (principal != null ? principal.getName() : "ANONYMOUS");
    
    
		member.setUserId(username);
		model.addAttribute("member", member);
	}
	
	
	
}

