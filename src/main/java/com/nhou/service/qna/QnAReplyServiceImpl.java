package com.nhou.service.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhou.domain.qna.QnAReplyDto;
import com.nhou.mapper.qna.QnAReplyMapper;

@Service
public class QnAReplyServiceImpl implements QnAReplyService{
	
	@Autowired
	private QnAReplyMapper qnaReplyMapper;
	
	@Override
	public int insertReply(QnAReplyDto qnaReply) {
		return qnaReplyMapper.insert(qnaReply);
	}
	
	@Override
	public List<QnAReplyDto> listReplyByQnAId(int qnaId){
		return qnaReplyMapper.list(qnaId);
	}
	
	@Override
	public QnAReplyDto getByQnAReplyId(int qnaReplyId) {
		return qnaReplyMapper.get(qnaReplyId);
	}
	
	@Override
	public int deleteByQnAReplyId(int qnaReplyId) {
		return qnaReplyMapper.delete(qnaReplyId);
	}
	
	@Override
	public QnAReplyDto editReply(QnAReplyDto qnaReply) {
		return qnaReplyMapper.edit(qnaReply);
	}
}
