package com.nhou.domain.store;

import lombok.Data;

@Data
public class Criteria {
		//현재 페이지 번호
		private int pageNum;
		// 페이지 표시 개수
		private int amount;
		// 검색 타입
		private String type;
		// 검색 키워드
		private String keyword;
		// 카테고리 이름
		private String[] cateArr;
		// 카테고리 id
		private String cateId;
		
		// Criteria 기본 생성자
		public Criteria() {
			this(1, 16);
		}
		
		// Criteria 생성자
		public Criteria(int pageNum, int amount) {
			this.pageNum = pageNum;
			this.amount = amount;
		}
		
		// 검색타입 데이터 배열 변환
		public String[] getTypeArr() {
			return type == null? new String [] {} : type.split("");
		}
		
		public String[] getCateArr() {
			return cateArr;
		}
		
		public void setCateArr(String[] cateArr) {
			this.cateArr = cateArr;
		}
		
		public String getCateId() {
			return cateId;
		}
		
		public void setCateId(String cateId) {
			this.cateId = cateId;
		}
		
		public String getType() {
			return type;
		}
		
		public void setType(String type) {
			this.type = type;
		}
		
		public String getKeyword() {
			return keyword;
		}
		
		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		
}

