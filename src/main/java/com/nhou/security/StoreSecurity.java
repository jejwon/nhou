package com.nhou.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nhou.domain.store.StoreDto;
import com.nhou.mapper.store.StoreMapper;

@Component
public class StoreSecurity {
	
	@Autowired
	private StoreMapper mapper;
	
	public boolean checkUserId(String username, int productId) {
		StoreDto store = mapper.select(productId);
		
		return store.getMember_userId().equals(username);
	}
}
