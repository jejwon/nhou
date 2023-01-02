<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<%@ include file = "../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container{
	width: 90%;
	height: 150%;
    margin: 10px auto;
}
#memberInfo{
	border: 1px solid red;
	border-radius: 10px;
    float: left;
    width:30%;
    height: 50%;
    box-sizing: border-box;
    
}
#orderHistory{
	border: 1px solid green;
	border-radius: 10px;
    float: left;
    margin-left: 5%;
    width:30%;
    box-sizing: border-box;
}
#center{
	border: 1px solid blue;
	border-radius: 10px;
    float: right;
    width:30%;
    box-sizing: border-box;
}
</style>
<meta charset="UTF-8">
<title>memberInfo</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<div class="container" style="background-color: pink;">
		<div id="inner" class="container-md">
			<h1>마이페이지</h1>
			<!--  본인만 들어갈 수 있는 권한 설정하세요-->
			
		<c:url value="/myPage/myPageModify" var="modifyLink"></c:url>
		<div id="memberInfo" class="container-sm" style="">
			<i class="fa-sharp fa-solid fa-user"></i><br>
			<a href="${modifyLink }">${member.nickName }님 회원정보</a>			
		</div>
		
		
		<div id="orderHistory" class="container-sm"style="">
		<i class="fa-sharp fa-solid fa-cart-shopping"></i><br>
		<a href="/myPage/myPageOrderList">주문내역</a>
		
		</div>
		
		<div id="center" class="container-sm"style="">
		<i class="fa-solid fa-headset"></i><br>
		<a href="/myPage/myPageQnA">QnA</a>
	
		</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>


</script>
</body>
</html>