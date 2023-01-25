package com.nhou.service.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhou.domain.cart.CartDto;
import com.nhou.domain.seller.SellerDto;
import com.nhou.domain.seller.SellerPageInfo;
import com.nhou.mapper.seller.SellerMapper;

@Service
@Transactional
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SellerMapper sellerMapper;
	
	//회원들 주문목록
	@Override
	public List<SellerDto> selectSellerList(String s) {
		
		// 주문 상태 기능
		int orderStatus = 0;
		switch (s) {
		case "주문완료":
			orderStatus = 0;
			break;
		case "배송준비":
			orderStatus = 1;
			break;
		case "배송중":
			orderStatus = 2;
			break;
		case "배송완료":
			orderStatus = 3;
			break;
		}
		
		return sellerMapper.selectSellerList(s, orderStatus);
	}
}
