package com.nhou.mapper.seller;

import java.util.List;

import com.nhou.domain.seller.SellerDto;

public interface SellerMapper {

	// 회원 주문리스트 + 페이징 처리
	List<SellerDto> list(int offset, int records, String type, String keyword);

	// 회원들 주문목록 전체 카운트
	int countAll(String type, String keyword);
}
