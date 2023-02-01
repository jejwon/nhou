package com.nhou.service.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.nhou.domain.store.ReviewDto;
import com.nhou.mapper.store.StoreReviewMapper;


@Service
public class StoreReviewService {
	
	@Autowired
	private StoreReviewMapper storeReviewMapper;
	
	public int addReview(ReviewDto review) {
		
		return storeReviewMapper.insert(review);		
	}

	public List<ReviewDto> listReviewByproduct_productId(int product_productId, String username) {
		
		return storeReviewMapper.selectReviewByproduct_productId(product_productId, username);
	}

	public int removeByproductReplyId(int productReplyId) {
	
		return storeReviewMapper.deleteByproductReplyId(productReplyId);		
	}

	public ReviewDto getById(int productReplyId) {
	
		return storeReviewMapper.selectById(productReplyId);
	}

	public int modify(ReviewDto review) {
		
		return storeReviewMapper.update(review);
	}
}
