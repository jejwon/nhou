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
	private int orderDetail_orderDetailId;
	private int orderList_orderListId;
	private int orderListId;
	private int orderStatus; // 0 주문완료 / 1 배송대기 / 2 배송중 / 3 배송완료
	private DateTime orderDate;
	private int cartId;
	private int count;
	private String size;
	private String color;
	private LocalDateTime insertDatetime;
	
	// 추가로 필요한 정보
	private int payment;
	private String receiverName;
	private String receiverPhone;
	private String address1;
	private String address2;
	
	private String userId;
	private int product_productId;
	
	
	// 회원정보 가져오기
	private List<MemberDto> sellerByUserList;
}
