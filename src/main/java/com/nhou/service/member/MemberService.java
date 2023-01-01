package com.nhou.service.member;

import java.util.List;

import com.nhou.domain.member.MemberDto;

public interface MemberService {

	int signupMember(MemberDto member);

	MemberDto getById(String userId);

	List<MemberDto> list();



}
