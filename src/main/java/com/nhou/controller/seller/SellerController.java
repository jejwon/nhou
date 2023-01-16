package com.nhou.controller.seller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	@GetMapping("orderListByUser")
	public void sellerList(@RequestParam(name="page", defaultValue = "1") int page, // 페이지
						   @RequestParam(name="t", defaultValue = "all") String type, // 검색할 범위(카테고리)
						   @RequestParam(name="q", defaultValue = "") String keyword, // 검색 키워드
						   SellerPageInfo pageInfo, Model model, Principal principal, Authentication auth) {
		
		String loginId = auth.getName();
		MemberDto member = memberService.getById(loginId);
		
		List<SellerDto> list = sellerService.listBoard(page, type, keyword, pageInfo);
		
		model.addAttribute("orderList", list);
		model.addAttribute("member", member);
	}
}
