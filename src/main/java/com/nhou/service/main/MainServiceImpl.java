package com.nhou.service.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhou.domain.main.CategoryDto;
import com.nhou.domain.main.MainDto;
import com.nhou.domain.store.StoreDto;
import com.nhou.mapper.main.MainMapper;
import com.nhou.mapper.store.StoreMapper;

@Service
@Transactional
public class MainServiceImpl implements MainService {

	@Autowired
	private MainMapper mainMapper;
	
	@Autowired
	private StoreMapper storeMapper;
	
	// 메인 상품 리스트
	@Override
	public List<StoreDto> listBoard() {
		return storeMapper.list();
	}
	
	// 카테고리 리스트
	@Override
	public List<CategoryDto> cateList() {
		return storeMapper.cateList();
	}
	
	// 상품 총 개수
	public int productCount() {
		return storeMapper.getTotal();
	}
	
	@Override
	public List<MainDto> listByCategoryId(int productCategory_categoryId) {
		return mainMapper.listByCategoryId(productCategory_categoryId);
	}
	
	/*
	 * @Override public List<StoreDto> listMainByCategoryId(int
	 * productCategory_categoryId) { return
	 * mainMapper.listMainByCategoryId(productCategory_categoryId); }
	 */
}
