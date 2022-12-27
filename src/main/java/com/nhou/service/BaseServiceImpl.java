package com.nhou.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhou.mapper.BaseMapper;

@Service
public class BaseServiceImpl implements BaseService{
	@Autowired
	private BaseMapper mapper;
	
	@Override
	public int base() {
		return 1;
	}
}
