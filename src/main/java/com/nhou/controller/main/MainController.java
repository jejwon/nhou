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

@Controller
@RequestMapping("main")
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private MemberService memberService;
	
	// 메인 상품 리스트
	@GetMapping("list")
	public void list(Model model) {
		
		List<StoreDto> list = mainService.listBoard();

		model.addAttribute("list", list);
		System.out.println("상품 리스트 출력" + list);
		
		
	}
	
}
