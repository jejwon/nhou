package com.nhou.domain.board;


import java.time.LocalDateTime;

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
	
	// 댓글 작성시간
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime insertDatetime;
	
}
