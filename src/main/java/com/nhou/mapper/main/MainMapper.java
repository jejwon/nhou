package com.nhou.mapper.main;

import java.util.List;

import com.nhou.domain.main.CategoryDto;
import com.nhou.domain.main.MainDto;
import com.nhou.domain.store.StoreDto;

public interface MainMapper {

	// 메인 상품 리스트
	public List<StoreDto> list();

	// 카테고리 리스트
	public List<CategoryDto> cateList();

	// 상품 총 개수
	public int getTotal();

	public List<MainDto> listByCategoryId(int productCategory_categoryId);

}
