package com.nhou.domain.board;

import java.time.LocalDateTime;
import java.util.List;

import lombok.Data;

@Data
public class BoardDto {
	private int boardId;
	private int boardCategory;
	private String title;
	private String content;
	private LocalDateTime insertDatetime;
	private String member_userId;
	private int likeCount;
	private String wirter;
	private int replyCount;
	private int viewCount;
	private String nickName;
	
	private List<String> boardFileName;
	private int countFule;
	private boolean liked;
}
