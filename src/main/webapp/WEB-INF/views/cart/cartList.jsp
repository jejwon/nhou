<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 담기(수량)</title>
<style type="text/css">

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
	
	<h1> ${member.userId}의 장바구니</h1>
	<input type="hidden" name="member_userId" value="${member.userId}">
	<input type="hidden" name="cartId" value="${cart.cartId }">
	
<div class="container">
	
	<div class="wholeCartList"><span>장바구니</span></div> 
	<!-- 장바구니 리스트 -->
	<div class="wholeCartPrice"></div>
	<!-- 장바구니 가격 합계 -->
	
	<!-- 장바구니 정보 -->
	<div class="wholeCartCount">
		<table class="table1">
			<caption>표 제목</caption>
			<tbody>
				<tr>
					<th></th>
					<th></th>
					<th>상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>합계</th>
					<th>삭제</th>
				</tr>
			</tbody>
		</table>
		
		<table class="table2">
			<caption>표 내용</caption>
			<tbody>
				<c:forEach items="${cartList }" var="cart">
							<tr>
								<td>${cart.product_productId }      </td>
								<td>${cart.cartId }         </td>
								<td>${cart.productName}            </td>
								<td>${cart.count}            </td>
								
								
								<td >
									판매가 :<span class="red_color" id="">${cart.price * cart.count }원</span><br>	
								</td>
							</tr>
				</c:forEach>
				<tr>
				<td>
				결제 금액: 
				</td>
				</tr>
					</tbody>
				</table>
								
				<div id="inner"></div>
				<c:forEach items="${cartList }" var="cart">
				<div id="indiPrice">${cart.price * cart.count }</div>
				</c:forEach>
	</div>
</div>
</body>
<script>
const ctx = "${pageContext.request.contextPath}";

<!--const 변수는 재할당 안됨-->
var totalPrice = 0;
var indiPrice = document.querySelector("#indiPrice").value;

console.log(indiPrice);

document.getElementById("inner").innerHTML="쓸 내용";
</script>
</html>