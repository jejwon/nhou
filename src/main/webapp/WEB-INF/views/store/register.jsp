<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<h1> 상품등록 페이지 </h1>

<!-- 카테고리명 선택 -->
<div class="container">
	<form action="" method="post">
		<div class="categorySelectBox">
			<label for="categoryName">CategoryName</label>
			<select class="form-select" name="categoryName">
				 <option selected>Select Category</option>
				 <option name="furniture">Furniture</option>
				 <option name="bedding">Bedding</option>
				 <option name="living">Living</option>
				 <option name="fabric">Fabric</option>
				 <option name="kitchen">Kitchen</option>
				 <option name="pets">Pets</option>
			</select>
		</div>
	
		
	<!-- 상품명 -->
		<div class="mb-3">
		  <label for="productName">ProductName</label>
		  <input type="text" class="form-control" id="productName" name="productName">
		</div>
	
		
	<!-- 상품상세 -->
	
		<div class="mb-3">
		  <label for="content">Textarea</label>
		  <textarea class="form-control" id="content" rows="3" name="product_content"></textarea>
		</div>
	
		
	<!-- 상품대표이미지 -->
		Thumbnail
		<div class="input-group">
		  <input type="file" class="form-control" name ="productFileImage" id="inputGroupFile" aria-describedby="inputGroupFileAddon" aria-label="Upload">
		  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon">Upload</button>
		</div>
	
	
	<!-- 상품이미지(추가) -->
		Add Images
		<div class="input-group">
		  <input type="file" class="form-control" name ="productFileImage" id="inputGroupFile1" aria-describedby="inputGroupFileAddon1" aria-label="Upload">
		  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon1">Upload</button>
		</div>
	
	
	<!-- 판매가 -->
		Price
		<div class="input-group">
		  <input type="text" class="form-control" name="price" aria-label="Dollar amount">
		  <span class="input-group-text">₩</span>
		</div>
	
		
	<!-- 재고 -->
		Stock
		<div class="input-group">
		  <input type="text" class="form-control" name="stock" aria-label="EA">
		  <span class="input-group-text">ea</span>
		</div>
		
	<div class="d-grid gap-2 d-md-flex justify-content-md-end">
		<button class="btn btn-secondary" type="submit">Submit</button>
	</div>
	</form>
</div>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>