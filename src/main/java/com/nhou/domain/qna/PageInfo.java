package com.nhou.domain.qna;

import lombok.Data;

@Data
public class PageInfo {
	private int lastPageNum;
	private int leftPageNum;
	private int rightPageNum;
	private int currentPageNum;
	private int jumpPrevPageNum;
	private int jumpNextPageNum;
	private boolean hasPrevBtn;
	private boolean hasNextBtn;
}
