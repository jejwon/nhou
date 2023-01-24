package com.nhou.service.seller;

import java.util.List;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.seller.SellerDto;
import com.nhou.domain.seller.SellerPageInfo;

public interface SellerService {

	// 주문 리스트
	public List<SellerDto> selectSellerList(String s);

}
