package com.nhou.service.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.order.OrderDto;
import com.nhou.domain.seller.SellerDto;
import com.nhou.domain.seller.SellerPageInfo;
import com.nhou.domain.store.StoreDto;
import com.nhou.mapper.seller.SellerMapper;

@Service
@Transactional
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SellerMapper sellerMapper;
	
	@Override
	public List<StoreDto> getProductList(StoreDto store) {
		return sellerMapper.getProductList(store);
	}
	
	@Override
	public List<OrderDto> getOrderList(OrderDto order) {
		return sellerMapper.getOrderList(order);
	}
	
}
