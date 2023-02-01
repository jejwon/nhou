package com.nhou.domain.order;

import java.time.LocalDateTime;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
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
	private String productName;
	private int productId;

	//orderItem
	private int orderItemId;
	//private LocalDateTime orderDate;
	private int product_productId;
	private int count;
	private int itemPrice;
	private String selectOption;
	private int nhou_order_orderId;
	
	private String userName;
	
}
