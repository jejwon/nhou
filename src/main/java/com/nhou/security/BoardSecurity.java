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
	public boolean checkWriter(String username, int boardId) { // 호출하기위해 이 두개의 파라미터를 가져와야함
		BoardDto board = boardMapper.select(boardId); // 게시물을 얻어와서
		
		return board.getMember_userId().equals(username); // 얻어온 id와 비교
		
	}
}
