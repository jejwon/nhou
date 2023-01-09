package com.nhou.service.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhou.domain.qna.PageInfo;
import com.nhou.domain.qna.QnADto;
import com.nhou.mapper.member.MemberMapper;
import com.nhou.mapper.qna.QnAMapper;
import com.nhou.mapper.qna.QnAReplyMapper;

@Service
public class QnAServiceImpl implements QnAService{
	@Autowired
	private QnAMapper qnaMapper;
	
	@Autowired
	private QnAReplyMapper qnaReplyMapper;
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public int insert(QnADto qna) {
		return qnaMapper.insert(qna);
	}
	
	@Override
	public List<QnADto> list(int page, PageInfo pageInfo){
		int records = 10; //게시글 갯수 
		int offset = (page - 1) * records; // 어디서부터 시작할지 
		
		int countAll = qnaMapper.countAll(); //게시물 총갯수 -> mapper로 
		int lastPage = (countAll - 1) / records + 1; //마지막 페이지
		
		//5페이지씩 보이게
		int leftPageNum = (page - 1) / 5 * 5 + 1;
		int rightPageNum = leftPageNum + 4;
		rightPageNum = Math.min(rightPageNum, lastPage); //오른쪽 페이지와 마지막 페이지 중 더 작은 숫자 반환
		
		//이전버튼 유무 : 페이지가 5보다 크면 이전버튼 생성
		boolean hasPrevBtn = page > 5;
		//다음버튼 유무
		boolean hasNextBtn = page <= ((lastPage - 1) / 5 * 5);
		
		//이전버튼을 눌렀을 때 이동할 페이지 번호 위치
		int jumpPrevPageNum = (page -1) / 5 * 5 - 4;
		//다음버튼을 눌렀을 때 이동할 페이지 번호 위치
		int jumpNextPageNum = (page -1 ) / 5 * 5 + 6;
		
		pageInfo.setHasPrevBtn(hasPrevBtn);
		pageInfo.setHasNextBtn(hasNextBtn);
		pageInfo.setJumpNextPageNum(jumpNextPageNum);
		pageInfo.setJumpPrevPageNum(jumpPrevPageNum);
		pageInfo.setRightPageNum(rightPageNum);
		pageInfo.setLeftPageNum(leftPageNum);
		pageInfo.setCurrentPageNum(page);
		pageInfo.setLastPageNum(lastPage);
		
		
		return qnaMapper.list(offset, records);
	}
	
	@Override
	public QnADto getByQnAId(int qnaId) {
		return qnaMapper.getByQnAId(qnaId);
	}
	
	@Override
	@Transactional
	public int delete(int qnaId) {
		qnaReplyMapper.deleteByQnAId(qnaId);
		
		return qnaMapper.delete(qnaId);
	}
}
