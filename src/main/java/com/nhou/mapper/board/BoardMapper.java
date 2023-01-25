package com.nhou.mapper.board;

import java.util.List;

import com.nhou.domain.board.BoardDto;
import com.nhou.domain.member.MemberDto;

public interface BoardMapper {
	
	// 게시글 작성하기
	int insert(BoardDto board);
	// 파일 업로드(파일 이름 저장하기)
	int insertFile(int board_boardId, String boardFileName);

	// 게시글 리스트 + 페이지네이션
	List<BoardDto> list(int offset, int records, String type, String keyword, String category);

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
	int getLikeByBoardIdAndUserId(String board_boardId, String member_userId);

	// 좋아요 삭제하기
	int deleteLike(String board_boardId, String member_userId);

	// 좋아요 누르기
	int insertLike(String board_boardId, String member_userId);

	// 좋아요 카운트
	int countLikeByBoardId(String board_boardId);

	// 게시글 삭제할때 좋아요 같이 삭제
	int deleteLikeByBoardId(int boardId);
	
	// db파일에서 파일첨부 지우기
	int deleteFileByBoardId(int boardId);
	
	// File table에 해당파일명 지우기
	int deleteFileBoardIdAndFileName(int board_boardId, String boardFileName);

	// 좋아요 카운트
	int updateViewCount(int boardId);
	
	// 회원탈퇴하면서 좋아요삭제
	int deleteLikeByMemberId(String userId);
	
}
