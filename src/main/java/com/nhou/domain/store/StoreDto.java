package com.nhou.domain.store;

import lombok.Data;

@Data
public class StoreDto {
	private int productId;
	private int productInfoId;
	private int product_productId;
	private int productFileId;
	private int productReplyId;
	private int categoryId;
	private String productName;
	private String productFileName;
	private String categoryName;
	private String productContents;  //DB에 새로 생성
	private String color;
	private String size;
	private int price;
	private int stock;
	private int star;
	
}
