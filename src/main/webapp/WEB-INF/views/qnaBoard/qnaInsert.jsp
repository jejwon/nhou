<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<%@ include file = "../includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<div class="container" style="background-color:pink;">
		<h1>문의작성</h1>
		<form action="" method="post">
		<select class="form-select" aria-label="Default select example" name="qnaCategory">
		  <option selected>질문종류</option>
		  <option value="0">배송</option>
		  <option value="1">교환/환불</option>
		  <option value="2">기타</option>
		</select>
		
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingInput" placeholder="" name="title">
		  <label for="floatingInput">제목</label>
		</div>
		
		<div class="form-floating">
		  <textarea class="form-control" placeholder="" id="floatingTextarea" name="content" style="resize: none; height: 150px;"></textarea>
		  <label for="floatingTextarea">문의 내용</label>
		</div>
		
		<%-- <input readonly type="text" value="${member_userId }" name="member_userId"> --%>
		<input id="insertSubmit" type="submit" value="등록">
		</form>
		<c:url value="/main/list" var="listLink"/>
		<a href="${listLink }">
			<input type="submit" value="취소">
		</a>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>

</script>
</body>
</html>