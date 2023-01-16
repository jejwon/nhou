package com.nhou.controller.store;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nhou.domain.store.ReviewDto;
import com.nhou.service.store.StoreReviewService;

@Controller
@RequestMapping("storeReview")
public class StoreReviewController {

		@Autowired
		private StoreReviewService service;
		
		@PutMapping("modify")
		@ResponseBody
		public Map<String, Object> modify(@RequestBody ReviewDto review) {
			Map<String, Object> map = new HashMap<>();
			
			int cnt = service.modify(review);
			if (cnt == 1) {
				map.put("message", "댓글이 수정되었습니다.");
			} else {
				map.put("message", "댓글이 수정되지 않았습니다.");
			}
			
			return map;
		}
		
		@GetMapping("get/{productReplyId}")
		@ResponseBody
		public ReviewDto get(@PathVariable int productReplyId) {
			return service.getById(productReplyId);
		}
		
		@DeleteMapping("remove/{productReplyId}")
		@ResponseBody
		public Map<String, Object> remove (@PathVariable int productReplyId) {
			Map<String, Object> map = new HashMap<>();
			
			int cnt = service.removeByproductReplyId(productReplyId);
			if (cnt == 1) {
				map.put("message", "댓글이 삭제되었습니다.");
			} else {
				map.put("message", "댓글이 삭제되지 않았습니다.");
			}
			return map;
		}
		
		@GetMapping("list/{product_productId}")
		@ResponseBody
		public List<ReviewDto> list(@PathVariable int product_productId) {
			return service.listReviewByproduct_productId(product_productId);
		}
		
	
		@PostMapping("add")
		@ResponseBody
		public Map<String, Object> add(@RequestBody ReviewDto review) {
		//	System.out.println(review);
			Map<String, Object> map = new HashMap<>();
			
			int cnt = service.addReview(review);
			if (cnt == 1) {
				map.put("message", "새 댓글이 등록되었습니다.");			
			} else {
				map.put("message", "새 댓글이 등록되지 않았습니다.");
			} 
			return map;
		}
}
