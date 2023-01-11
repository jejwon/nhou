package com.nhou.domain.qna;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QnADto {
	
	private int qnaId;
	private int qnaCategory;
	private int status;
	
	private String title;
	private String content;
	
	private String writer;
	private String member_userId;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private LocalDateTime insertDatetime;
	
	private String nickName;
	
	private int countReply;
}
