package com.nhou.service.seller;

import java.util.List;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.order.OrderDto;
import com.nhou.domain.seller.SellerDto;
import com.nhou.domain.seller.SellerPageInfo;
import com.nhou.domain.store.StoreDto;

public interface SellerService {

	// 주문 리스트
	// public List<SellerDto> selectSellerList(String s);

	// 판매상품 리스트
	public List<StoreDto> getProductList(StoreDto store);

	// 판매현황 리스트
	public List<OrderDto> getOrderList(OrderDto order);

}
