package com.nhou.domain.main;

import java.time.LocalDateTime;
import java.util.List;

import com.nhou.domain.store.StoreDto;

import lombok.Data;

@Data
public class MainDto {
	private int productId;
	private int productCategory_CategoryId;
	private String categoryName;
	private String productName;
	private int price;
	private int categoryId;
	private String member_userId;
	private String color;
	private String size;
	private LocalDateTime insertDatetime;
	
	private List<StoreDto> categoryMainList;
}
