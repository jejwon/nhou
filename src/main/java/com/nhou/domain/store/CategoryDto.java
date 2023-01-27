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
	private int productCategory_categoryId;
	
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
	
	public int getProCateId() {
		return productCategory_categoryId;
	}
	
	public void setProCateId(int productCategory_categoryId) {
		this.productCategory_categoryId = productCategory_categoryId;
	}
}
