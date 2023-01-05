package com.nhou.service.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhou.domain.board.BoardDto;
import com.nhou.domain.board.PageInfo;
import com.nhou.mapper.board.BoardMapper;
import com.nhou.mapper.board.BoardReplyMapper;

@Service
@Transactional
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private BoardReplyMapper boardReplyMapper;
	
	// 게시글 작성
	@Override
	public int insert(BoardDto board) {
		
		return boardMapper.insert(board); // 매퍼로 보냄
	}
	
	// 게시글 목록
	@Override
	public List<BoardDto> listBoard(int page, String type, String keyword, PageInfo pageInfo) { // service에 사용한 명명
		int records = 10; // 게시글 갯수
		int offset = (page - 1) * records; // 어디서부터 시작할지
		
		int countAll = boardMapper.countAll(type, "%" + keyword + "%"); // 게시물 총갯수 > mapper로 
		int lastPage = (countAll - 1) / records + 1; // 마지막 페이지
		
		// 5페이지씩 보이게
		int leftPageNum = (page - 1) / 5 * 5 + 1;
		int rightPageNum = leftPageNum + 4;
		rightPageNum = Math.min(rightPageNum, lastPage); // 오른쪽 페이지 숫자와 마지막 숫자중 더 적은 숫자 반환
		
		// 이전 버튼 유무 : 페이지가 5보다 크면 이전 버튼을 생성
		boolean hasPreBtn = page > 5;
		// 다음 버튼 유무
		boolean hasNextBtn = page <= ((lastPage - 1) / 5 * 5);
		
		// 이전 버튼을 눌렀을때 이동할 페이지 번호 위치
		int jumpPrePageNum = (page - 1) / 5 * 5 - 4;
		// 다음 버튼을 눌렀을때 이동할 페이지 번호 위치
		int jumpNextPageNum = (page - 1) / 5 * 5 + 6;
		
		pageInfo.setHasPreBtn(hasPreBtn);
		pageInfo.setHasNextBtn(hasNextBtn);
		pageInfo.setJumpNextPageNum(jumpNextPageNum);
		pageInfo.setJumpPrePageNum(jumpPrePageNum);
		pageInfo.setRightPageNum(rightPageNum);
		pageInfo.setLeftPageNum(leftPageNum);
		pageInfo.setCurrentPageNum(page);
		pageInfo.setLastPageNum(lastPage);
		
		
		return boardMapper.list(offset, records, type, "%" + keyword + "%");		// mapper에서 사용할 명명
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
		// 게시글에 달린 댓글 지우기
		boardReplyMapper.deleteByBoardId(boardId); // boardReplyMapper로
		
		// 게시글 지울때
		return boardMapper.delete(boardId); // mapper에서 사용할 명명
		
	}
 }
