package com.nhou.service.qna;

import java.util.List;

import com.nhou.domain.qna.QnAReplyDto;

public interface QnAReplyService {

	int insertReply(QnAReplyDto qnaReply);

	List<QnAReplyDto> listReplyByQnAId(int qnaId);

	QnAReplyDto getByQnAReplyId(int qnaReplyId);

	int deleteByQnAReplyId(int qnaReplyId);

}
