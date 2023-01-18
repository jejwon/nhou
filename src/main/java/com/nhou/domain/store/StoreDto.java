package com.nhou.domain.store;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

import lombok.Data;

@Data
public class StoreDto {
	private int productId;
	private int productInfoId;
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
	
	private String member_userId;
	private String nickName;
	private String userId;
	private int orderStatus; // 0 주문완료 / 1 배송대기 / 2 배송완료
	
	private int productCategory_categoryId;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private LocalDateTime insertDatetime;
	
}
