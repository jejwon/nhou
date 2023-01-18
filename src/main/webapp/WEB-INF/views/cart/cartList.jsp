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

<%-- 
	<input type="hidden" name="member_userId" value="${member.userId}">
	<input type="hidden" name="cartId" value="${cart.cartId }">
	 --%>
	 

<form name="cartListForm" action="" id="cartListForm" method="post" >
<div class="container">
	<input type="hidden" name="cartId" value="${cart.cartId }">
	<div class="cartDiv" id="cart">
		<div class="rowHead">
			<div class="subHead">
				<div class="check">선택</div>
				<div class="productName">상품명</div>
			</div>
			<div class="subHead">
				<div class="cartPrice">가격</div>
				<div class="count">수량</div>
				<div class="sum">합계</div>
			</div>
			<div class="subHead">
				<div class="cartDelete">삭제</div>
			</div>
			<div class="split"></div>
		</div>
		
		<div class="cartItem">
			<div class="subBody">
				<div class="check"><input type="checkbox" name="buy" value="" checked="" onclick="javascript:cart.checkItem();">&nbsp;</div>
				<div class="productName">
					<span>${cart.productName }</span>
				</div>
			</div>
		</div>
		 <div class="subBody">
         	<div class="cartPrice"><input type="hidden" name="price" id="price1" class="price1" value="">${cart.price }</div>
                        <div class="num">
                            <div class="updown">
                                <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="2" onkeyup="javascript:basket.changePNum(1);">
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-up up"></i></span>
                                <span onclick="javascript:basket.changePNum(1);"><i class="fas fa-arrow-alt-circle-down down"></i></span>
                            </div>
                        </div>
                        <div class="sum"></div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd"><a href="javascript:void(0)" class="abutton" onclick="javascript:basket.delItem();">삭제</a></div>
                    </div>
                </div>
             </div>
           
            <div class="right-align basketrowcmd">
                <a href="javascript:void(0)" class="abutton" onclick="javascript:cart.delCheckedItem();">선택상품삭제</a>
                <a href="javascript:void(0)" class="abutton" onclick="javascript:cart.delAllItem();">장바구니비우기</a>
            </div>
    
            <div class="bigtext right-align sumcount" id="productCount">상품갯수: ${cart.count }</div>
            <div class="bigtext right-align box blue summoney" id="productSum">합계금액: ${cart.count * cart.price }</div>
    
            <div id="goorder" class="">
                <div class="clear"></div>
                <div class="buttongroup center-align cmd">
                    <a href="javascript:void(0);">선택한 상품 주문</a>
                </div>
    </div><!-- 전체 컨테이너 -->
</form>






<form action="" id="cartGoPayForm" method="post">
	<div class="wholeCartList"><span>장바구니</span></div> 
	<input type="hidden" name="cartId" value="${cart.cartId }">
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


				<input type="hidden" name="userId" value="${member.userId }">
			<button class="btn btn-outline" id="cartGoPayButton">결제하기</button>	
		</div>
	</form>  


		<!-- 수량 조정 form -->
			<%-- <form action="/cart/cartModify" method="post" class="countChangeForm">
				<input type="hidden" name="cartId" class="changeCartId">
				<input type="hidden" name="count" class="changeCount">
				<input type="hidden" name="userId" value="${member.userId}">
			</form> --%>
</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
const ctx = "${pageContext.request.contextPath}";
//수량변경 같이 넘어가야됨 ㄱㄷ!!
document.querySelector("#cartGoPayButton").addEventListener("click", function(){
	document.querySelector("#cartGoPayForm").submit();
})
//이벤트 리스너 등록
document.addEventListener("changeLoad", function(){
	
})
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

</script>
</html>