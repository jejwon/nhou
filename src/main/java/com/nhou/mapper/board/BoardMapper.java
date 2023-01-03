package com.nhou.mapper.board;

import java.util.List;

import com.nhou.domain.board.BoardDto;

public interface BoardMapper {
	
	// 게시글 작성하기
	int insert(BoardDto board);

	// 게시글 리스트
	List<BoardDto> list();

	// 게시글 선택해서 보기
	BoardDto select(int boardId);

	// 수정한 게시글 다시 등록하기 > xml id값
	int update(BoardDto board);

	// 게시글 삭제하기
	int delete(int boardId);

	// 페이지네이션 페이지 갯수
	/* int countAll(String type, String string); */

	// 페이지네이션 보여줄 요소들 list에 담기
	/*
	 * List<BoardDto> list(int offset, int records, String type, String keyword,
	 * String category);
	 */

}
