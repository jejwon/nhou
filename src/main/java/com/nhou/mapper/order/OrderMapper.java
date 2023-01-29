package com.nhou.mapper.order;

import java.util.List;

import com.nhou.domain.order.OrderDto;

public interface OrderMapper {

	public List<OrderDto> select();

	public OrderDto getInfo(int sA);

	public int insertRes(int orderId, String userId);

}
