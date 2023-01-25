package com.nhou.service.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.order.OrderDto;
import com.nhou.mapper.cart.CartMapper;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int insert(CartDto cart) {
		return cartMapper.insert(cart);
	}
	
	@Override
	public int delete(int cartId) {
		return cartMapper.delete(cartId);
	}
	
	@Override
	public int update(CartDto cart) {
		return cartMapper.update(cart);
	}
	
	@Override
	public CartDto getByCartId(int cartId) {
		return cartMapper.getByCartId(cartId);
	}
	
	@Override
	public List<CartDto> list(String member_userId) {
		return cartMapper.list(member_userId);
	}
	
	@Override
	public int payInsert(OrderDto order) {
		return cartMapper.payInsert(order);
	}
}
