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
#nav2>a {
  display: block; /* a태그는 글자성격 = inline */
  float: left;
  font-size: 30px;
  font-weight: 900;
  line-height: 80px;
  padding: 0 30px;
}
#nav2>ul {
  float: right;
}
#nav2>ul li {
  float: left;
  padding: 0 30px;
  line-height: 80px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<header>
	<div>
		<nav id="nav2">
		    <a href="#">logo</a>
		    <ul>
		      <li><a href="#">menu1</a></li>
		      <li><a href="#">menu2</a></li>
		      <li><a href="#">menu3</a></li>
		      <li><a href="#">menu4</a></li>
		      <li><a href="#">menu5</a></li>
		    </ul>
	    </nav>
	</div>
</header>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>