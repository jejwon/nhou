package com.nhou.controller.cart;

import java.security.Principal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nhou.domain.member.MemberDto;
import com.nhou.domain.order.IamportAPI;
import com.nhou.domain.order.OrderDto;
import com.nhou.service.member.MemberService;
import com.nhou.service.order.OrderService;

import software.amazon.ion.IonException;

@Controller
public class OrderController {
	
	// iamport
	private IamportAPI iamportApi;

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private MemberService memberService;
	
	 @GetMapping("/payment/orderPage") 
	 public void orderList(Model model, Principal principal) {
		 String loginId = principal.getName();
		 MemberDto member = memberService.getById(loginId);
		 
		 List<OrderDto> orderList = orderService.listOrder();
		 
		 model.addAttribute("member", member);
		 model.addAttribute("orderList", orderList);
		 System.out.println("결제페이지 멤버" + member);
		 System.out.println("오더리스트 info" + orderList);
	 }
	 
	 @GetMapping("/payment/orderResult")
	 public void saveOrderResult(@RequestParam(value = "selectArr", required = false) int[] selecteArr, Model model) {
		 
		 List<OrderDto> od2 = new ArrayList<OrderDto>();
		 
		 for(int sA : selecteArr) {
			 OrderDto od = orderService.getInfo(sA);
			 od2.add(od);
			 int orderId = od.getOrderId();
			 int productId = od.getProduct_productId();
			 String userId = od.getMember_userId();
			 int price = od.getPayment();
			 int count = od.getCount();
			 LocalDateTime orderDate = od.getOrderDate();
			 String status = od.getStatus();
		 }
		 
		 model.addAttribute("od2", od2);
		 System.out.println("주문정보" + od2);
	 }
	 
	 @PostMapping("/payment/orderResult")
	 public void saveOrderR(@RequestBody ArrayList<Integer> selectArr) {
		 List<OrderDto> od2 = new ArrayList<OrderDto>();
		 
		 for(int sA : selectArr) {
			 OrderDto od = orderService.getInfo(sA);
			 od2.add(od);
			 int orderId = od.getOrderId();
			 int productId = od.getProduct_productId();
			 String userId = od.getMember_userId();
			 int price = od.getPayment();
			 int count = od.getCount();
			 LocalDateTime orderDate = od.getOrderDate();
			 String status = od.getStatus();
			 
			 int cnt1 = orderService.insertRes(orderId, userId);
		 }
	 }
	 
}
