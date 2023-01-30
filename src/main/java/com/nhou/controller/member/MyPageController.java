package com.nhou.controller.member;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhou.domain.member.MemberDto;
import com.nhou.domain.order.OrderDto;
import com.nhou.domain.qna.PageInfo;
import com.nhou.domain.qna.QnADto;
import com.nhou.domain.store.StoreDto;
import com.nhou.service.cart.CartService;
import com.nhou.service.member.MemberService;
import com.nhou.service.order.OrderService;
import com.nhou.service.qna.QnAService;
import com.nhou.service.store.StoreService;

@Controller
@RequestMapping("myPage")
public class MyPageController {
	
	@Autowired
	private MemberService memberService;
	@Autowired
	private QnAService qnaService;
	@Autowired
	private StoreService storeService;
	@Autowired
	private CartService cartService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@GetMapping("myPageList")
	public void listMenu(Principal principal, Model model) {
		String loginId = principal.getName(); //로그인한 아이디 구하기
		MemberDto member = memberService.getById(loginId); //아이디 구해서 데이터베이스에서 회원정보 얻기
		
		model.addAttribute("member", member);
	}
	
	// (회원용) 주문 내역 가져오기
	@GetMapping("myPageOrderList")
	public void listOrder(Principal principal, Model model, OrderDto order) {
		String loginId = principal.getName();
		MemberDto member = memberService.getById(loginId);
		List<OrderDto> list = cartService.getMyOrder(order);
		
		model.addAttribute("member", member);
		model.addAttribute("list", list);
		
		System.out.println("마이페이지 계정" + member);
		System.out.println("내가 주문한 리스트" + list);
		
	}
	
	@GetMapping("myPageQnA")
	public void getQnA(@RequestParam(name="page", defaultValue="1") int page,//페이지
			PageInfo pageInfo, Principal principal, Model model) {
		String loginId = principal.getName();
		MemberDto member = memberService.getById(loginId);
		
		List<QnADto> list = qnaService.list(page, pageInfo);
		model.addAttribute("member", member);
		model.addAttribute("qnaList", list);
	}
	
	//사용자가 로그인한 상태: 스프링 mvc는 컨트롤러 메소드에 회원정보를 저장하고 있는 Principal 객체를 파라미터로 받을 수 있음
	//public String memberInfo(Principal principal, ModelMap modelMap) 메소드: 로그인한 회원정보를 받기 위해 Principal을 파라미터로 선언
	@GetMapping("myPageModify") 
	public void modify(Principal principal, Model model) { 
		String loginId = principal.getName(); //로그인한 아이디 구하기
		MemberDto member = memberService.getById(loginId); //아이디 구해서 데이터베이스에서 회원정보 얻기
		
		model.addAttribute("member", member);
		

	}
	
	@PostMapping("myPageModify")
	@PreAuthorize("authentication.name == #member.userId")
	public String modify(MemberDto member, String oldPassword, RedirectAttributes rttr) {
		// 회원 정보 수정 시 전 암호를 입력하여 수정하기
				MemberDto oldMember = memberService.getById(member.getUserId());
				
				rttr.addAttribute("id", member.getUserId());
				boolean passwordMatch = passwordEncoder.matches(oldPassword, oldMember.getPassword());
				if (passwordMatch) {
					// 기존 암호가 맞으면 회원 정보 수정
					int cnt = memberService.update(member);

					if (cnt == 1) {
						rttr.addFlashAttribute("message", "회원 정보가 수정되었습니다.");
						return "redirect:/myPage/myPageList";
					} else {
						rttr.addFlashAttribute("message", "회원 정보가 수정되지 않았습니다.");
						return "redirect:/myPage/myPageModify";
					}
				} else {
					rttr.addFlashAttribute("message", "암호가 일치하지 않습니다.");
					return "redirect:/myPage/myPageModify";
				}
	}
	
	@PostMapping("remove")
	public String remove(String userId, String oldPassword, RedirectAttributes rttr) {

		MemberDto oldmember = memberService.getById(userId);
																		// 암호화된 암호를 가져옴
		boolean passwordMatch = passwordEncoder.matches(oldPassword, oldmember.getPassword());
		
		if (passwordMatch) {
			memberService.remove(userId);
			
			rttr.addFlashAttribute("message", "회원 탈퇴하였습니다.");
			
			return "redirect:/main/list";
		} else {
			rttr.addAttribute("userId", userId);
			rttr.addFlashAttribute("message", "암호가 일치하지 않습니다.");
			return "redirect:/myPage/myPageModify";
		

		}

		
	}
	
	// 판매자 계정의 판매목록 가져오기
	@GetMapping("mySellerList")
	public void getMySellerList(@RequestParam("userId") String userId, Model model, Principal principal) {
		
		String loginId = principal.getName();
		MemberDto member = memberService.getById(loginId);
		
		MemberDto mySellerListByUserId = memberService.getUserSellList(userId);
		System.out.println("판매자 리스트" + mySellerListByUserId);
		
		model.addAttribute("sellerList", mySellerListByUserId);
		model.addAttribute("member", member);
	}
		
}
