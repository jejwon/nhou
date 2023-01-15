package com.nhou.mapper.store;

import java.util.List;

import com.nhou.domain.store.ReviewDto;

public interface StoreReviewMapper {

	int insert(ReviewDto review);

	List<ReviewDto> selectReviewByproduct_productId(int product_productId);


}
