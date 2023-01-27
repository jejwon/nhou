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
	private int productInfoId;
	private int productFileId;
	private int productReplyId;
	private int categoryId;
	private String productName;
	private String productImage;
	private List<String> productFileName;
	private String categoryName;
	private String color;
	private String size;
	private String chooseOption;
	private int price;
	private int stock;
	private int star;
	
	private String content;
	
	private String member_userId;
	private String nickName;
	private String userId;
	private int orderStatus; 
	
	private int productCategory_categoryId;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd")
	private LocalDateTime insertDatetime;
	
}
