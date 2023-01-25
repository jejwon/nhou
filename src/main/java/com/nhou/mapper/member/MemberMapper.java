package com.nhou.mapper.member;

import java.util.List;

import com.nhou.domain.member.MemberDto;

public interface MemberMapper {
	//회원가입
	int insertMember(MemberDto member);
	//로그인 (마이페이지)
	public MemberDto selectById(String username);
	// 중복검사
	public MemberDto selectByuserId(String userId);
	public MemberDto selectyByNickName(String nickName);
	public MemberDto selectByEmail(String email);
	public MemberDto userCheck(MemberDto member) throws Exception;
	//회원목록
	List<MemberDto> selectAll();
	//마이페이지 회원정보 수정
	int update(MemberDto member);
	// 판매자 판매목록 가져오기
	MemberDto getUserSellList(String userId);
	// 회원탈퇴
	int deleteById(String userId);
	public void memberDelete(MemberDto member) throws Exception;
	

}
