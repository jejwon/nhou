package com.nhou.service.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<QnADto> list(){
		return qnaMapper.list();
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
