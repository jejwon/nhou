package com.nhou.service.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.nhou.domain.store.ReviewDto;
import com.nhou.mapper.store.StoreReviewMapper;


@Service
public class StoreReviewService {
	
	@Autowired
	private StoreReviewMapper mapper;
	
	public int addReview(ReviewDto review) {
		
		return mapper.insert(review);
		
	}

	public List<ReviewDto> listReviewByproduct_productId(int product_productId) {
		
		return mapper.selectReviewByproduct_productId(product_productId);
	}

	public int removeByproductReplyId(int productReplyId) {
	
		return mapper.deleteByproductReplyId(productReplyId);
		
	}

	public ReviewDto getById(int productReplyId) {
	
		return mapper.selectById(productReplyId);
	}

	public int modify(ReviewDto review) {
		
		return mapper.update(review);


	}
}
