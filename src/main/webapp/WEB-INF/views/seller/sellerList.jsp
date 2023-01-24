<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>

<div id="page-wrapper">
<jsp:include page="/WEB-INF/include/sellerDashBoard.jsp"></jsp:include>

<!-- 본문 -->
<div id="page-content-wrapper">
    <div class="container-fluid">
    	<div class="containerTitle">
      		<h1 style="margin-bottom: 10px;">${member.userId }님의 판매 현황</h1>
				<input type="text" name="userId" value="${member.userId }" readonly="readonly">    	</div>
    	
    	<!-- 주문 현황 리스트 -->
    	<div class="productList">
			<table class="table table-hover container">
				<thead>
					<tr scope="row">
						<th>#</th>
						<th>상품명</th>
						<th>주문수량</th>
						<th>가격</th>
						<th>배송상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sellerList}" var="list">
						<c:url value="/store/storeGet" var="sellingList">
							<c:param name="orderListId" value="${sellingList.orderListId }"></c:param>
						</c:url>
						<tr>
							<td>${list.orderListId }</td>
							<td>${list.productName }</td>
							<td>${list.count }</td>
							<td>${list.payment }</td>
							<td>${list.orderStatus }</td>
						</tr>
					</c:forEach>				
				</tbody>
			</table>
    	</div>
    </div>
  </div>


</div> <!-- 전체 div -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>