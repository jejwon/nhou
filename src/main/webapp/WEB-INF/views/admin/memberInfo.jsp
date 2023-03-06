<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style>
/* 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap');
/* 바디 */
.aLink {
	text-decoration: none;
	color: inherit;
}

.container {
	font-family: 'Noto Sans KR', sans-serif;
}
.listHover:hover {
	background-color: #D3D3D3;
	cursor: pointer;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<div class="container">
	
	<h1>회원정보</h1>
	<!-- table.table>thead>tr>th*4^^tbody -->
	<table class="table">
		<thead>
			<tr>
				<th style="text-align: center;">#</th>
				<th style="text-align: center;">ID</th>
				<th style="text-align: center;">PW</th>
				<th style="text-align: center;">EMAIL</th>
				<th style="text-align: center;">NICKNAME</th>
				<th style="text-align: center;">ADDRESS</th>
				<th style="text-align: center;">PHONE</th>
				<th style="text-align: center;">AUTH</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${memberList }" var="member" varStatus="st"><!-- 받는 객체 동일하게 -->
			<c:url value="/member/get" var="getLink">
				<c:param name="userId" value="${member.userId }"></c:param>
			</c:url>
			
			<tr class="listHover" onclick="location.href='${getLink }'">
				<td style="text-align: center;">${st.count }</td>
				<td style="text-align: center;">
					<a href="${getLink }" class="aLink">${member.userId }</a>
				</td>
				<td style="text-align: center;">${member.password }</td>
				<td style="text-align: center;">${member.email }</td>
				<td style="text-align: center;">${member.nickName }</td>
				<td style="text-align: center;">${member.address1 }</td>
				<td style="text-align: center;">${member.phone }</td>
				<td style="text-align: center;">
					<c:if test="${member.auth eq 0 }">
						관리자
					</c:if>
					<c:if test="${member.auth eq 1 }">
						일반회원
					</c:if>
					<c:if test="${member.auth eq 2 }">
						판매자
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>