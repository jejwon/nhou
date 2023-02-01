<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap');
/* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: #DCC1B0;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
    font-family: 'Nunito', sans-serif;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #000;
  }
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <span style="font-family: 'Nunito', sans-serif; font-weight: bolder;">판매자 관리 페이지</span>
      </li>
      
      <li>
		<c:url value="/store/storeRegister" var="registerLink"></c:url>
		<a href="${registerLink}" >
			<span style="font-family: 'Nunito', sans-serif; font-weight: bold;"><i class="fa-solid fa-cart-shopping"></i>&nbsp;상품 등록</span>
		</a>
      </li>
	  
      <li>
      	<c:url value="/myPage/mySellerList" var="mySellerListLink">
      		<c:param name="userId" value="${member.userId }"></c:param>
      	</c:url>
		<a href="${mySellerListLink }">
		<span style="font-family: 'Nunito', sans-serif; font-weight: bold;"><i class="fa-solid fa-barcode"></i>&nbsp;등록한 상품</span>
		</a>
	  </li>
	
      <li>
      	<c:url value="/seller/sellerList" var="orderListLink">
      	</c:url>
      		<a href="${orderListLink }">
      			<span style="font-family: 'Nunito', sans-serif; font-weight: bold;"><i class="fa-regular fa-clipboard"></i>&nbsp;판매 현황</span>
      		</a>
      </li>
    </ul>
  </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>