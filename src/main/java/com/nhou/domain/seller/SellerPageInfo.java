package com.nhou.domain.seller;

import lombok.Data;

@Data
public class SellerPageInfo {
	private int lastPageNum;
	private int leftPageNum;
	private int rightPageNum;
	private int currentPageNum;
	private int jumpPrePageNum;
	private int jumpNextPageNum;
	private boolean hasPreBtn;
	private boolean hasNextBtn;
}
