package com.nhou.service.member;

import java.util.List;


import com.nhou.domain.member.MemberDto;

public interface MemberService {
	
	int signupMember(MemberDto member);

	MemberDto getById(String userId);

	List<MemberDto> list();

	int update(MemberDto member);

	// 판매자 판매목록 가져오기
	MemberDto getUserSellList(String userId);

}
