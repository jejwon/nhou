package com.nhou.domain.order;

import lombok.Data;

@Data
public class OrderItemDto {
	//orderItem
	private int orderItemId;
	//private LocalDateTime orderDate;
	private int product_productId;
	private int count;
	private int itemPrice;
	private String selectOption;
	private int nhou_order_orderId;
	
	private int orderId;
}
