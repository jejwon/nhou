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
<c:forEach items="${orderList }" var="order" varStatus="status">
<c:if test="${member.userId == order.member_userId }">
	<input type="hidden" name="orderId" value="${order.orderId }">
	<input type="text" name="member_userId" value="${order.member_userId }">
	<input type="text" name="address1" value="${order.address1 }">
	<input type="text" name="address2" value="${order.address2 }">
	<input type="text" name="postal" value="${order.postal }">
	<input type="text" name="receiverName" value="${order.receiverName }">
	<input type="text" name="receiverPhone" value="${order.receiverPhone }">
	<input type="text" name="payment" value="${order.payment }">
	<input type="text" name="product_productId" value="${order.product_productId }">
	
</c:if>
</c:forEach>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> <!-- jQuery -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> <!-- iamport.payment.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";

// 아임포트 api
IMP.init('imp13488808');

	var merchant_uid = $('input[name=orderId]').val();
	var name = $('input[name=product_productId]').val();
	var buyer_addr = $('input[name=address1]').val();
	var buyer_name = $('input[name=receiverName]').val();
	var buyer_tel = $('input[name=receiverPhone]').val();
	var amount = $('input[name=payment]').val();
	var buyer_postcode = $('input[name=postal]').val();

$(function() {
	IMP.request_pay({
		pg: "kakaopay",
		pay_method: "card",
		merchant_uid: merchant_uid,
		name: "결제테스트",
		amount: amount,
		buyer_name: buyer_name,
		buyer_email: "ONOFF@ONOFF.com",
		buyer_addr: buyer_addr,
		buyer_tel: buyer_tel,
		buyer_postcode: buyer_postcode
	}, function (rsp) {
		console.log(rsp);
		
		if(rsp.success) { // 결제 성공시
			var msg = "결제 완료";
			var result = {
				"orderId" : rsp.merchant_uid,
				"member_userId" : rsp.buyer_name
			}
			console.loog("결제 완료" + msg);
			
			$.ajax({
				url: "/payment/orderResult",
				type: "POST",
				data: JSON.stringify(result,
						['merchant_uid', 'buyer_name']),
				contentType: "application/json; charset=UTF-8",
				dataType: "json",
				success: function(res) {
					alert("결제 성공");
				}
			})
		} else {
			alert("결제 실패");
		}
	});
});

</script>
</body>
</html>