package com.nhou.service.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nhou.domain.member.MemberDto;
import com.nhou.mapper.member.MemberMapper;
@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public int signupMember(MemberDto member) {
		int cnt = memberMapper.insertMember(member);
		return cnt;
	}
}
