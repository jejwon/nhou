package com.nhou.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhou.domain.board.BoardDto;
import com.nhou.domain.board.PageInfo;
import com.nhou.mapper.board.BoardMapper;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	// 게시글 작성
	@Override
	public int insert(BoardDto board) {
		
		return boardMapper.insert(board); // 매퍼로 보냄
	}
	
	// 게시글 목록
	@Override
	public List<BoardDto> listBoard() { // service에 사용한 명명
		return boardMapper.list();		// mapper에서 사용할 명명
	}
	
	// 게시물 가져와서 보기
	@Override
	public BoardDto get(int boardId) {		// service에 사용한 명명
		return boardMapper.select(boardId); // mapper에서 사용할 명명
	}
	
	// 가져온 게시물 수정하고 등록하기
	@Override
	public int update(BoardDto board) { 	// service에 사용한 명명
		return boardMapper.update(board);	// mapper에서 사용할 명명
	}
	
	// 게시물 삭제하기
	@Override
	public int remove(int boardId) {		// service에 사용한 명명
		return boardMapper.delete(boardId); // mapper에서 사용할 명명
	}
 }
