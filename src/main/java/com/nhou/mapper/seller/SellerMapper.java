package com.nhou.mapper.seller;

import java.util.List;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.order.OrderDto;
import com.nhou.domain.order.OrderItemDto;
import com.nhou.domain.seller.SellerDto;
import com.nhou.domain.store.StoreDto;

public interface SellerMapper {

	// 판매물품 리스트
	List<StoreDto> getProductList(StoreDto store);

	// 판매현황 리스트
	List<OrderDto> getOrderList(OrderDto order);

	// 배송상태 수정
	int update(OrderDto order);



}
