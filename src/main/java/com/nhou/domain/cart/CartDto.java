package com.nhou.domain.cart;

import lombok.Data;

@Data
public class CartDto {

	//cart
	private int cartId;
	private int product_productId;
	private String member_userId;
	private int count;
	private int sum;

	//product
	private String productName;

	private int price;
	private int stock;
	
	private String option;
	
	//추가
	private int totalPrice;
	
	
	/*
	 * @Override public String toString() { return "cartDto [userId=" +
	 * member_userId + ", productId=" + product_productId + ", productName=" +
	 * productName + ", color=" + color + "]"; }
	 */
}
