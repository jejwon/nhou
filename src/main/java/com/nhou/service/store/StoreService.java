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
	
	public void register(StoreDto store) {
		mapper.insert(store);
	//	System.out.println("service =============> "+store);
	}

	public List<StoreDto> listStore() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

}
