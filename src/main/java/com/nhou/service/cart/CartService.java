package com.nhou.service.cart;


import java.util.List;

import com.nhou.domain.cart.CartDto;

public interface CartService {
	
	int insert(CartDto cart);

	int delete(int cartId);

	int update(CartDto cart);

	CartDto getByCartId(int cartId);

	List<CartDto> list(String member_userId);


}
