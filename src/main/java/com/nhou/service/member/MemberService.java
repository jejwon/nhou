package com.nhou.service.member;

import java.util.List;


import com.nhou.domain.member.MemberDto;

public interface MemberService {
	
	int signupMember(MemberDto member);
	
	// 사용자 정보 가져오기
	MemberDto getById(String userId);
	MemberDto getByNickName(String nickName);
	MemberDto getByEmail(String email);
	MemberDto userCheck(MemberDto member) throws Exception;

	List<MemberDto> list();

	public int update(MemberDto member);

	// 판매자 판매목록 가져오기
	MemberDto getUserSellList(String userId);

	// 회원탈퇴
	public void memberDelete(MemberDto member) throws Exception;
	public int remove(String userId);


	




}
