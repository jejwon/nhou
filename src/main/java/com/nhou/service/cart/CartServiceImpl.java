package com.nhou.service.cart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhou.domain.cart.CartDetailDto;
import com.nhou.mapper.cart.CartMapper;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int insert(CartDetailDto cart) {
		return cartMapper.insert(cart);
	}
}
