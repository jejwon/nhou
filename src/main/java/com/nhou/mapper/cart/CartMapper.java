package com.nhou.mapper.cart;


import java.util.List;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.order.OrderDto;

public interface CartMapper {

	int insert(CartDto cart);

	int delete(int cartId);

	int update(CartDto cart);

	CartDto getByCartId(int cartId);

	List<CartDto> list(String member_userId);

	int payInsert(OrderDto order);
}
