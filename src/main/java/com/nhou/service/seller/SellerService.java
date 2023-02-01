package com.nhou.service.seller;

import java.util.List;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.order.OrderDto;
import com.nhou.domain.order.OrderItemDto;
import com.nhou.domain.seller.SellerDto;
import com.nhou.domain.seller.SellerPageInfo;
import com.nhou.domain.store.StoreDto;

public interface SellerService {

	// 판매상품 리스트
	public List<StoreDto> getProductList(StoreDto store);

	// 판매 리스트
	public List<OrderDto> getOrderList(OrderDto order);

	// 배송상태 수정
	public int update(OrderDto order);

	// 주문 상세 가져오기
	public List<OrderDto> get(int orderId, String member_userId);

}
