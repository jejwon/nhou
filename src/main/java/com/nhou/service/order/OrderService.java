package com.nhou.service.order;

import java.util.List;

import com.nhou.domain.order.OrderDto;

public interface OrderService {

	public List<OrderDto> listOrder();

	public OrderDto getInfo(int sA);

	public int insertRes(int orderId, String userId);

}
