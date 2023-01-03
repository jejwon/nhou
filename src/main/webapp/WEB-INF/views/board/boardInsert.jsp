<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "../includes/header.jsp"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.container-sm {
	letter-spacing: -1px;
	font-size: 16px;
	margin: 10px;
	padding: 0 100px 0 100px;
	width: 800px;
}

.categorySelectBox {
	text-align: left;
}

.categorySelectBox p {
	display: inline-block;
	color: #333;
	font-size: 20px;
	padding-left: 5px;
}

.categorySelectBox .category {
	display: inline-block;
	width: 105px;
	height: 40px;
	border: 0;
	outline: none;
	margin: 30px 0 10px 10px;
	font-size: 20px;
	font-weight: bold;
}

.categorySelectBox .category option {
	font-size: 16px;
	color: #666;
	font-weight: normal;
}
	
.b1 {
	background-color: #6D8B74;
	border-radius: 5px;
	border-color: #6D8B74;
	color: #fff;
	width: 60px;
	height: 30px;
	float: center;
}

.b2 {
	background-color: #D3D3D3;
	border-radius: 5px;
	border-color: #D3D3D3;
	color: #fff;
	width: 60px;
	height: 30px;
}

.btns {
	display: inline-block;
	margin: 10px 5px;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
	<form action="/board/boardInsert" method="post">
		<div class="categorySelectBox">
		<div>
			<input type="text" name="member_userId" disabled="disabled">
		</div>
			<p>카테고리</p>
			
			<select class="category" name="boardCategory" id="">
				<option name="houses">집들이</option>
				<option name="tip">꿀팁전수</option>
				<option name="chat">자유잡담</option>
			</select>
		</div>
		
		
		<div class="form-floating" style="padding-bottom: 10px;">
			<input class="form-control" type="text" name="title">
			<label>제목</label>		
		</div>
		
		<div class="form-floating mb-3">
			<textarea class="form-control" name="content" style="resize: none; height: 150px;"></textarea>
		</div>
		
		<div>
			<input multiple="multiple" type="file" class="form-control">
		</div>
		
		
		<div class="row-g-2" style="display: inline-block; padding: 10px 100px 10px 100px; margin: 10px 500px 10px 500px;">
			<input style="" class="b1" type="submit" value="등록"> 
			<c:url value="/board/boardList" var="listLink" />
		</div>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
</body>
</html>