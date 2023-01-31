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
footer {
  margin-top: 100px;
  width: 100%;
  height: 90px;
  bottom: 0px;
  border-top: 1px solid #c4c4c4;
  padding-top: 15px;
  color: #808080;
  font-size: 11px;
  background-color: #ecf0f1;
}

footer a {
  margin: 0 20px 10px 20px;
  color: #808080; font-size: 11px;
  text-align: right;
}

footer div {
  margin-top: 0; margin-bottom: 0;
  text-align: center;
}

footer div span {
  margin-left: 20px;

}

#linkDiv {
	text-align: center;
}

.spans {
	margin-top: 20px;
	background-color: #ecf0f1;
	margin-bottom: 20px;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<footer>
	<c:url value="/qnaBoard/qnaList" var="qnaLink">
		<c:param name="page" value="1"/>
	</c:url>

    <div id="linkDiv">
        <a href='' target='_blank'>공지사항</a> |
        <a href='${qnaLink}' target='_blank'>고객문의</a> |
        <a href='' target='_blank'>소개</a> |
        <a href='' target='_blank'>채용</a> 
    </div>
    
    <div class="spans">
        <span>대표명: 아트리움</span><br/>
        <span>이메일 : ATRIUM@gmail.com</span><br/>
        <span>Copyright 2020. cocoder. All Rights Reserved.</span>
        <address>서울특별시 강남구 역삼동 하나로</address>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>