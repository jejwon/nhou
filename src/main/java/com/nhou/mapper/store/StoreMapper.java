package com.nhou.mapper.store;

import java.util.List;

import com.nhou.domain.main.CategoryDto;
import com.nhou.domain.store.StoreDto;

public interface StoreMapper {
		
	int insert(StoreDto store);
	
	/*
	 * int insertFile(StoreDto store);
	 * 
	 * int insertCategory(StoreDto store);
	 * 
	 * int insertInfo(StoreDto store);
	 */

	List<StoreDto> list();

	StoreDto select(int productId);

	int update(StoreDto store);

	int delete(int productId);

	// 카테고리
	public List<CategoryDto> cateList();

	public int getTotal();

	int insertFile(int product_productId, String productImage);
	
	int insertFile2(int product_productId, String productFileName);



}
