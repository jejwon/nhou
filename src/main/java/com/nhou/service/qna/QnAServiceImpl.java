package com.nhou.service.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhou.domain.qna.QnADto;
import com.nhou.mapper.member.MemberMapper;
import com.nhou.mapper.qna.QnAMapper;

@Service
public class QnAServiceImpl implements QnAService{
	@Autowired
	private QnAMapper qnaMapper;
	
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
}
