<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style>
/* 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap');
/* 바디 */
.container {
	font-family: 'Noto Sans KR', sans-serif;
}
/* 주문내역 버튼 */
#button1 {
	text-align: left;
	position: relative;
}
/* 페이지 버튼 */
#button1 #modifyBtn {
	display: inline-block;
	position: absolute;
	background-color: #DCC1B0;
	width: 200px;
	height: 300px;
	font-size: 24px;
	left: 220px;
}
/* 주문내역 버튼 */
#button2 {
	text-align: center;
	position: relative;
}
#button2 #orderHistoryBtn {
	display: inline-block;
	position: absolute;
	background-color: #DCC1B0;
	width: 200px;
	height: 300px;
	font-size: 24px;
	right: 520px;
}  
/* 문의 버튼 */
 #button3 {
	text-align: right;
	position: relative;
} 
#button3 #myQnABtn {
	display: inline-block;
	position: absolute;
	background-color: #DCC1B0;
	width: 200px;
	height: 300px;
	font-size: 24px;
	right: 200px;
	
}

/* 판매자 대시보드 */
#button4 {
	text-align: right;
	position: relative;
}

#button4 .sellerBtn {
	display: block;
	background-color: #DCC1B0;
	width: 200px;
	height: 300px;
	
	
} 
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<section class="p-5">	
	<div class="container">
		<div id="inner" class="container-md">
			<h1>마이페이지</h1>
			<!--  본인만 들어갈 수 있는 권한 설정하세요-->
		
		<div id="button1">		
			<div class="modify">
				<c:url value="/myPage/myPageModify" var="modifyLink"></c:url>
				<a href="${modifyLink }">
				
				<button id="modifyBtn"class="btn btn-outline">
				<i class="fa-sharp fa-solid fa-user"></i><br>
				${member.nickName }님 회원정보</button>
				</a>			
			</div>
		</div>
		
		<div id="button2">		
			<div class="orderHistory">
				<c:url value="/myPage/myPageOrderList" var="myOrderLink"></c:url>
				<a href="${myOrderLink }">
				<button id="orderHistoryBtn"class="btn btn-outline">
				<i class="fa-sharp fa-solid fa-cart-shopping"></i><br>
				주문내역</button>
				</a>			
			</div>
		</div>
		
		<div id="button3">		
			<div class="myQnA">
				<c:url value="/myPage/myPageQnA" var="myQnALink"></c:url>
				<a href="${myQnALink }">
				<button id="myQnABtn"class="btn btn-outline">
				<i class="fa-solid fa-headset"></i><br>
				나의 문의</button>
				</a>			
			</div>
		</div>
		
		<%-- <div id="button4">		
			<div class="mySellerList">
				<c:url value="/myPage/mySellerList" var="mySellerListLink">
					<c:param name="userId" value="${member.userId }"></c:param>
				</c:url>
				<a href="${mySellerListLink }">
				<button id="mySellerBtn" class="btn btn-outline sellerBtn">
				<i class="fa-solid fa-money-bill-trend-up"></i><br>
				나의 판매목록</button>
				</a>			
			</div>
		</div> --%>
		
		</div>
	</div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>


</script>
</body>
</html>