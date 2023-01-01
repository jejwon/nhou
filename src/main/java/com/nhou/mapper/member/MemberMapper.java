package com.nhou.mapper.member;

import java.util.List;

import com.nhou.domain.member.MemberDto;

public interface MemberMapper {

	int insertMember(MemberDto member);

	MemberDto selectById(String username);

	List<MemberDto> selectAll();

}
