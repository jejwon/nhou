package com.nhou.service.main;

import java.util.List;

import com.nhou.domain.main.CategoryDto;
import com.nhou.domain.main.MainDto;
import com.nhou.domain.store.StoreDto;

public interface MainService {

	public List<StoreDto> listBoard();

	public List<CategoryDto> cateList();

	public List<MainDto> listByCategoryId(int productCategory_categoryId);

	// 메인 리스트
	//public List<StoreDto> listBoard();

	// 카테고리 리스트
	//public List<CategoryDto> cateList();
	
	// 상품 총 개수
	//public int productCount();
}
