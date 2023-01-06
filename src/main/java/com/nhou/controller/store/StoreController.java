package com.nhou.controller.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhou.domain.store.StoreDto;
import com.nhou.service.store.StoreService;

@Controller
@RequestMapping("store")
public class StoreController {

	@Autowired
	private StoreService service;
	
	@GetMapping("register")
	public void register() {
		
	}
	
	@PostMapping("register")
	public String register(StoreDto store) {
	
//		System.out.println("controller ==========> "+store);
		
		service.register(store);
		
		return "redirect:/store/list";
	}
	
	/*
	 * @GetMapping("list") public void list(Model model) {
	 * 
	 * // request param 수집
	 * 
	 * // business logic List<StoreDto> list = service.listStore(); List<StoreDto>
	 * list = service.listStore(); // 모델에 add attr 넣고
	 * model.addAttribute("storeList", list); model.addAttribute("productList",
	 * list); // forward
	 * 
	 * }
	 */
	
	@GetMapping("list") public void list() {
		
	}
	
}
