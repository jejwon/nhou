<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="style.css">
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
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>


	<section class="container">
		<header>Registration</header>
		<form action="${pageContext.request.contextPath}/store/storeRegister" method="post" enctype="multipart/form-data" class="form">
			
		<!-- 판매자 -->
			<div class="input-box">
			  <label>Seller</label>
			  <input 
			  	 value="<sec:authentication property="name"/>"
			  	 readonly type="text" class="form-control" name="member_userId" style="border:none">
			</div>
		
		<br>
			
		<!-- 카테고리명 선택 -->
			<label for="categoryName">CategoryName</label>
			<div class="select-box">
				<select class="form-select" name="productCategory_categoryId" id="productCategory_categoryId">
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
			  <input type="text" class="form-control" id="productName" name="productName">
			</div>
		
		<br>
			
		<!-- 상품상세 -->
			<div class="input-box">
			  <label for="productContents">Textarea</label>
			  <textarea class="form-control" id="productContent" rows="3" name="productContent"></textarea>
			</div>
		
		<br>
			
		<!-- 상품대표이미지 -->
			Thumbnail
			<div class="input-group">
			  <input type="file" class="form-control" name ="productFile1" id="inputGroupFile1" aria-describedby="inputGroupFileAddon1" aria-label="Upload">
			</div>
		
		<br>
		
		<!-- 상품이미지(추가) -->
			Add Images
			<div class="input-group">
			  <input multiple type="file" class="form-control" name ="productFile2" id="inputGroupFile2" aria-describedby="inputGroupFileAddon2" aria-label="Upload">
			</div>
		
		<br>
		
		<!-- 판매가 -->
			Price
			<div class="input-group">
			  <input type="text" class="form-control" name="price" aria-label="Dollar amount">
			  <span class="input-group-text">₩</span>
			</div>
		
		<br>
			
		<!-- 재고 -->
			Stock
			<div class="input-group">
			  <input type="text" class="form-control" name="stock" aria-label="EA">
			  <span class="input-group-text">ea</span>
			</div>
		
		<br>
			
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-secondary" type="submit">Submit</button>
		</div>
		</form>
	</section>		

<script type="text/javascript">

</script>
</body>
</html>