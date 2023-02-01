package com.nhou.mapper.store;

import java.util.List;

import com.nhou.domain.store.ReviewDto;

public interface StoreReviewMapper {
	
	int insert(ReviewDto review); 

	List<ReviewDto> selectReviewByproduct_productId(int product_productId, String username);

	int deleteByproductReplyId(int productReplyId);

	ReviewDto selectById(int productReplyId);

	int update(ReviewDto review);

	int deleteByReviewId(int product_productId);
	
	int deleteByMemberId(String member_userId);

	/* 평점 구하기
	public Double getStarAvg(int productId);
	
	public int updateStarAvg(AvgDto avg); */
}
