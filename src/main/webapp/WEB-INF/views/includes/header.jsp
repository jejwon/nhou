<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{padding:0;margin:0}
	ul,ol{list-style:none}
	a{text-decoration:none;color:#fff;font-size:15px}
	nav{width:80%;overflow:hidden;height:80px;background-color:#fff;margin:0px auto}

	
	#nav3 {
		width: 100%;
		position: relative;
		text-align: center;
	}
	
	#nav3>a {
		line-height: 80px;
		display: block;
		font-weight: 900;
		position: absolute;
		left: 30px;
		font-size: 30px;
	}
	
	#nav3>ul {
		display: inline-block;
	}
	
	#nav3>ul li {
		float: left;
		line-height: 80px;
		padding: 0 30px;
	}
	
	.clear {
		clear: both;
	}
	
	a.active-color { color: gold; }
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="includes/header.jsp">
</head>
<body>
	<div id="wrap">
		<div id="header">
			<nav id="nav3">
			    <a href="/main/main">Atrium</a>
			    <ul>
			      <li class="btn1"><a href="/board/boardList">커뮤니티</a></li>
			      <li class="btn1"><a href="#">스토어</a></li>
			      <li class="btn1"><a href="#">고객문의</a></li>
			      <li class="btn1"><a href="#">로그인/로그아웃</a></li>
			      <li class="btn1"><a href="#">장바구니</a></li>
			    </ul>
			</nav>
		</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
$("a").click(function() {
    toggleClass(".active-color");
});
</script>
</body>
</html>