package com.nhou.domain.order;

import org.springframework.stereotype.Component;

import lombok.Value;

@Component
public class IamportAPI {

	@org.springframework.beans.factory.annotation.Value("${iamport_api}")
	private String IAMPORT_API;
	
	@org.springframework.beans.factory.annotation.Value("${iamport_api_secret}")
	private String IAMPORT_API_SECRET;
	
	public String getApi() {
		return IAMPORT_API;
	}
	
	public String getApiSecret() {
		return IAMPORT_API_SECRET;
	}
}
