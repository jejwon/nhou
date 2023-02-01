<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
				<input type="hidden" name="userId" value="${member.userId }" readonly="readonly">    	</div>
    	
    	<!-- 주문 현황 리스트 -->
    	<div class="productList">
			<table class="table table-hover container">
				<thead>
					<tr scope="row" style="background-color: #DCC1B0; width: 900px;">
						<th style="width: 200px; vertical-align: middle; text-align: center;">주문번호</th>
						<th style="width: 200px; vertical-align: middle; text-align: center;">주문인</th>
						<th style="width: 100px; vertical-align: middle; text-align: center;">가격</th>
						<th style="width: 300px; vertical-align: middle; text-align: center;">주문날짜</th>
						<th style="width: 80px; vertical-align: middle; text-align: center;">주문수량</th>
						<th style="width: 100px; vertical-align: middle; text-align: center;">배송상태</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${orderList}" var="orderList">
					<c:url value="/seller/sellerModify" var="getLink">
						<c:param name="orderId" value="${orderList.orderId }"></c:param>
					</c:url>
					<tr onclick="location.href='${getLink }'" class="titleClick">
						<td style="vertical-align: middle; text-align: center;">${orderList.orderId }</td>
						<td style="vertical-align: middle; text-align: center;">${orderList.userName }</td>
						<td style="vertical-align: middle; text-align: center;">${orderList.payment }</td>
						<td style="vertical-align: middle; text-align: center;">
						<fmt:parseDate value="${ orderList.orderDate }" pattern="yyyy-MM-dd'T'HH:mm" var="time"/>
						<fmt:formatDate value="${time }" pattern="yyyy.MM.dd HH:mm"/>
						</td>
						<td style="vertical-align: middle; text-align: center;">${orderList.count }</td>
						<td style="vertical-align: middle; text-align: center;">
						<c:if test="${orderList.status == '배송준비중' }">
							<span class="badge bg-primary rounded-pill">${orderList.status}</span>  
						</c:if>
						<c:if test="${orderList.status == '배송중' }">
							<span class="badge bg-success rounded-pill">${orderList.status}</span>  
						</c:if>
						<c:if test="${orderList.status == '배송완료' }">
							<span class="badge bg-secondary rounded-pill">${orderList.status}</span>  
						</c:if>
						</td>
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