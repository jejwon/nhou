<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<input type="hidden" name="userId" value="${member.userId }">

<div class="container-fluid">
	<div class="containerTitle">
		<h1>${member.nickName }님의 주문 내역</h1>
	</div>
	
	<!-- 리스트 -->
	<div class="orderList">
		<table class="table table-hover container" >
			<thead>
				<tr scope="row" style="background-color: #DCC1B0;">
					<th style="width: 80px; vertical-align: middle;">주문번호</th>
					<th style="vertical-align: middle; text-align: center;">상품명</th>
					<th style="width: 50px; vertical-align: middle; text-align: center;">수량</th>
					<th style="width: 70px; vertical-align: middle; text-align: center;">가격</th>
					<th style="vertical-align: middle; text-align: center;">주문일자</th>
					<th style="vertical-align: middle; text-align: center;">상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="list">
					<c:url value="/store/storeGet" var="getLink">
						<c:param name="productId" value="${list.productId }"></c:param>
					</c:url>
					<tr onclick="location.href='${getLink}'">
						<td style="vertical-align: middle; text-align: center;">${list.orderId }</td>
						<td style="vertical-align: middle; text-align: center;" class="listTitle col-sm-6">
							<a href="${getLink }">${list.productName }</a>
						</td>
						<td style="vertical-align: middle; text-align: center;">${list.count }</td>
						<td style="vertical-align: middle; text-align: center;">${list.payment }</td>
						<td style="vertical-align: middle; text-align: center;">
						<fmt:parseDate value="${list.orderDate }" pattern="yyyy-MM-dd'T'HH:mm" var="time"/>
						<fmt:formatDate value="${time }" pattern="yyyy.MM.dd HH:mm"/></td>
						<td style="vertical-align: middle; text-align: center;">${list.status }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	
</div> <!-- 전체 div -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>