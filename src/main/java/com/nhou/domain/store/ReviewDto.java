package com.nhou.domain.store;

import java.time.LocalDateTime;
import java.time.Period;
import java.time.temporal.ChronoUnit;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

@Data
public class ReviewDto {
	
	private int productReplyId;
	private int product_productId;
	private String member_userId;
	private String content;
	private int star;
	private String nickName;
	
	private boolean editable;
	
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime insertDatetime;
	
	// 댓글 작성일
	public String getAgo() {
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime oneDayBefore = now.minusDays(1); 
		LocalDateTime oneMonthBefore = now.minusMonths(1); 
		LocalDateTime oneYearBefore = now.minusYears(1); 
		
		String result = "";
		// 작성일과 현재가 
		
		// 하루 차이
		if(oneDayBefore.isBefore(insertDatetime)) {
			result = insertDatetime.toLocalTime().toString();

		// 1달 이내면 n일전
		} else if (oneMonthBefore.isBefore(insertDatetime)){
			result = Period.between(insertDatetime.toLocalDate(), now.toLocalDate())
					.getDays() + "일 전";

		// 1년 이내면 n달전
		}else if (oneYearBefore.isBefore(insertDatetime)){
			result = Period.between(insertDatetime.toLocalDate(), now.toLocalDate())
					.get(ChronoUnit.MONTHS) + "달 전";

		// n년전
		}else {
			result = Period.between(insertDatetime.toLocalDate(), now.toLocalDate())
					.getYears() + "년 전";
		}

		return result;
	}

}
