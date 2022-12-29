package com.nhou.domain.member;

import java.time.LocalDateTime;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	private String phone;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthDate;
	private int auth; //admin: 0/ user: 1/ seller: 2

	private LocalDateTime insertDatetime;
}