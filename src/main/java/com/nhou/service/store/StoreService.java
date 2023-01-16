package com.nhou.service.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhou.domain.store.StoreDto;
import com.nhou.mapper.store.StoreMapper;
import com.nhou.mapper.store.StoreReviewMapper;


@Service
public class StoreService {

	@Autowired
	private StoreMapper storeMapper;
	
	@Autowired
	private StoreReviewMapper storeReviewMapper;
	
	
	public int register(StoreDto store) {	
		return storeMapper.insert(store);
//		System.out.println("service =============> "+store);
	}


	public List<StoreDto> listStore() {
		return storeMapper.list(); 	
	}


	public StoreDto get(int productId) {
		return storeMapper.select(productId);
	}


	public int update(StoreDto store) {
		return storeMapper.update(store);
		
	}


	public int remove(int productId) {
		// 게시물의 댓글들 지우기
		storeReviewMapper.deleteByReviewId(productId);
		
		//게시물 지우기
		return storeMapper.delete(productId);
		
	}


}
