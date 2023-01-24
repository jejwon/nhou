package com.nhou.domain.store;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDto {
	private int startPage; // 시작번호
	private int endPage;   // 끝번호
	private boolean prev, next; // 이전과 다음 이동가능한 링크표시
	
	private int total;
	private Criteria cri;
	
	public PageDto(Criteria cri, int total) {
		this.cri =cri;
		this.total = total;
		
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 5.0)) * 5;
		
		this.startPage = this.endPage - 4;
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
