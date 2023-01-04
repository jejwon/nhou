<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>

<!DOCTYPE html>
<html>
<style>

</style>
<head>
<meta charset="UTF-8">
<title>개별문의</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
	<div class="container" style="background-color:pink;">

		<h1>문의보기</h1>
		
		  <c:choose>
		  	<c:when test="${qna.qnaCategory == 0 }">
		  	<input type="text" readonly value="배송">
		  	</c:when>
		  	<c:when test="${qna.qnaCategory == 1 }">
		  <input type="text" readonly value="교환/환불">
		  	</c:when>
		  	<c:when test="${qna.qnaCategory == 2 }">
		  	<input type="text" readonly value="기타"> 	
		  	</c:when>
		  </c:choose>
			<input type="text" readonly value="${qna.nickName }">
		
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingInput" placeholder="" name="title">
		  <label for="floatingInput">${qna.title }</label>
		</div>
		
		<div class="form-floating">
		  <textarea class="form-control" placeholder="" id="floatingTextarea" name="content" style="resize: none; height: 150px;"></textarea>
		  <label for="floatingTextarea">${qna.content }</label>
		</div>
		
		
		<%-- <input readonly type="text" value="${member_userId }" name="member_userId"> --%>
		<%-- <c:if test="${qna.member_userId == username}"> </c:if>--%>

		
			<c:url value="/qnaBoard/delete" var="deleteLink"/>
			<form id="deleteForm" action="${deleteLink }" method="post">
				<input type="hidden" name="qnaId" value="${qna.qnaId }">
			</form>
			<input id="deleteSubmit" type="submit" value="삭제">
		
		<c:url value="/main/list" var="listLink"/>
		<a href="${listLink }">
			<input type="submit" value="홈으로">
		</a>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
//삭제 버튼 클릭하면 삭제 form 전송
document.querySelector("#deleteSubmit").addEventListener("click", function(){
	document.querySelector("#deleteForm").submit();
})
</script>
</body>
</html>