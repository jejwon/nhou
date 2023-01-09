package com.nhou.domain.qna;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class QnADto {
	
	public int qnaId;
	public int qnaCategory;
	public int status;
	
	public String title;
	public String content;
	
	public String writer;
	public String member_userId;
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	public LocalDateTime insertDatetime;
	
	
	
	public String nickName;
}
