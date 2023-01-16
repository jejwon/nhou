package com.nhou.domain.seller;

import java.time.LocalDateTime;
import java.util.List;

import org.joda.time.DateTime;

import com.nhou.domain.member.MemberDto;

import lombok.Data;

@Data
public class SellerDto {

	private String member_userId;
	private int productId;
	private String productName;
	private int orderDetaileId;
	private int orderList_orderListId;
	private int orderListId;
	private int orderStatus;
	private DateTime orderDate;
	private int cartId;
	private int count;
	private String size;
	private String color;
	private LocalDateTime insertDatetime;
	
	private String userId;
	
	// 회원정보 가져오기
	private List<MemberDto> sellerByUserList;
}
