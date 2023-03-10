package com.nhou.domain.member;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.format.annotation.DateTimeFormat;

import com.nhou.domain.store.StoreDto;

import lombok.Data;
//JPA entity annotation 설정
@EntityScan
@Data
public class MemberDto {
//member 테이블의 컬럼들

	private String userId;
	private String userName;
	private String password;
	private String email;
	private String nickName;
	private String address1;
	private String address2;
	private String postal;
	private String phone;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthDate;
	private int auth; //admin: 0/ user: 1/ seller: 2/ user+black: 8/ seller + black: 9
	
	private String role; //ROLE_USER, ROLE_ADMIN

	private LocalDateTime insertDatetime;
	
	// product 리스트 보기
	private List<StoreDto> userSellList;
}
