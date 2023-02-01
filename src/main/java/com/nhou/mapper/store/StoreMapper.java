package com.nhou.mapper.store;

import java.util.List;

import com.nhou.domain.store.Criteria;
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

	StoreDto select(int productId);

	int update(StoreDto store);

	int delete(int productId);

	int getTotal();

	int insertFile(int product_productId, String productImage);
	
	int insertFile2(int product_productId, String productFileName);

	int deleteFileByStoreId(int productId);

	int deleteFileByStoreIdAndFileName(int product_productId, String productFileName);
	
	// 닉네임 정보 불러오기
	String selectNick(String userId);

	// 리스트 + 페이지네이션
	List<StoreDto> list();
	List<StoreDto> getListWithPaging(Criteria cri, int offset, int records, String category);
	
	// 페이징 총 갯수
	int getTotalCount(Criteria cri, int productId);


}
