package com.nhou.domain.qna;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

import lombok.Data;

@Data
public class QnAReplyDto {
	private int qnaReplyId;
	private String content;
	private String writer;
	private int qna_qnaId;
	
	//@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	@JsonFormat(shape = Shape.STRING)
	private LocalDateTime insertDatetime; //댓글 fetch 리스트 유지하기 -> stringify 형식변환!!	
}
