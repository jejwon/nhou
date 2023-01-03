package com.nhou.mapper.board;

import java.util.List;

import com.nhou.domain.board.BoardDto;

public interface BoardMapper {
	
	// 게시글 작성하기
	int insert(BoardDto board);

	// 페이지네이션 페이지 갯수
	/* int countAll(String type, String string); */

	// 페이지네이션 보여줄 요소들 list에 담기
	/*
	 * List<BoardDto> list(int offset, int records, String type, String keyword,
	 * String category);
	 */

}
