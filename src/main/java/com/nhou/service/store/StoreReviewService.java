package com.nhou.service.store;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhou.domain.store.ReviewDto;
import com.nhou.mapper.store.StoreReviewMapper;


@Service
public class StoreReviewService {
	
	@Autowired
	private StoreReviewMapper mapper;
	
	public void addReview(ReviewDto review) {
		mapper.insert(review);
	}

}
