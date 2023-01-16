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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@GetMapping("cartInsert")
	public void insert() {
		
	}
	@PostMapping("cartInsert")
	public String insert(CartDto cart) {
		int result = cartService.insert(cart);
		return result + "";
	}
	
	@PostMapping("cartDelete")
	public String delete(int cartId) {
		cartService.delete(cartId);
		
		return "redirect:/cart/cartList";
	}
	
	@PostMapping("cartModify")
	public String modify(CartDto cart, RedirectAttributes rttr) {
		cartService.update(cart);
		
		return "redirect:/cart/cartList";
	}
	
	@GetMapping("cartGet")
	public void get(@RequestParam(name="cartId") int cartId, Model model) {
		CartDto cart = cartService.getByCartId(cartId);
		model.addAttribute("cart", cart);
	}
	
	@GetMapping("/cartList/{member_userId}")
	public void list(@PathVariable("member_userId") String member_userId, Model model, Principal principal) {
		List<CartDto> list = cartService.list(member_userId);
		model.addAttribute("cartList", list);
		
		//return "/cart"; String -> type 변경
	}
	
	
}
