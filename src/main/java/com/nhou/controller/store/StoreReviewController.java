package com.nhou.controller.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhou.domain.store.ReviewDto;
import com.nhou.service.store.StoreReviewService;

@Controller
@RequestMapping("review")
public class StoreReviewController {

		@Autowired
		private StoreReviewService service;
	
		@PostMapping("readd")
		public void add(@RequestBody ReviewDto review) {
			// System.out.println(review);
			
			service.addReview(review);
		}
}
