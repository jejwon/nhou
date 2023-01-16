<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">  
  /* 판매자 대시보드 본문 */
  .containerTitle {
  	border-bottom: 1px solid #D3D3D3;
  	margin-bottom: 10px;
  }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css">
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>

<div id="page-wrapper">
<jsp:include page="/WEB-INF/include/sellerDashBoard.jsp"></jsp:include>

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
    	<div class="containerTitle">
      		<h1 style="margin-bottom: 10px;">등록한 상품 목록</h1>
			<input type="text" name="userId" readonly="readonly" value="${sellerList.userId }">
    	</div>
    	
    	<!-- 리스트 -->
    	<div class="productList">
			<table class="table table-hover container">
				<thead>
					<tr scope="row">
						<th>#</th>
						<th>상품명</th>
						<th>재고</th>
						<th>가격</th>
						<th>상품 등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sellerList.userSellList }" var="sellList">
						<c:url value="/store/storeList" var="getLink">
							<c:param name="productId" value="${sellList.productId }"></c:param>
						</c:url>
							<tr onclick="location.href='${getLink}'">
								<td>${sellList.productId }</td>
								<td class="listTitle col-sm-6">
									<a href="${getLink }">${sellList.productName }</a>
								</td>
								<td>${sellList.stock }</td>
								<td>${sellList.price }</td>
								<td>${sellList.insertDatetime }</td>
							</tr>
					</c:forEach>
				</tbody>
			</table>
    	</div>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>