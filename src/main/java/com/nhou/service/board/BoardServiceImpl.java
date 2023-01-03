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
	
	@Override
	public int insert(BoardDto board) {
		
		return boardMapper.insert(board); // 매퍼로 보냄
	}
	
	
	
	
	
	// 게시글 목록
	// listBoard > BoardController에서 가져옴
	/*
	 * public List<BoardDto> listBoard(int page, String type, String keyword, String
	 * category, PageInfo pageInfo) { int records = 10; // 게시글 갯수 int offset = (page
	 * - 1) * records; // 어디서부터
	 * 
	 * int countAll = boardMapper.countAll(type, "%" + keyword + "%"); // 총 게시물 갯수
	 * int lastPage = (countAll - 1) / records + 1; // 마지막 페이지
	 * 
	 * // 5페이지씩 보이게 int leftPageNum = (page - 1) / 5 * 5 + 1; int rightPageNum =
	 * leftPageNum + 4; rightPageNum = Math.min(rightPageNum, lastPage);
	 * 
	 * // 이전 버튼 유무 boolean hasPreBtn = page > 5; // 다음 버튼 유무 boolean hasNextBtn =
	 * page <= ((lastPage - 1) / 5 * 5);
	 * 
	 * // 이전 버튼 눌렀을때 위치하는 페이지 넘버 int jumpPrePageNum = (page - 1) / 5 * 5 - 4; // 다음
	 * 버튼 눌렀을때 위치하는 페이지 넘버 int jumpNextPageNum = (page - 1) / 5 * 5 + 6;
	 * 
	 * pageInfo.setHasNextBtn(hasNextBtn); pageInfo.setHasPreBtn(hasPreBtn);
	 * pageInfo.setJumpPrePageNum(jumpPrePageNum);
	 * pageInfo.setJumpNextPageNum(jumpNextPageNum);
	 * pageInfo.setCurrentPageNum(page); pageInfo.setLeftPageNum(leftPageNum);
	 * pageInfo.setRightPageNum(rightPageNum); pageInfo.setLastPageNum(lastPage);
	 * 
	 * return boardMapper.list(offset, records, type, "%" + keyword + "%",
	 * category); }
	 */
 }
