package com.nhou.mapper.cart;


import java.security.Principal;
import java.util.List;

import org.springframework.ui.Model;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.order.OrderDto;
import com.nhou.domain.order.OrderItemDto;

public interface CartMapper {

	int insert(CartDto cart);

	int delete(int cartId);

	int update(CartDto cart);

	CartDto getByCartId(int cartId);

	List<CartDto> list(String member_userId);

	int payInsert(OrderDto order);

	int orderItemInsert(OrderItemDto orderItem);
	
	OrderDto getOrderInfo(OrderDto order);
}
