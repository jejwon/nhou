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
	private int postal;
	private String receiverName;
	private String receiverPhone;
	private int payment;
	private String status;
	private String member_userId;
	
	
	private List<OrderItemDto> orders;
	
}
