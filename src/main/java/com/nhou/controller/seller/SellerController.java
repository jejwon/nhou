package com.nhou.controller.seller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.member.MemberDto;
import com.nhou.domain.seller.SellerDto;
import com.nhou.domain.seller.SellerPageInfo;
import com.nhou.service.member.MemberService;
import com.nhou.service.seller.SellerService;

@Controller
@RequestMapping("seller")
public class SellerController {
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private MemberService memberService;

	// 회원들 주문목록
	@GetMapping("sellerList")
	public void sellerList(@PathVariable("userId") String userId,
						   @RequestParam(name="s") String s,
						   Model model, Principal principal) {
		
		if(principal.getName() == userId) {
			// 유저정보 가져오기
			String loginId = principal.getName();
			MemberDto member = memberService.getById(loginId);
			System.out.println("로그인한 아이디" + loginId);
			
			// 상품 리스트 가져오기
			List <SellerDto> sellerList = sellerService.selectSellerList(s);
			System.out.println("판매현황 리스트" + sellerList);
			
			model.addAttribute("member", member);
			model.addAttribute("sellerList", sellerList);
			
		}
	}
}
