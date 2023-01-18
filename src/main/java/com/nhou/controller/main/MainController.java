package com.nhou.controller.main;

import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhou.domain.member.MemberDto;

@Controller
@RequestMapping("main")
public class MainController {

	
	@GetMapping("list")
	public void list(MemberDto member, Model model, Principal principal) {
		String username = (principal != null ? principal.getName() : "ANONYMOUS");
		
		member.setUserId(username);
		model.addAttribute("member", member);

	}
}
