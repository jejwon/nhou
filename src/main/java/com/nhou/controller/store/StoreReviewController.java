package com.nhou.controller.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nhou.domain.store.ReviewDto;
import com.nhou.service.store.StoreReviewService;


//@Controller
//@ResponseBody
@RestController
@RequestMapping("storeReview")
public class StoreReviewController {

		@Autowired
		private StoreReviewService storeReviewService;
		
		@PutMapping("modify") 
		@PreAuthorize("@storeReviewSecurity.checkWriter(authentication.name, #review.productReplyId)")
		public Map<String, Object> modify(@RequestBody ReviewDto review) {
			Map<String, Object> map = new HashMap<>();
			
			int cnt = storeReviewService.modify(review);
			
			if (cnt == 1) {
				map.put("message", "댓글이 수정되었습니다.");
			} else {
				map.put("message", "댓글이 수정되지 않았습니다.");
			}
			
			return map;
		}
		
		@GetMapping("get/{productReplyId}") 
		public ReviewDto get(@PathVariable int productReplyId) {
			return storeReviewService.getById(productReplyId);
		}
		
		@DeleteMapping("remove/{productReplyId}") 
		@PreAuthorize("@storeReviewSecurity.checkWriter(authentication.name, #productReplyId)")
		public Map<String, Object> remove (@PathVariable int productReplyId) {
			Map<String, Object> map = new HashMap<>();
			
			int cnt = storeReviewService.removeByproductReplyId(productReplyId);
			
			if (cnt == 1) {
				map.put("message", "댓글이 삭제되었습니다.");
			} else {
				map.put("message", "댓글이 삭제되지 않았습니다.");
			}
			return map;
		}
		
		@GetMapping("list/{product_productId}")
		public List<ReviewDto> list(@PathVariable int product_productId, Authentication auth) {
			
			String username = "";
			
			if (auth != null) {
				username = auth.getName(); 
			}
						
			return storeReviewService.listReviewByproduct_productId(product_productId, username);
		}
		
	
		@PostMapping("add")
		@PreAuthorize("isAuthenticated()")
		public Map<String, Object> add(@RequestBody ReviewDto review, Authentication auth) {
		//	System.out.println(review);
			if (auth != null) {
			review.setMember_userId(auth.getName());
			}

			Map<String, Object> map = new HashMap<>();
			
			int cnt = storeReviewService.addReview(review);
			
			if (cnt == 1) {
				map.put("message", "새 댓글이 등록되었습니다.");			
			} else {
				map.put("message", "새 댓글이 등록되지 않았습니다.");
			} 
			return map;
		}
}
