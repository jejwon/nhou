package com.nhou.domain.cart;

import lombok.Data;

@Data
public class CartDto {

	//cart
	private int cartId;
	private int product_productId;
	private String member_userId;
	private int count;

	//product
	private String productName;
	private String color;
	private String size;
	private int price;
	private int stock;
	
	//추가
	private int totalPrice;
}
