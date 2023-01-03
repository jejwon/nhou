package com.nhou.domain.qna;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class QnAReplyDto {
	public int qnaReplyId;
	public String content;
	public String writer;
	public LocalDateTime insertDatetime;
	public int qna_qnaId;
}
