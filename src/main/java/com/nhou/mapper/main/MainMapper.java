package com.nhou.mapper.main;

import java.util.List;

import com.nhou.domain.main.MainDto;
import com.nhou.domain.store.StoreDto;

public interface MainMapper {

	// 메인 상품 리스트
	public List<StoreDto> list();

	// 상품 총 개수
	public int getTotal();

}
