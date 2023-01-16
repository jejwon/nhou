package com.nhou.service.seller;

import java.util.List;

import com.nhou.domain.seller.SellerDto;
import com.nhou.domain.seller.SellerPageInfo;

public interface SellerService {

	// 회원들 주문목록
	public List<SellerDto> listBoard(int page, String type, String keyword, SellerPageInfo pageInfo);

}
