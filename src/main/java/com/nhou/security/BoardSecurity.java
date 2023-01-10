package com.nhou.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.nhou.domain.board.BoardDto;
import com.nhou.mapper.board.BoardMapper;

@Component // 빈 만들기
public class BoardSecurity {

	@Autowired
	private BoardMapper boardMapper;
	
	// 로그인한 아이디 == 작성자 아이디 수정가능
	public boolean checkUserId(String userName, int boardId) {
		BoardDto board = boardMapper.select(boardId);
		
		return board.getMember_userId().equals(userName);
		
	}
}
