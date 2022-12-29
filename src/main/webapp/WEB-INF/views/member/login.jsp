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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

	<div class="container" style="background-color:pink;">
	<div class="row justify-content-center">
	<div class="col-12 col-md-5">
	<h1>로그인</h1>	
	
	
	<form method="post">
	id <input type="text" name="username"> <br>
	pw <input type="text" name="password"> <br>
	<input type="submit" value="로그인">

	</form>
	<!-- <form action="" method="post">
		<div class="form-floating">
			<input type="text" class="form-control" id="userId"placeholder="ID"name="userId"> 
			<label for="ID">ID</label>
		</div>
		<div class="form-floating">
			<input type="password" class="form-control" id="password"placeholder="Password" name="password"> 
			<label for="Password">Password</label>
		</div>
		
		<button type="submit" class="btn btn-primary m-1" >로그인</button>
		
	</form> -->
		<a href="/member/join">회원가입</a>
	</div>
	</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>