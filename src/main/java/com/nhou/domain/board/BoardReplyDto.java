package com.nhou.domain.board;


import java.time.LocalDateTime;
import java.time.Period;
import java.time.temporal.ChronoUnit;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

// 댓글에 필요한 엘레멘트
@Data
public class BoardReplyDto {
	private int boardReplyId;
	private String content;
	private String member_userId;
	private int board_boardId;
	private String nickName;
	
	private boolean editable; // 작성자 == 현재 로그인계정 확인하여 수정/삭제 판별
	
	// 댓글 작성시간
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime insertDatetime;
	
	// 댓글 입력시간 변경
		public String getAgo() {
			LocalDateTime now = LocalDateTime.now(); // 현재시간
			LocalDateTime oneDayBefore = now.minusDays(1); // 현재로부터 하루전
			LocalDateTime oneMonthBefore = now.minusMonths(1); // 한달전
			LocalDateTime oneYearBefore = now.minusYears(1); // 일년전
			String result = "";

			// 댓글작성시간과 현재시간이
			// 하루 차이일 경우 시간출력
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
