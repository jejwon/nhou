package com.nhou.domain.store;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CategoryDto {
	private int categoryId;
	private String categoryName;
	
	public int getCateId() {
		return categoryId;
	}
	
	public void setCateId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	public String getCateName() {
		return categoryName;
	}
	
	public void setCateName(String categoryName) {
		this.categoryName = categoryName;
	}
}
