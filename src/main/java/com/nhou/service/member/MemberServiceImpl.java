package com.nhou.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhou.domain.board.BoardDto;
import com.nhou.domain.member.MemberDto;
import com.nhou.mapper.board.BoardMapper;
import com.nhou.mapper.board.BoardReplyMapper;
import com.nhou.mapper.member.MemberMapper;
import com.nhou.service.board.BoardServiceImpl;
@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private BoardMapper boardMapper;
	
	@Autowired
	private BoardReplyMapper boardReplyMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private BoardServiceImpl boardService;
	
	@Override
	public int signupMember(MemberDto member) {
		String pw = member.getPassword();
		member.setPassword(passwordEncoder.encode(pw));
		
		return memberMapper.insertMember(member);
		
	}
	
	@Override
	public MemberDto userCheck(MemberDto member) throws Exception {
		return memberMapper.userCheck(member);
	}
	
	@Override
	public void memberDelete(MemberDto member) throws Exception {
		memberMapper.memberDelete(member);
	}
	
	@Override
	public MemberDto getById(String userId) {
		return memberMapper.selectByuserId(userId);
	}
	
	@Override
	public MemberDto getByNickName(String nickName) {
		return memberMapper.selectyByNickName(nickName);
	}
	
	@Override
	public MemberDto getByEmail(String email) {
		return memberMapper.selectByEmail(email);
	}
	
	@Override
	public List<MemberDto> list(){
		return memberMapper.selectAll();
	}
	
	@Override
	public int update(MemberDto member) {
		int cnt = 0;
		
		try {
			if (member.getPassword() != null) {
				String encodePw = passwordEncoder.encode(member.getPassword());
				member.setPassword(encodePw);
			}
			return memberMapper.update(member);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	//판매자 판매목록 가져오기
	@Override
	public MemberDto getUserSellList(String userId) {
		return memberMapper.getUserSellList(userId);
	}
	
	// 회원탈퇴
	@Override
	public int remove(String member_userId) {
		// 좋아요 지우기
		boardMapper.deleteLikeByMemberId(member_userId);
		
		// 댓글 지우기
		boardReplyMapper.deleteByMemberId(member_userId);
		
		return memberMapper.deleteById(member_userId);
		
	}
	
	
}
