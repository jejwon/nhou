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
	<!-- <form action="post" id="cartGoPay"> -->

	<input type="hidden" name="member_userId" value="${member.userId}">
	<input type="hidden" name="cartId" value="${cart.cartId }">
	
<div class="container">
	
	<div class="wholeCartList"><span>장바구니</span></div> 
	<!-- 장바구니 리스트 -->
	<div class="wholeCartPrice"></div>
	<!-- 장바구니 가격 합계 -->
	
	<!-- 장바구니 정보 -->
	<div class="wholeCartCount">
		<table class="table">
<%-- 			<caption>표 제목</caption> --%>
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
<%-- 			<caption>표 내용</caption> --%>
			<tbody id="itemContainer">
			<c:set var="total" value="0"/>
				<c:forEach items="${cartList }" var="cart" varStatus="status">
					<tr>
						<%-- <td>${cart.product_productId }      </td> --%>					
						<td>${cart.cartId }  </td>
						<td>${cart.productName}  </td>
						<td>${cart.price}원</td>
						<td>
						<input id="countChange" type="number" min="1" max="100" value="${cart.count }"/>
						<button id="countChangeBtn" data-cart-id="${cart.cartId}">변경</button></td> <!-- 수량 조절 -->
						<td><span class="red_color" >${cart.price * cart.count} 원</span><br></td>
						<td><button id="productDelete1"data-cart-id="${cart.cartId}">삭제</button></td>
					</tr>
					<c:set var="total" value="${total + (cart.price * cart.count)}"/>
				</c:forEach>
				<tr>
				<td>
				총결제금액
				<c:out value="${total }"/>
				</td>
				</tr>
			</tbody>	

		</table>
		<!-- 수량 조정 form -->
			<form action="/cart/cartModify" method="post" class="countChangeForm">
				<input type="hidden" name="cartId" class="changeCartId">
				<input type="hidden" name="count" class="changeCount">
				<input type="hidden" name="userId" value="${member.userId}">
			</form>
			
			<button class="btn">결제하기</button>	
	</div>
</div>
<!-- </form> -->
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
const ctx = "${pageContext.request.contextPath}";

<!--const 변수는 재할당 안됨-->
/* function listCart(){
	const cartId = document.querySelector("#cartId").value();
	
	fetch(`\${ctx}/cart/cartList/\${cartId}`)
	.then(res => res.json())
	.then(list => {
		const itemContainer = document.querySelector("#itemContainer");
		itemContainer.innerHTML = "";
	})
}


//삭제 클릭 시 카트 속 아이템 하나 삭제
document.querySelector("#productDelete1").addEventListener("click", function(){
	deleteCart(this.dataset.cartId);
})
//삭제 버튼에 cartId 옮기기
document.querySelector("#productDelete1").addEventListener("click", function(){
	//console.log(this.dataset.replyId + "삭제버튼 클릭됨"); //data-reply-id : attribute 속성
	document.querySelector("#productDelete1").setAttribute("data-cart-id", this.dataset.cartId);
});	

function deleteCart(cartId) {
	fetch(ctx + "cart/cartDelete/" + cartId, {
		method : "delete"
	})
	
}
 */

//수량 처리
/* 수량버튼 */
$("#countChange").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
 $("#countChange").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
});
 /* 수량 수정 버튼 */
 $("countChangeBtn").on("click", function(){
	 let cartId = $(this).data("cartId");
		let count = $(this).parent("td").find("input").val();
		$("#countChange").val(cartId);
		$("#countChangeBtn").val(count);
		$("#countChangeForm").submit();
 	
 });
</script>
</html>