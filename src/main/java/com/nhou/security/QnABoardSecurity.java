package com.nhou.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nhou.domain.qna.QnADto;
import com.nhou.mapper.qna.QnAMapper;

@Component
public class QnABoardSecurity {
	
	@Autowired
	private QnAMapper qnaMapper;
	
	//문의 게시물 권한 체크
	//로그인된 아이디랑 작성자 아이디 같으면 수정 가능
	public boolean checkWriter(String username, int qnaId) {
		QnADto qna = qnaMapper.getByQnAId(qnaId);
		
		return qna.getMember_userId().equals(username);
		
	}
}
