<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<%@ include file = "../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo Edit</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<div class="container" style="background-color:pink;">
		<h1>개인정보 수정</h1>
		<form id="editForm"action="" method="post">

		<input type="hidden" value="${member.userId }">
		<div class="form-floating">
			<input type="text" class="form-control" value="${member.userId }"id="userId"placeholder="ID"name="userId"> 
			<label for="ID"></label>
		</div>
		<div class="form-floating">
			<input type="password" class="form-control" value="${member.password }"id="password"placeholder="Password" name="password"> 
			<label for="Password"></label>
		</div>
		<div class="form-floating">
			<input type="text" class="form-control" value="${member.userName }"id="userName"placeholder="userName" name="userName"> 
			<label for="nickName"></label>
		</div>
		<div class="form-floating">
			<input type="text" class="form-control" value="${member.nickName }"id="nickName"placeholder="Nickname" name="nickName"> 
			<label for="nickName"></label>
		</div>		
		<div class="form-floating">
			<input type="email" class="form-control" value="${member.email }"id="email"placeholder="name@example.com" name="email"> 
			<label for="email"></label>
		</div>
		<div class="form-floating">
			<input type="Date" class="form-control" id="birthDate"placeholder="birthDate"name="birthDate"> 
			<label for="birthDate"></label>
		</div>
		<div class="form-floating">
			<input type="text" class="form-control" value="${member.address }" id="address"placeholder="address"name="address"> 
			<label for="address"></label>
		</div>
		<div class="form-floating">
			<input type="text" class="form-control" value="${member.phone }"id="phone"placeholder="phone" name="phone"> 
			<label for="phone"></label>
		</div>
		<div class="form-check">
			  <input class="form-check-input" type="checkbox" value="2" id="auth" name="auth">
			  <label class="form-check-label" for="auth">
			   판매자 등록
	  		  </label>			 
		</div>
		<input id="editSubmit"type="submit" value="수정하기" />
		</form>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
document.querySelector("#editSubmit").addEventListener("click", function(){
	document.querySelector("#editForm").submit();
})
</script>
</body>
</html>