package com.nhou.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.nhou.domain.board.BoardDto;
import com.nhou.domain.board.PageInfo;

public interface BoardService {
	
	// 게시글 작성하기
	// public int insert(BoardDto board);

	// 게시물 리스트 + 페이지네이션
	public List<BoardDto> listBoard(int page, String type, String keyword, PageInfo pageInfo, String category);

	// 게시물 가져와서 보기
	public BoardDto get(int boardId, String member_userId);
	public BoardDto get(int boardId);

	// 게시글 수정하기
	public int update(BoardDto board, MultipartFile[] files, List<String> removeFiles);

	// 게시글 삭제하기
	public int remove(int boardId);

	// 게시글 파일 업로드
	public int insertFile(BoardDto board, MultipartFile[] files);

	// 좋아요 카운트
	public Map<String, Object> updateLike(String board_boardId, String member_userId);

	// 조회수
	public int updateViewCount(int boardId);
}
