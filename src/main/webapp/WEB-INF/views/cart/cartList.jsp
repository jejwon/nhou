<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.*" %>

<c:set var="ctx" value="${ pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 담기(수량)</title>
<style type="text/css">

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>


	<h1> ${member.userId}의 장바구니</h1>
	<div class="container">
		<ul>
			<li>
				<div class="allCheck1">
					<input type="checkbox" name="allCheck" id="allCheck" /><label
						for="allCheck">모두 선택</label>

					<script>
						$("#allCheck").click(function() {
							var chk = $("#allCheck").prop("checked");
							if (chk) {
								$(".chBox").prop("checked", true);
							} else {
								$(".chBox").prop("checked", false);
							}
						});
					</script>
				</div>

				<div class="delBtn">
					<button type="button" class="selectDelete_btn">선택 삭제</button>
				</div>

			</li>

			<c:forEach items="${cartList}" var="cartList">
				<li>
					<div class="checkBox1">
						<input type="checkbox" name="chBox" class="chBox"
							data-cartId="${cartList.cartId}" />

						<script>
							$(".chBox").click(function() {
								$("#allCheck").prop("checked", false);
							});
						</script>
					</div>

					<div class="gdsInfo">
						<p>
							<span>상품명</span>${cartList.productName}<br /> <span>개당 가격</span>${cartList.price}
							원<br /> <span>구입 수량</span>${cartList.count} 개<br /> <span>최종
								가격</span>${cartList.price * cartList.count} 원
						</p>

						<div class="delete">
							<button type="button" class="delete_btn"
								data-cartId="${cartList.cartId}">삭제</button>
						</div>
					</div>
				</li>
			</c:forEach>
		</ul>
	</div>
</body>
<script>
const ctx = "${pageContext.request.contextPath}";


</script>	
</html>


















