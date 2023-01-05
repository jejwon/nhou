package com.nhou.domain.store;

import lombok.Data;

@Data
public class StoreDto {
	private int id;
	private String categoryName;
	private String productName;
	private String productFileImage;
	private String product_content;  //DB에 새로 생성
	private int price;
	private int stock;
}
