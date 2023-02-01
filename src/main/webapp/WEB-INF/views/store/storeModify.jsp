<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="style.css">
</head>
<style>
/* Import Google font - Poppins */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
.container {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}
.container {
  position: relative;
  max-width: 700px;
  width: 100%;
  background: #fff;
  padding: 25px;
  border-radius: 8px;
  box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}
.container header {
  font-size: 1.5rem;
  color: #333;
  font-weight: 500;
  text-align: center;
}
.container .form {
  margin-top: 30px;
}
.form .input-box {
  width: 100%;
  margin-top: 20px;
}
.input-box label {
  color: #333;
}
.form :where(.input-box input, .select-box) {
  position: relative;
  height: 50px;
  width: 100%;
  outline: none;
  font-size: 1rem;
  color: #707070;
  margin-top: 8px;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 0 15px;
}
.input-box input:focus {
  box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
}
.form .column {
  display: flex;
  column-gap: 15px;
}
.select-box select {
  height: 100%;
  width: 100%;
  outline: none;
  border: none;
  color: #707070;
  font-size: 1rem;
}
.form button {
  height: 55px;
  width: 100%;
  color: #fff;
  font-size: 1rem;
  font-weight: 400;
  margin-top: 30px;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
  background: rgb(236, 208, 80);
}
.form button:hover {
  background: rgb(218, 196, 68);
}
</style> 
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>

	<section class="container">
		<header>Modify</header>
		<form id="modifyForm" action="" method="post" enctype="multipart/form-data">
		<input type="hidden" name="productId" value="${store.productId }">
		
		<br>
		
			<!-- 판매자 -->
			<div class="input-box">
			  <label>Seller</label>
			  <input readonly type="text" class="form-control" value="${store.member_userId }" style="border:none">
			</div>
			
			<br>
			
		    <!-- 카테고리명 선택 -->
			<label for="categoryName">CategoryName</label>
			<div class="select-box">
				<select class="form-select border border-dark-subtle" name="productCategory_categoryId" id="productCategory_categoryId">
					 <option value="1" name="furniture">Furniture</option>
					 <option value="2" name="bedding">Bedding</option>
					 <option value="3" name="Living&Fabric">Living&Fabric</option> 
					 <option value="4" name="kitchen">Kitchen</option>
					 <option value="5" name="deco">Deco</option>
					 <option value="6" name="pets">Pets</option>
				</select>
			</div>
				
			<br>
			
		<!-- 상품명 -->
			<div class="input-box">
			  <label for="productName">ProductName</label>
			  <input type="text" class="form-control" value="${store.productName }" id="productName" name="productName">
			</div>
			
			<br>
			
		<!-- 상품상세 -->
			<div class="input-box">
			  <label for="productContent">Textarea</label>
			  <textarea class="form-control" id="productContent" rows="3" name="productContent"></textarea>
			</div>
			
			<br>
			
		<!-- 상품 대표 이미지 -->
			<h5>Thumbnail</h5>
			<div class="col-md-4">
				<img src="/image/${store.productId}/${store.productImage}" class="rounded" alt="...">
			</div>
			
			<br>
			<hr>
			<br>
						
		<!-- 상품 이미지(추가) -->
			<h5>Detail</h5>						
			<div class="mb-3">
				<c:forEach items="${store.productFileName}" var="file">
					<div class="row">
						<div class="col-2">
							<%-- 삭제 여부 체크 박스 --%>
							삭제
							<input type="checkbox" name="removeFiles" value="${file }">
						</div>
						<div class="col-10">
							<div class="col-md-4">
								<img src="/image/${store.productId}/${file}" class="img-fluid rounded-start" alt="...">
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			
			<br>
			
		<!-- 상품대표이미지 파일 -->
			Thumbnail
			<div class="input-group">
			  <input type="file" accept="image/*" class="form-control" name ="productFile1" id="inputGroupFile1" aria-describedby="inputGroupFileAddon1" aria-label="Upload">
			</div>
			
			<br>
				
		<!-- 상품이미지 파일(추가) -->
			Add Images
			<div class="input-group">
			  <input multiple type="file" accept="image/*" class="form-control" name ="productFile2" id="inputGroupFile2" aria-describedby="inputGroupFileAddon2" aria-label="Upload">
			</div>
		
			<br>
		
		<!-- 판매가 -->
			Price
			<div class="input-group">
			  <input type="text" class="form-control" value="${store.price }" name="price" aria-label="Dollar amount">
			  <span class="input-group-text">₩</span>
			</div>
		
			<br>
			
		<!-- 재고 -->
			Stock
			<div class="input-group">
			  <input type="text" class="form-control" value="${store.stock }" name="stock" aria-label="EA">
			  <span class="input-group-text">ea</span>
			</div>
			
		</form>
		
			<br>
	<!-- Modify Button -->
		<div class="d-grid gap-2">
			<button class="btn btn-secondary border border-white" data-bs-toggle="modal" data-bs-target="#modifyModal"  style="background-color: #9D8A76;" type="submit">수정</button>
		</div>
		
			<br>
		
	<!-- Delete Button -->	
		<c:url value="/store/storeRemove" var="removeLink" />
		<div class="d-grid gap-2">
			<button class="btn btn-primary border border-success-subtle" data-bs-toggle="modal" data-bs-target="#removeModal" style="background-color: #588068;" type="submit">
				삭제
			</button>
		</div>
		
		<form id="removeForm" action="${removeLink }" method="post">
		<input type="hidden" name="productId" value="${store.productId }">
		</form>	
		
	</section>

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