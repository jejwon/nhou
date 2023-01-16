package com.nhou.mapper.store;

import java.util.List;

import com.nhou.domain.store.ReviewDto;

public interface StoreReviewMapper {

	int insert(ReviewDto review);

	List<ReviewDto> selectReviewByproduct_productId(int product_productId);

	int deleteByproductReplyId(int productReplyId);

	ReviewDto selectById(int productReplyId);

	int update(ReviewDto review);

	int deleteByReviewId(int product_productId);


}
