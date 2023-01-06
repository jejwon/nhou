package com.nhou.mapper.qna;

import java.util.List;

import com.nhou.domain.qna.QnAReplyDto;

public interface QnAReplyMapper {

	int insert(QnAReplyDto qnaReply);

	List<QnAReplyDto> list(int qna_qnaId);

	QnAReplyDto get(int qnaReplyId);

	int delete(int qnaReplyId);

}
