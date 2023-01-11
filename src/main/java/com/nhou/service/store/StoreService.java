package com.nhou.service.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhou.domain.store.StoreDto;
import com.nhou.mapper.store.StoreMapper;


@Service
public class StoreService {

	@Autowired
	private StoreMapper mapper;
	
	public int register(StoreDto store) {	
		return mapper.insert(store);
//		System.out.println("service =============> "+store);
	}


	public List<StoreDto> listStore() {
		return mapper.list(); 	
	}


	public StoreDto get(int productId) {
		return mapper.select(productId);
	}


	public int update(StoreDto store) {
		return mapper.update(store);
		
	}


	public int remove(int productId) {
		return mapper.delete(productId);
		
	}


}
