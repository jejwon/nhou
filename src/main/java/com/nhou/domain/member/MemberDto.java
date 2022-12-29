package com.nhou.domain.member;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class MemberDto {
//member 테이블의 컬럼들

	private String userId;
	private String userName;
	private String password;
	private String email;
	private String nickName;
	private String address;
	private String auth;
	
	private int birthDate;
	private int phone;

	private String insertDatetime;
}
