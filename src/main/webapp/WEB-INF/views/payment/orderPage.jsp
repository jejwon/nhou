z<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	<input type="text" name="userId" value="${member.userId }">
	<input type="text" name="orderId" value="${order.orderId }">
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




</script>
</body>
</html>