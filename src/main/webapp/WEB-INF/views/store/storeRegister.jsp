<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- 옵션 -->

    <script>
        const add_textbox1 = () => {
            const box = document.getElementById("box1");
            const newP = document.createElement('p');
            newP.innerHTML = "<input type='text'> <input type='button' value='삭제' onclick='remove1(this)'>";
            box.appendChild(newP);
        }
        
        const add_textbox2 = () => {
            const box = document.getElementById("box2");
            const newP = document.createElement('p');
            newP.innerHTML = "<input type='text'> <input type='button' value='삭제' onclick='remove2(this)'>";
            box.appendChild(newP);
        }        
        
        const remove1 = (obj) => {
            document.getElementById('box1').removeChild(obj.parentNode);
        }
        
        const remove2 = (obj) => {
            document.getElementById('box2').removeChild(obj.parentNode);
        }
    </script>
    
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<h1> 상품등록 페이지 </h1>
	<!-- 카테고리명 선택 -->
	<div class="container">
		<form action="/store/storeRegister" method="post" enctype="multipart/form-data">
			<div class="categorySelectBox">
				<label for="categoryName">CategoryName</label>
				<select class="form-select" name="productCategory_categoryId" id="productCategory_categoryId">
					 <option value="1" name="FURNITURE">FURNITURE</option>
					 <option value="2" name="BEDDING">BEDDING</option>
					 <option value="3" name="LIVING&FABRIC"">LIVING&FABRIC</option> 
					 <option value="4" name="KITCHEN">KITCHEN</option>
					 <option value="5" name="DECO">DECO</option>
					 <option value="6" name="PETS">PETS</option>
				</select>
			</div>
				

					
		<!-- 옵션 -->    	
		<!-- 
			Option1    	
	        <div id="box1">
	            <input type="text" name="color"> <input type="button" value="추가" onclick="add_textbox1()">
	        </div>
	    	
	    	
	    	Option2   	
	        <div id="box2">
	            <input type="text" name="size"> <input type="button" value="추가" onclick="add_textbox2()">
	        </div>
	    	 -->	
			

		<!-- 상품명 -->
			<div class="mb-3">
			  <label for="productName">ProductName</label>
			  <input type="text" class="form-control" id="productName" name="productName">
			</div>
		
			
		<!-- 상품상세 -->
			<div class="mb-3">
			  <label for="productContents">Textarea</label>
			  <textarea class="form-control" id="Contents" rows="3" name="content"></textarea>
			</div>
		
			
		<!-- 상품대표이미지 -->
			Thumbnail
			<div class="input-group">
			  <input type="file" accept="image/*" class="form-control" name ="productFile1" id="inputGroupFile1" aria-describedby="inputGroupFileAddon1" aria-label="Upload">
			  <button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon">Upload</button>
			</div>
		
		
		<!-- 상품이미지(추가) -->
			Add Images
			<div class="input-group">
			  <input multiple type="file" accept="image/*" class="form-control" name ="productFile2" id="inputGroupFile2" aria-describedby="inputGroupFileAddon2" aria-label="Upload">
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
		
		<br>
			
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
			<button class="btn btn-secondary" type="submit">Submit</button>
		</div>
		</form>
	</div>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
</body>
</html>