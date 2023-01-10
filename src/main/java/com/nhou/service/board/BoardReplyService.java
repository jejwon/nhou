package com.nhou.service.board;

import java.util.List;

import com.nhou.domain.board.BoardReplyDto;

public interface BoardReplyService {

	// 댓글 작성하기
	public int addReply(BoardReplyDto reply);

	// 댓글 리스트 불러오기
	public List<BoardReplyDto> listReplyByBoardId(int board_boardId, String userName);

	// 댓글 삭제하기
	public int deleteById(int boardReplyId);

	// 댓글 불러오기
	public BoardReplyDto getById(int boardReplyId);

	// 댓글 수정하기
	public int modify(BoardReplyDto reply);

}
