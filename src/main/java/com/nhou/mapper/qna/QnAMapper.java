package com.nhou.mapper.qna;

import java.util.List;

import com.nhou.domain.qna.QnADto;

public interface QnAMapper {

	int insert(QnADto qna);

	List<QnADto> list();

	QnADto getByQnAId(int qnaId);

	int delete(int qnaId);

}
