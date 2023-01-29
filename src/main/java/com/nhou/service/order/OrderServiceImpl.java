package com.nhou.service.order;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhou.domain.order.OrderDto;
import com.nhou.mapper.order.OrderMapper;

@Service
@Transactional
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public List<OrderDto> listOrder() {
		return orderMapper.select();
	}
	
	@Override
	public OrderDto getInfo(int sA) {
		return orderMapper.getInfo(sA);
	}
	
	@Override
	public int insertRes(int orderId, String userId) {
		return orderMapper.insertRes(orderId, userId);
	}
}
