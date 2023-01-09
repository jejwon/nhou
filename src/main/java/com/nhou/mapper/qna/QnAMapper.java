package com.nhou.mapper.qna;

import java.util.List;

import com.nhou.domain.qna.QnADto;

public interface QnAMapper {
	//게시글 작성
	int insert(QnADto qna);
	//게시글 리스트
	List<QnADto> list(int offset, int records);
	//게시글 보기
	QnADto getByQnAId(int qnaId);
	//게시글 삭제
	int delete(int qnaId);
	//게시글 총 갯수
	int countAll();
	
}
