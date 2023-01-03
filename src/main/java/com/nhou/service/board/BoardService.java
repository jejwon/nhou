package com.nhou.service.board;

import java.util.List;

import com.nhou.domain.board.BoardDto;

public interface BoardService {

	// 글 리스트(controller에서 가져옴)
	/*
	 * List<BoardDto> listBoard(int page, String type, String keyword, String
	 * category, PageInfo pageInfo);
	 */
	
	// 게시글 작성하기
	public int insert(BoardDto board);

	// 게시물 리스트
	public List<BoardDto> listBoard();

	// 게시물 가져와서 보기
	public BoardDto get(int boardId);

	// 게시글 수정하기
	public int update(BoardDto board);

	// 게시글 삭제하기
	public int remove(int boardId);
}
