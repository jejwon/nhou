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
<h1> 게시물 수정 </h1>

	<!-- 카테고리명 선택 -->
	<div class="container">
		<form id="modifyForm" action="" method="post">
		<input type="hidden" name="productId" value="${store.productId }">
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
				
					
		<!-- 옵션 -->    	
			
			Option1    	
	        <div id="box1">
	            <input type="text" name="color"> <input type="button" value="추가" onclick="add_textbox1()">
	        </div>
	    	
	    	
	    	Option2   	
	        <div id="box2">
	            <input type="text" name="size"> <input type="button" value="추가" onclick="add_textbox2()">
	        </div>
	    	
			
		<!-- 상품명 -->
			<div class="mb-3">
			  <label for="productName">ProductName</label>
			  <input type="text" class="form-control" id="productName" name="productName">
			</div>
		
			
		<!-- 상품상세 -->
			<div class="mb-3">
			  <label for="productContents">Textarea</label>
			  <textarea class="form-control" id="productContents" rows="3" name="productContents"></textarea>
			</div>
		
			
		<!-- 상품대표이미지 -->
			Thumbnail
			<div class="input-group">
			  <input type="file" class="form-control" name ="productFileName" id="inputGroupFile1" aria-describedby="inputGroupFileAddon1" aria-label="Upload">
			  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon">Upload</button>
			</div>
		
		
		<!-- 상품이미지(추가) -->
			Add Images
			<div class="input-group">
			  <input type="file" class="form-control" name ="productFileName" id="inputGroupFile2" aria-describedby="inputGroupFileAddon2" aria-label="Upload">
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
			
		</form>
		
	<!-- Modify Button -->
		<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float: right;">
			<button class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modifyModal" type="submit">수정</button>
		</div>
		
	<!-- Delete Button -->	
		<c:url value="/store/storeRemove" var="removeLink" />
		<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="float: right;">
			<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#removeModal"  type="submit">
				삭제
			</button>
		</div>
		
		<form id="removeForm" action="${removeLink }" method="post">
		<input type="hidden" name="productId" value="${store.productId }">
		</form>	
		
	</div>

	<!-- Modify Modal -->
	<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">수정 확인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        수정 하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button id="modifyConfirmButton" class="btn btn-primary">Save</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!-- remove Modal -->
	<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        정말로 삭제 하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button id="removeConfirmButton" class="btn btn-primary">Delete</button>
	      </div>
	    </div>
	  </div>
	</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
	//수정확인 버튼 클릭하면 수정 form 전송
	document.querySelector("#modifyConfirmButton").addEventListener("click", function() {
		document.querySelector("#modifyForm").submit();
	});
	
	//삭제확인 버튼 클릭하면 수정 form 전송
		document.querySelector("#removeConfirmButton").addEventListener("click", function() {
		document.querySelector("#removeForm").submit();
	});		
</script>
</body>
</html>