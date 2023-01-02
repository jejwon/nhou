package com.nhou.service.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.nhou.domain.member.MemberDto;
import com.nhou.mapper.member.MemberMapper;
@Service
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
}
