package com.nhou.controller.store;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhou.domain.member.MemberDto;
import com.nhou.domain.store.StoreDto;
import com.nhou.domain.store.Criteria;
import com.nhou.domain.store.PageDto;
import com.nhou.service.store.StoreService;

@Controller
@RequestMapping("store")
public class StoreController {

	@Autowired
	private StoreService service;
	
	@GetMapping("storeRegister")
	// forward to view
	public void register() {
		
	}
	
	@PostMapping("storeRegister")
	public String register(
			StoreDto store,
			MultipartFile productFile1,
			MultipartFile[] productFile2,
			RedirectAttributes rttr, 
			Principal principal) {
		// * 파일 업로드
		// 1. web.xml
		// 	  dispatcherServlet 설정에 multipart-config 추가
		// 2. form의 enctype="multipart/form-data" 속성 추가
		// 3. Controller의 메소드 argument type : multipartFile
		
		//System.out.println(productFileName.getOriginalFilename());
	
		String loginId = principal.getName();
		store.setMember_userId(loginId);
		System.out.println(loginId);
		/*
		 * Request param 수집/가공 
		 * System.out.println("controller ==========> "+store);
		 */		 
		
		//Business logic
		int cnt = service.register(store, productFile1, productFile2);
		System.out.println();
		if (cnt == 1) {
			rttr.addFlashAttribute("message", "새 게시물이 등록되었습니다.");
		} else {
			rttr.addFlashAttribute("message", "새 게시물이 등록되지 않았습니다.");
		}
		 
		//Redirect to list
		return "redirect:/store/storeList";
		
	}
	
	@GetMapping("storeList")
	public void list(@RequestParam(name="category", defaultValue = "") String category,
					 StoreDto store, Criteria cri, Model model) {
		
		String keyword = cri.getKeyword();
		cri.setKeyword("%" + cri.getKeyword() + "%");
		List<StoreDto> list = service.listStore(cri, category);
		
		System.out.println(list);
		System.out.println("category" + category);
		
		model.addAttribute("storeList", list);
		
		// 페이지네이션
		int total = service.getTotal(cri);
		model.addAttribute("pageMaker", new PageDto(cri, total));
		
		cri.setKeyword(keyword);
		
	}
	  
	  
	  @GetMapping("storeGet") 
	  public void get(int productId, Model model) { 
		  // Request param 생략가능
	  
		  // Business logic 
		  StoreDto store = service.get(productId);
		  
	  
		  System.out.println(store);
	  
		  //add attr to model 
		  model.addAttribute("store", store);
		  
		  // forward
	  }
	  
	  @GetMapping("storeModify")
	  public void modify(int productId, Model model) {
		  StoreDto store = service.get(productId);  
		  model.addAttribute("store", store);
	  }
	  
	  @PostMapping("storeModify")
	  public String modify(StoreDto store, RedirectAttributes rttr) {
		  int cnt = service.update(store);
		  
		  if (cnt==1) {
			  rttr.addFlashAttribute("message", "게시물이 수정되었습니다.");
		  } else {
			  rttr.addFlashAttribute("message", "게시물이 수정되지 않았습니다.");
		  }
		  
		  
		  return "redirect:/store/storeList";
	  }
	  
	  @PostMapping("storeRemove")
	  public String remove(int productId, RedirectAttributes rttr) {
		  int cnt = service.remove(productId);
		  
		  if (cnt == 1) {
			  rttr.addFlashAttribute("message", productId + "번 게시물이 삭제되었습니다.");
		  } else {
			  rttr.addFlashAttribute("message", productId + "번 게시물이 삭제되지 않았습니다.");
		  }
		  
		  return "redirect:/store/storeList";
	  }
	 
	
}
