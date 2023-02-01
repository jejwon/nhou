package com.nhou.domain.store;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;


import lombok.Data;

@Data
public class StoreDto {
	private int productId;
	private String productName;
	private String productImage;
	private String productContent;
	private int price;
	private int stock;
	
	private int productFileId;
	private int product_productId;
	private List<String> productFileName;

	private int productReplyId;
	private int reviewCount; // 댓글 수
	private int star;
	
	private String member_userId;
	private String nickName;
	private String userId;
	private int orderStatus; // 0 주문완료 / 1 배송대기 / 2 배송완료
	
	private int productCategory_categoryId;
	private int categoryId;
	private String categoryName;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private LocalDateTime insertDatetime;
	
}
