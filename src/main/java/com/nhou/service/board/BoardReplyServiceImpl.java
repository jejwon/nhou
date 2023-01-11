package com.nhou.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhou.domain.board.BoardReplyDto;
import com.nhou.mapper.board.BoardReplyMapper;

@Service
public class BoardReplyServiceImpl implements BoardReplyService {

	@Autowired
	BoardReplyMapper boardReplyMapper;
	
	// 댓글 작성하기
	@Override
	public int addReply(BoardReplyDto reply) {
		return boardReplyMapper.insert(reply); // mapper로
	}
	
	// 댓글 삭제하기
	@Override
	public int deleteById(int boardReplyId) {
		return boardReplyMapper.deleteById(boardReplyId);
	}
	
	// 댓글 리스트
	@Override
	public List<BoardReplyDto> listReplyByBoardId(int board_boardId, String username) {
		return boardReplyMapper.listReplyByBoardId(board_boardId, username);
	}
	
	// 댓글 가져오기
	@Override
	public BoardReplyDto getById(int boardReplyId) {
		return boardReplyMapper.selectById(boardReplyId);
	}
	
	// 댓글 수정하기
	@Override
	public int modify(BoardReplyDto reply) {
		return boardReplyMapper.update(reply);
	}
}
