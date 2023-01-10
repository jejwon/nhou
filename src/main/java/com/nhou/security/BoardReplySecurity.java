package com.nhou.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nhou.domain.board.BoardReplyDto;
import com.nhou.mapper.board.BoardReplyMapper;

@Component
public class BoardReplySecurity {

	@Autowired
	private BoardReplyMapper boardReplyMapper;
	
	// 댓글 권한체크
	public boolean checkUserId(String userName, int boardReplyId) {
		BoardReplyDto reply = boardReplyMapper.selectById(boardReplyId);
		
		return reply.getMember_userId().equals(userName);
	}
}
