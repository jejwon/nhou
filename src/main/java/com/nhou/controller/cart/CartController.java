package com.nhou.controller.cart;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhou.domain.cart.CartDto;
import com.nhou.service.cart.CartService;
import com.nhou.service.member.MemberService;


@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberService memberService;

	@GetMapping("cartList")
	public void list() {
		
	}
	
	@GetMapping("cartInsert")
	public void insert() {
		
	}
	@PostMapping("cartInsert")
	public void insert(CartDto cart) {
		cartService.insert(cart);
		
	}
}
