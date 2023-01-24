package com.nhou.mapper.board;

import java.util.List;

import com.nhou.domain.board.BoardReplyDto;
import com.nhou.domain.member.MemberDto;

public interface BoardReplyMapper {

	// 댓글 작성하기
	int insert(BoardReplyDto reply);

	// 게시글에 달린 댓글 삭제하기(boardServiceImpl)
	int deleteByBoardId(int boardId);
	// 댓글 삭제하기(boardReplyServiceImpl)
	int deleteById(int boardReplyId);

	// 댓글 리스트
	List<BoardReplyDto> listReplyByBoardId(int board_boardId, String username);

	// 댓글 가져오기
	BoardReplyDto selectById(int boardReplyId);

	// 댓글 수정하기
	int update(BoardReplyDto reply);

	// 회원탈퇴하면서 댓글 삭제
	int deleteByMemberId(String member_userId);

	
	
	
	

}
