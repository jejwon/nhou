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
<h1>상세 수정페이지</h1>
<div class="container-sm">
<p><span>주문자</span></p>


<div class="productInfo">

</div>

<div class="orderInfo">
<span></span>
<%-- <form role="form" method="post" class="statusForm">
	<input type="hidden" name="orderId" value="${orderList.orderId }">
	<input type="hidden" name="status" value="" class="status">
	<button type="button" class="status1">배송중</button>
	<button type="button" class="status2">배송완료</button>
						
	<script type="text/javascript">
		$(".status1").click(function() {
		$(".status").val("배송중");
			run();
		});
							
		$(".status2").click(function() {
		$(".status").val("배송완료");
			run();
		});
							
		function run() {
		$(".statusForm").submit();
		}
	</script>
</form> --%>
</div>
						
						
						
						
</div> <!-- 전체 div -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>