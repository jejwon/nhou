package com.nhou.domain.order;

import java.time.LocalDateTime;

import java.util.List;


import lombok.Data;

@Data
public class OrderDto {
	//order
	private int orderId;
	private LocalDateTime orderDate;
	private String address1;
	private String address2;
	private String postal;
	private String receiverName;
	private String receiverPhone;
	private int payment;
	private String status;
	private String member_userId;
	

	
	private List<OrderItemDto> orders;

	//orderItem
	private int orderItemId;
	//private LocalDateTime orderDate;
	private int product_productId;
	private int count;
	private int itemPrice;
	private String selectOption;
	private int nhou_order_orderId;
	

	
}
