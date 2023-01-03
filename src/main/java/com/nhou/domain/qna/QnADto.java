package com.nhou.domain.qna;

import java.time.LocalDateTime;

import com.nhou.domain.member.MemberDto;

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
	
	public LocalDateTime insertDatetime;
	
	public String nickName;
}
