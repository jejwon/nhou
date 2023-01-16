package com.nhou.service.seller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhou.domain.seller.SellerDto;
import com.nhou.domain.seller.SellerPageInfo;
import com.nhou.mapper.seller.SellerMapper;

@Service
@Transactional
public class SellerServiceImpl implements SellerService {

	@Autowired
	private SellerMapper sellerMapper;
	
	//회원들 주문목록
	@Override
	public List<SellerDto> listBoard(int page, String type, String keyword, SellerPageInfo pageInfo) {
		int records = 10; // 게시글 갯수
		int offset = (page - 1) * records; // 어디서부터 시작할지
		
		int countAll = sellerMapper.countAll(type, "%" + keyword + "%"); // 게시물 총갯수 > mapper로 
		int lastPage = (countAll - 1) / records + 1; // 마지막 페이지
		
		// 5페이지씩 보이게
		int leftPageNum = (page - 1) / 5 * 5 + 1;
		int rightPageNum = leftPageNum + 4;
		rightPageNum = Math.min(rightPageNum, lastPage); // 오른쪽 페이지 숫자와 마지막 숫자중 더 적은 숫자 반환
		
		// 이전 버튼 유무 : 페이지가 5보다 크면 이전 버튼을 생성
		boolean hasPreBtn = page > 5;
		// 다음 버튼 유무
		boolean hasNextBtn = page <= ((lastPage - 1) / 5 * 5);
		
		// 이전 버튼을 눌렀을때 이동할 페이지 번호 위치
		int jumpPrePageNum = (page - 1) / 5 * 5 - 4;
		// 다음 버튼을 눌렀을때 이동할 페이지 번호 위치
		int jumpNextPageNum = (page - 1) / 5 * 5 + 6;
		
		pageInfo.setHasPreBtn(hasPreBtn);
		pageInfo.setHasNextBtn(hasNextBtn);
		pageInfo.setJumpNextPageNum(jumpNextPageNum);
		pageInfo.setJumpPrePageNum(jumpPrePageNum);
		pageInfo.setRightPageNum(rightPageNum);
		pageInfo.setLeftPageNum(leftPageNum);
		pageInfo.setCurrentPageNum(page);
		pageInfo.setLastPageNum(lastPage);
		
		return sellerMapper.list(offset, records, type, "%" + keyword + "%");
	}
}
