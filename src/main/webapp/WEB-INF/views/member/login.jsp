<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style>
/* 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap');
/* 바디 */
.container {
	font-family: 'Noto Sans KR', sans-serif;
}
.title{
	margin: 20px; 
}/* 로그인 버튼 */
#button1 {
	text-align: center;
	position: relative;
}
#button1 #loginBtn {
	display: inline-block;
	position: absolute;
	background-color: #DCC1B0;
}
#button2 {
	text-align: center;
	position: relative;
}
#button2 #joinBtn {
	display: inline-block;
	position: absolute;
	background-color: #DCC1B0;
	left: 150px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<section>	
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-12 col-md-5">
				<div class="title">
					<h1>로그인</h1>	
				</div>
	
	
<form action="" method="post">
		<div class="form-floating" style="margin:10px;">
			<input type="text" class="form-control" id="userId"placeholder="ID"name="username"> 
			<label for="ID">ID</label>
		</div>
		<div class="form-floating" style="margin:10px;">
			<input type="password" class="form-control" id="password"placeholder="Password" name="password"> 
			<label for="Password">Password</label>
		</div>
		
		<div id="button1">		
			<div class="login">
				<button id="loginBtn"class="btn btn-outline">로그인</button>		
			</div>
		</div>		
	</form>
	
	<div id="button2">		
			<div class="join">
			<c:url value="/member/join" var="joinLink"></c:url>
				<a href="${joinLink }">
				<button id="joinBtn"class="btn btn-outline">회원가입</button>
				</a>			
			</div>
	</div>
		
	</div>
	</div>
	</div>
</section>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>