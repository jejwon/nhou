package com.nhou.domain.store;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class StoreDto {
	private int productId;
	private int productInfoId;
	private int productFileId;
	private int productReplyId;
	private int categoryId;
	private String productName;
	private String productImage;
	private List<String> productFileName;
	private String categoryName;
	private String productContents;  //DB에 새로 생성
	private String color;
	private String size;
	private int price;
	private int stock;
	private int star;
	
	private String member_userId;
	private String nickName;
	private String userId;
	private int orderStatus; // 0 주문완료 / 1 배송대기 / 2 배송완료
	
	private int productCategory_categoryId;
	private LocalDateTime insertDatetime;
	
}
