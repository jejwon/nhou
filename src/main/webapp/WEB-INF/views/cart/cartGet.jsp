<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
	<h1> ${member.userId}의 장바구니</h1>
	
				
	<div class="wholeCartList"></div> 
	
	<!-- 장바구니 리스트 -->
	<div class="wholeCartPrice"></div>
	<!-- 장바구니 가격 합계 -->
	
	<!-- 장바구니 정보 -->
	<div class="wholeCartCount">
		<table>
			<thead>
				<tr>
					<th>#</th>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>합계</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody id="itemContainer">
			<c:set var="total" value="0"/>
			<c:set var="count" value="0"/>
				<c:forEach items="${cartList }" var="cart" varStatus="status">
					<tr class="tr">
						<td><div class="check"><input type="checkbox" name="buy">&nbsp;</div> </td>
						<td>${cart.productName}  </td>
						<td><input type="text"   name="price" value="${cart.price}">원</td>
						<td>
							<input type="number" name="count" min="1" max="100" value="${cart.count }"> 
						</td> <!-- 수량 조절 -->
						<td><input type="text" name="sum" value="" ></td>
						<td><button id="checkedCartDelete" data-cart-id="${cart.cartId}">삭제</button> </td>
						<%-- <td><input type="text" name="cartId" value=${cart.cartId }> </td> --%>
					</tr>	
				<%-- 	<c:set var="total" value="${total + (cart.price * cart.count)}"/>
					<c:set var="count" value="${count + cart.count }"/> --%>
				</c:forEach>
				
			</tbody>	 
		</table>
</div>		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>



</body>
</html>