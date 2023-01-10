package com.nhou.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nhou.domain.qna.QnAReplyDto;
import com.nhou.mapper.qna.QnAReplyMapper;

@Component
public class QnAReplySecurity {
	@Autowired
	QnAReplyMapper qnaReplyMapper;
	
	//문의 답변 권한 체크
	//로그인된 아이디랑 작성자 아이디 같으면 수정 가능
	public boolean checkWriter(String username, int qnaReplyId) {
		QnAReplyDto qnaReply = qnaReplyMapper.get(qnaReplyId);
		
		return qnaReply.getWriter().equals(username);
	}
}
