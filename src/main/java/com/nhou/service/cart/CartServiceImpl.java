package com.nhou.service.cart;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.nhou.domain.cart.CartDto;

import com.nhou.domain.member.MemberDto;
import com.nhou.domain.order.OrderDto;
import com.nhou.domain.order.OrderItemDto;

import com.nhou.domain.order.OrderDto;

import com.nhou.mapper.cart.CartMapper;
import com.nhou.mapper.member.MemberMapper;

@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	
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
	public OrderDto getOrderInfo(OrderDto order) {
		return cartMapper.getOrderInfo(order);
	}
	//주문 
	
	@Override
	public int payInsert(OrderDto order) {	
		
		return cartMapper.payInsert(order);
	}
	
	
	@Override
	public int orderItemInsert(OrderItemDto orderItem) {
		return cartMapper.orderItemInsert(orderItem);
	}

	
}
