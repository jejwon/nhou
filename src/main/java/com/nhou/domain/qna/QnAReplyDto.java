package com.nhou.domain.qna;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

@Data
public class QnAReplyDto {
	public int qnaReplyId;
	public String content;
	public String writer;
	public int qna_qnaId;
	
	@JsonFormat(shape = Shape.STRING)
	public LocalDateTime insertDatetime; //댓글 fetch 리스트 유지하기 -> stringify 형식변환!!
	
}
