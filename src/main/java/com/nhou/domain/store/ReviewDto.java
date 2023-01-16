package com.nhou.domain.store;

import lombok.Data;

@Data
public class ReviewDto {
	
	private int productReplyId;
	private int product_productId;
	private int member_userId;
	private String writer;
	private String content;
	private int star;
//	private int member_userId;
	private String writer;
	private String content;
//	private int star;


}
