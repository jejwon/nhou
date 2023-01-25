package com.nhou.controller.cart;


import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.member.MemberDto;
import com.nhou.service.cart.CartService;
import com.nhou.service.member.MemberService;


@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberService memberService;
	
	
	
	@ResponseBody//자바 객체를 HTTP 응답 본문의 객체로 변환
	@PostMapping("cartInsert")
	public void insert(CartDto cart) {
		cartService.insert(cart);

	}
	
	@PostMapping("cartDelete")
	public String delete(int cartId) {
		cartService.delete(cartId);
		
		return "redirect:/cart/cartList";
	}
	
	
	 @PostMapping("cartModify") 
	 public String modify(CartDto cart) { 
		 cartService.update(cart);
		 return "redirect:/cart/cartList"; // + cart.getMember_userId(); 
	  }
	
	@GetMapping("cartList")
	public void list(Model model, Principal principal) {
		
		String loginId = principal.getName();	
		MemberDto  member = memberService.getById(loginId);
		
		List<CartDto> list = cartService.list(loginId);
		model.addAttribute("member", member);
	 
		model.addAttribute("cartList", list);

	}
	
	@GetMapping("pay")
	public void getPay(Model model, Principal principal) {
		String loginId = principal.getName();	
		MemberDto  member = memberService.getById(loginId);
		
		List<CartDto> list = cartService.list(loginId);
		model.addAttribute("member", member);
	 
		model.addAttribute("cartList", list);
	}
	
	@PostMapping("pay")
	public void pay() {
		
	}
	
}
