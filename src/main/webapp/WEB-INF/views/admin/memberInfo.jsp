<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div class="container" style="background-color: pink;">
	
	<h1>회원정보</h1>
	<!-- table.table>thead>tr>th*4^^tbody -->
	<table class="table">
		<thead>
			<tr>
				<th>ID</th>
				<th>PW</th>
				<th>EMAIL</th>
				<th>NICKNAME</th>
				<th>INSERTED</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${memberList }" var="member"><!-- 받는 객체 동일하게 -->
			<tr> <%-- 펼쳐지게 설정--%>
				<td>${member.userId }</td>
				<td>${member.password }</td>
				<td>${member.email }</td>
				<td>${member.nickName }</td>
				<td>${member.insertDatetime }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>