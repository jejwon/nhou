package com.nhou.service.main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<StoreDto> list() {
		return mainMapper.list();
	}
	
	
	// 상품 총 개수
	public int productCount() {
		return storeMapper.getTotal();
	}
	
	
}
