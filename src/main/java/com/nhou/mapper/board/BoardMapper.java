package com.nhou.mapper.board;

import java.util.List;

import com.nhou.domain.board.BoardDto;

public interface BoardMapper {
	
	// 게시글 작성하기
	int insert(BoardDto board);
	// 파일 업로드
	int insertFile(int boardId, String boardFileName);

	// 게시글 리스트 + 페이지네이션
	List<BoardDto> list(int offset, int records, String type, String keyword);

	// 게시물 총갯수
	int countAll(String type, String keyword);

	// 게시글 선택해서 보기
	BoardDto select(int boardId, String member_userId);
	// selete(id)를 호출해서 쓰는 메소드를 해결하기 위해 만듦
	default BoardDto select(int id) {
		return select(id, null);
	}

	// 수정한 게시글 다시 등록하기 > xml id값
	int update(BoardDto board);

	// 게시글 삭제하기
	int delete(int boardId);
	
	// 닉네임 정보 불러오기
	String selectNick(String userId);

	
	// 좋아요 누른 아이디 구하기
	int getLikeByBoardIdAndUserId(String boardId, String member_userId);

	// 좋아요 삭제하기
	int deleteLike(String boardId, String member_userId);

	// 좋아요 누르기
	int insertLike(String boardId, String member_userId);

	// 좋아요 카운트
	int countLikeByBoardId(String boardId);

	// 게시글 삭제할때 좋아요 같이 삭제
	int deleteLikeByBoardId(int boardId);

}
