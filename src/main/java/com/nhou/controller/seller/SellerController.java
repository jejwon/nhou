package com.nhou.controller.seller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.member.MemberDto;
import com.nhou.domain.order.OrderDto;
import com.nhou.domain.order.OrderItemDto;
import com.nhou.domain.seller.SellerDto;
import com.nhou.domain.seller.SellerPageInfo;
import com.nhou.domain.store.StoreDto;
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
	public void sellerList(Model model, Principal principal, StoreDto store, OrderDto order, OrderItemDto item) {
		String loginId = principal.getName();
		MemberDto member = memberService.getById(loginId);
		
		model.addAttribute("member", member);
		
		if (principal.getName() == loginId) {
			List<StoreDto> storeList = sellerService.getProductList(store);
			List<OrderDto> orderList = sellerService.getOrderList(order);
			
			model.addAttribute("storeList", storeList);
			model.addAttribute("orderList", orderList);
			
			/*
			 * System.out.println("판매상품" + storeList); System.out.println("판매현황" +
			 * orderList);
			 */
			
		}
		
	}
	
	// 주문 상세 가져오기
	/*
	 * @GetMapping("sellerGet") public void get(@RequestParam("orderId") int
	 * orderId, Model model, Principal principal) { String member_userId = null;
	 * 
	 * if (principal != null) { member_userId = principal.getName(); }
	 * 
	 * List<OrderDto> order = sellerService.get(orderId, member_userId);
	 * model.addAttribute("order", order); System.out.println(order); }
	 */
	
	// 배송상태 수정
	@PostMapping("sellerModify") 
	 public String update(OrderDto order) {
	 sellerService.update(order);
	
	 return "redirect:/seller/sellerList"; }
	 
}
