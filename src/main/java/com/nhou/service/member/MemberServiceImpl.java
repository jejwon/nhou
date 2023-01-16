package com.nhou.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhou.domain.member.MemberDto;
import com.nhou.mapper.member.MemberMapper;
@Service
@Transactional
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public int signupMember(MemberDto member) {
		String pw = member.getPassword();
		member.setPassword(passwordEncoder.encode(pw));
		
		return memberMapper.insertMember(member);
		
	}
	
	@Override
	public MemberDto getById(String userId) {
		return memberMapper.selectById(userId);
	}
	
	@Override
	public List<MemberDto> list(){
		return memberMapper.selectAll();
	}
	
	@Override
	public int update(MemberDto member) {
		return memberMapper.update(member);
	}
	
	//판매자 판매목록 가져오기
	@Override
	public MemberDto getUserSellList(String userId) {
		return memberMapper.getUserSellList(userId);
	}
	
	
}
