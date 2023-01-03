package com.nhou.service.qna;

import java.util.List;

import com.nhou.domain.qna.QnADto;

public interface QnAService {

	public int insert(QnADto qna);

	public List<QnADto> list();

	public QnADto getByQnAId(int qnaId);

	public int delete(int qnaId);
	
	
}
