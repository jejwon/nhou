package com.nhou.mapper.seller;

import java.util.List;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.seller.SellerDto;

public interface SellerMapper {

	// 주문 리스트
	List<SellerDto> selectSellerList(String s, int orderStatus);
}
