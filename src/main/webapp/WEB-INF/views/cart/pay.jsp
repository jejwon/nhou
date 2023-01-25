<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
	
	<div class="container">
	<h1> ${member.userId}의 장바구니</h1>
	

			<h1>주문 상품 정보</h1>
			<table>			
				<thead>
					<tr>
						<th>#</th>
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>합계</th>
					
					</tr>
				</thead>
			
				<tbody id="itemContainer">
				<c:set var = "total" value = "0" />
					<c:forEach items="${cartList }" var="cart" varStatus="status">
					
						<c:if test="${member.userId == cart.member_userId }">
							<tr class="tr">
								<td>	
								<!--  <input name="userId" type="text" value="${cart.member_userId }" readonly>		-->			
								<input name="cartId" type="text" value="${cart.cartId }" readonly>
								</td>
								<td>${cart.productName}</td>
								<td><input type="text"   name="price" value="${cart.price}" readonly>원</td>
								<td>
								<input type="number" name="count"  value="${cart.count }" readonly> 
								</td> <!-- 수량 조절 -->
								<td>
								<input type="text" name="sum" value="${cart.price * cart.count}" readonly>
								</td>
								
							</tr>
							<c:set var= "total" value="${total + cart.price * cart.count}"/>	
						</c:if>	
					</c:forEach>

				</tbody>	 
		
			</table>
			
			<h1>배송 정보</h1>
			
		<table>			
				<tr>
					<td>주문인</td>	
					<td>${member.userName }</td>					
				</tr>		
				<tr>
					<td>기본 배송지/변경 전 값</td>	
					<td>
					<input type="text" value="${member.postal}" name="postal">
					<input type="text" value="${member.address1 }" name="address1">
					<input type="text" value="${member.address2 }" name="address2">
					</td>					
				</tr>
				<tr>
					<td>배송지변경</td>	
					<td>주소 api 넣어주세요</td>					
				</tr>
				
				<tr>
					<td>전화번호</td>	
					<td><input type="text" value="${member.phone }" name="receivePhone"></td>					
				</tr>
				<tr>
					<td>이메일</td>	
					<td>${member.email }</td>					
				</tr>		
		</table>
			
		</div>		

		<h1>합계</h1>	
			<div>
				배송비: 무료배송
			</div>
			<div>
				최종결제금액: <input type="text" name="payment" value="<c:out value="${total}"/>">
			</div>

	
		<form action=""></form>
		<a href="">주문하기</a>

	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
</body>
<script>
const ctx = "${pageContext.request.contextPath}";

</script>
</html>