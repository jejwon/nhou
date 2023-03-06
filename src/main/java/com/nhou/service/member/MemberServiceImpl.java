package com.nhou.service.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhou.domain.board.BoardDto;
import com.nhou.domain.member.MemberDto;
import com.nhou.domain.member.PageInfo;
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
	
	@Override
	public List<MemberDto> selectMemberList(int page, PageInfo memberPageInfo, String keyword, String type) {
		int records = 10;
		int offset = (page - 1) * records; //?page=2 =>  11~20 레코드들.  offset = 10  이어야함 .
		int countAllMember = memberMapper.selectAllMemberCount(type, "%"+keyword+"%");
		// 11명 => lastP =2 .. 11 - 1 /10 +1 ? 
		//  21 => 3             21-1/10 =2 +1
		int lastPageNumber = (countAllMember - 1) / records + 1;
		// page보기 1~10 개중...현재 page=2 라면,, 왼쪽에 1 오른쪽 8
		// page보기 11~20 개중...현재 page=15 라면,, 왼쪽에 4(11,12,13,14) 오른쪽 5 (16,17,18,19,20) =>leftPageNumber=11
							//15 -1 /10 =1 *10 =10 +1 =>11
							//27 -1 /10 =2 *10 =20 +1 =>21
		int leftPageNumber = (page - 1) / 10 * 10 + 1;
		int rightPageNumber = leftPageNumber + 9; //11 ~ 20 , 21 ~ 30, 31 ~ 40 
		rightPageNumber = Math.min(rightPageNumber, lastPageNumber);
		
		int jumpPrevPageNumber = (page - 1) / 10 * 10 - 9; 
		int jumpNextPageNumber = (page - 1) / 10 * 10 + 11;  
		boolean hasPrevButton = page > 10;
		boolean hasNextButton = page <= (lastPageNumber - 1) /10 * 10 ;
		
		memberPageInfo.setCurrentPageNumber(page);
		memberPageInfo.setLastPageNumber(lastPageNumber);
		memberPageInfo.setLeftPageNumber(leftPageNumber);
		memberPageInfo.setRightPageNumber(rightPageNumber);
		memberPageInfo.setJumpPrevPageNumber(jumpPrevPageNumber);
		memberPageInfo.setJumpPrevPageNumber(jumpNextPageNumber);
		memberPageInfo.setHasPrevButton(hasPrevButton);
		memberPageInfo.setHasNextButton(hasNextButton);
		
		return memberMapper.selectMemberList(offset, records, "%"+keyword+"%", type);
	}
	
	@Override
	public List<Object> selectMemberInfoByUserId(String userId) {
		List<Object> list = new ArrayList<>();
		
		MemberDto memberInfo = memberMapper.selectMemberInfoByUserId(userId);
		
		list.add(memberInfo);
		
		return list;
	}
	
	@Override
	public int updateAuth(String userId, int auth) {
		int cnt = memberMapper.updateAuth(userId, auth);
		
		return cnt;
	}
	
	
}