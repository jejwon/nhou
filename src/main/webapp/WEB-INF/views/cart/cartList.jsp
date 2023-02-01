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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style type="text/css">
/* 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap');
input:focus {
    outline: none;
  }
 /* 바디 */
.container {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>


<section class="bg-light p-5">	
<form action="${pageContext.request.contextPath}/cart/pay" id="orderForm">
	<div class="container">
				
		<div class="wholeCartList"></div> 
		
		<!-- 장바구니 리스트 -->
		<div class="wholeCartPrice"></div>
		<!-- 장바구니 가격 합계 -->
	
		<!-- 장바구니 정보 -->
	
		<div class="wholeCartCount">
			<input name="userId" type="hidden" value="${cart.member_userId }" >					
			<input name="cartId" type="hidden" value="${cart.cartId }">							
			<table class="table">
				<thead>
					<tr>
						
						<th>상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>합계</th>
						<th>삭제</th>
					</tr>
				</thead>
			
				<tbody id="itemContainer">
				
					<c:forEach items="${cartList }" var="cart" varStatus="status">
					
						<c:if test="${member.userId == cart.member_userId }">
							<tr class="tr">
								

								<td><input type="text" name="productName" value="${cart.productName}" style="border:none; width:150px;"readonly></td>
								<td><input type="text"  name="price" value="${cart.price}" style="border:none; width:150px;"readonly>원</td>
								<td>
								<input type="number" name="count" min="1" max="10" value="${cart.count }" > 
								<a class="countModifyButton" data-cart-id="${cart.cartId}" style="text-decoration:underline; color:black;">변경</a>

								</td> <!-- 수량 조절 -->
								<td>
								<input type="text" name="sum" value="${cart.price * cart.count}" style="border:none; width:150px;" readonly>원
								</td>
								<td>

								<div style="background-color: #D5D4D1; width:80px; text-align: center;"><a class="itemDeleteButton" data-cart-id="${cart.cartId}"  style="text-decoration:none; color:black;">삭제</a></div>

								</td>
							</tr>	
						</c:if>	
					</c:forEach>

				</tbody>	 
		
			</table>
		</div>		
		
		<div id="button1">
			<button type="button" id="orderSubmit" class="btn btn-outline-primary" style="background-color: #DCC1B0; border-radius:0px; border:none; color: black;">주문하기</button>
		</div>

</div>
</form>
</section>
<!-- 수량 변경 저장됨 -->
<form action="${pageContext.request.contextPath}/cart/cartModify" method="post" class="countModifyForm">
	<input type="hidden" name="cartId" class="modifyCartId"/>
	<input type="hidden" name="count" class="modifyCount"/>
	<input type="hidden" name="userId" value="${cart.member_userId }"/>
	
</form>
<!-- 상품 개별 삭제 -->
<form action="${pageContext.request.contextPath}/cart/cartDelete" method="post" class="itemDeleteForm">
	<input type="hidden" name="cartId" class="deleteCartId"/>
	<input type="hidden" name="userId" value="${cart.member_userId }"/>	
</form>



</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<script>
const ctx = "${pageContext.request.contextPath}";

// 전송
document.querySelector("#orderSubmit").addEventListener("click", function(){
	document.querySelector("#orderForm").submit();
})	


//수량 변경 input 클릭시 옆에 합계 변함
	$(function(){
		/* console.log( '${cart}' ); */
		
		$('input[name=count]').on('keyup input', function(){
			const count = $(this).val();
			const price = $(this).parent().prev().children().val();
			
			const sum = count * price;
			
			$(this).parent().next().children().prop('value', sum);
			
			//총상품개수, 총결제금액				
		})
	})

//수량 변경 버튼
$(function(){
	$('.countModifyButton').on('click', function(){ //버튼은 수량변경 안됨
	
			const cartId = $(this).data('cartId');
			const count = $(this).parent('td').find('input').val();
		
			$('.modifyCartId').val(cartId);
			$('.modifyCount').val(count);
			$('.countModifyForm').submit();
			//console.log(cartId);
	
	})
	
})

//상품 삭제 버튼
$(function(){
	$('.itemDeleteButton').on('click', function(){ 
	
			const cartId = $(this).data('cartId');
		
			$('.deleteCartId').val(cartId);
			$('.itemDeleteForm').submit();
			//console.log(cartId);
	
	})
	
})

</script>	
</html>


















