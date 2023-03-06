package com.nhou.service.member;

import java.util.List;


import com.nhou.domain.member.MemberDto;
import com.nhou.domain.member.PageInfo;
import com.nhou.service.store.StoreService;

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

	// 회원정보조회
	List<MemberDto> selectMemberList(int page, PageInfo memberPageInfo, String keyword, String type);

	// 관리자 회원정보 조회수정
	List<Object> selectMemberInfoByUserId(String userId);

	// 회원 권한 수정
	int updateAuth(String userId, int auth);


	




}