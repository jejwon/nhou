package com.nhou.domain.board;

import java.time.LocalDateTime;
import java.time.Period;
import java.time.temporal.ChronoUnit;
import java.util.List;

import lombok.Data;

// 화면에서 보여줄 엘리멘트
@Data
public class BoardDto {
	private int boardId;
	private int boardCategory;
	private String title;
	private String content;
	private LocalDateTime insertDatetime;
	private String member_userId;
	private int likeCount;
	private int replyCount;
	private int viewCount;
	private String nickName;
	
	// 여러 파일명을 담기 위해 리스트로
	private List<String> boardFileName;
	private int countFile;
	private boolean liked;
	
	// 게시물 입력시간 변경
		public String getAgo() {
			LocalDateTime now = LocalDateTime.now(); // 현재시간
			LocalDateTime oneDayBefore = now.minusDays(1); // 현재로부터 하루전
			LocalDateTime oneMonthBefore = now.minusMonths(1); // 한달전
			LocalDateTime oneYearBefore = now.minusYears(1); // 일년전
			String result = "";
			
		
			// 게시물 작성시간과 현재시간이
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
