package com.nhou.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nhou.domain.store.ReviewDto;
import com.nhou.domain.store.StoreDto;
import com.nhou.mapper.store.StoreMapper;
import com.nhou.mapper.store.StoreReviewMapper;

@Component
public class StoreReviewSecurity {
	
	@Autowired
	private StoreReviewMapper storeReviewMapper;
	
	public boolean checkWriter(String userName, int productReplyId) {
		ReviewDto review = storeReviewMapper.selectById(productReplyId);
		
		return review.getMember_userId().equals(userName);
	}
}
