<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테리어 소품은 아트리움에서!</title>
<style type="text/css">
/* 폰트체 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&family=Nunito:wght@200;300&display=swap');

	*{padding:0;margin:0}
	ul,ol{list-style:none}
	/* a{text-decoration:none;color:#fff;font-size:15px} */
	nav{width:80%;overflow:hidden;height:155px;background-color:#fff;margin:0px auto}
	
	#loginBar {
		height: 30px;
		float: right;
		width: 100%;
		position: relative;
		font-family: 'Nunito', sans-serif;
		font-weight: bold;
	}
	
	#loginBar>ul {
		display: inline-block;
		float: right;
	}
	
	#loginBar>ul li {
		float: left;
		line-height: 30px;
		list-style-type: none;
		margin: 0 0 5px 5px;
		font-size: 13px;
	}
	
	#loginBar>a {
		display: block;
		position: relative;
		left: 10px;
		font-size: 10px;
	}
	
	#loginBar a {
		text-decoration: none;
		color: #333333;
	}
	
	#loginBar a:hover {
		background-color: #D3D3D3;
		color: #333333;
		font-weight: bolder;
	}
	
	#menu-top > li > .qna::after {
		content: "|";
		padding-left: 5px;
	}
	#menu-top > li > .info::after {
		content: "|";
		padding-left: 5px;
	}
	#menu-top > li > .j::after {
		content: "|";
		padding-left: 5px;
	}
	#menu-top > li > .mp::after {
		content: "|";
		padding-left: 5px;
	}
	#menu-top > li > .c::after {
		content: "|";
		padding-left: 5px;
	}
	#menu-top > li > .co::after {
		content: "|";
		padding-left: 5px;
	}
	#menu-top > li > .lout::after {
		content: "|";
		padding-left: 5px;
	}
	#menu-top > li > .lin::after {
		content: "|";
		padding-left: 5px;
	}
	
	#menu-top>li {
		line-height: 16px;
	}
	
	#nav3 {
		width: 100%;
		position: relative;
		text-align: center;
		border-bottom: solid;
		border-bottom-width: 1px;
		border-bottom-color: #D3D3D3;
		font-family: 'Nunito', sans-serif;
		font-weight: bold;
	}
	
	#nav3>a {
		line-height: 100px;
		display: block;
		font-weight: 900;
		position: absolute;
		left: 30px;
		font-size: 30px;
	}
	
	#nav3 a {
		text-decoration: none;
		color: #000;
	}
	
	#nav3>ul {
		display: inline-block;
	}
	
	#nav3>ul li {
		float: left;
		line-height: 40px;
		padding: 0 30px;
		margin-bottom: 10px;
	}
	
	.home {
		border-bottom: solid;
		border-bottom-width: 1px;
		border-bottom-color: #000;
		padding-bottom: 15px;
	}
	
	#menu-top > li > .lout {
		font-weight: bold;
	}
	
	
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&family=Nunito:wght@200;300&display=swap" rel="stylesheet">
</head>
<body>
	<sec:authorize access="isAuthenticated()">
		<h1>${member.userId } 로그인됨!</h1>
	</sec:authorize>
	
	<!-- 로그인시 보이는 메뉴 설정 -->
	<sec:authorize access="isAuthenticated()" var="loggedIn"/>
	<sec:authentication property="name" var="username"/>
	<div id="wrap">
		<div id="header">
			<div id="loginBar">
				<ul id="menu-top"  class="top">
				<c:if test="${not loggedIn }">
					<li><a class="lin" href="/member/login" >LOGIN</a></li>
					<li><a class="j" href="/member/join">JOIN</a></li>
				</c:if>
				<c:if test="${loggedIn }">
					<li><a class="mp" href="/myPage/myPageList">MYPAGE</a></li>
					<li><a class="lout" href="/member/logout" >LOGOUT</a></li>
				</c:if>	
					<li><a class="c" href="/cart/cartList">CART</a></li>
				</c:if>	
					<li><a class="co" href="/board/boardList">COMMUNITY</a></li>
				<c:if test="${loggedIn }">
				</c:if>	
					<li><a class="qna" href="/qnaBoard/qnaList">QnABOARD</a></li>
				<c:if test="${member.userId == 'admin' }">
					<li><a class="info" href="/admin/memberInfo">MEMBER_INFO</a></li>
				</c:if>
				<c:if test="${member.auth == 2 }">
					<c:url value="/myPage/mySellerList" var="mySellerListLink">
						<c:param name="userId" value="${member.userId }"></c:param>
					</c:url>
					<li><a class="dash" href="${mySellerListLink }">DASHBOARD</a></li>
				</c:if>
				</ul>
			</div>
			
				
			<nav id="nav3">
				<div class="home">
					<a href="/main/list">
						<img src="https://ifh.cc/g/PQ7QMk.png" alt="">
					</a>
				</div>
			   	<ul class="menu-bottom">
			   		<li><a href="/store/storeRegister">상품등록</a></li>
				  	<li><a href="/store/storeList">NEW</a></li>
					<li><a href="#">FURNITURE</a></li>
					<li><a href="#">BEDDING</a></li>
					<li><a href="#">LIVING FABRIC</a></li>
					<li><a href="#">KITCHEN</a></li>
					<li><a href="#">DECO</a></li>
					<li><a href="#">PETS</a></li>
			    </ul>
			</nav>
		</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
</body>
</html>