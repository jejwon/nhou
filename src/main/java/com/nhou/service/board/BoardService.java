package com.nhou.service.board;

import java.util.List;

import com.nhou.domain.board.BoardDto;
import com.nhou.domain.board.PageInfo;

public interface BoardService {

	// 글 리스트(controller에서 가져옴)
	/*
	 * List<BoardDto> listBoard(int page, String type, String keyword, String
	 * category, PageInfo pageInfo);
	 */
	
	// 게시글 작성하기
	public int insert(BoardDto board);


}
