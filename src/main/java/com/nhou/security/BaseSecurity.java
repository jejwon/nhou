package com.nhou.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nhou.mapper.BaseMapper;

@Component
public class BaseSecurity {
	@Autowired
	private BaseMapper mapper;
	
	
}
