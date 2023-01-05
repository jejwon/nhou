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
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<div class="container">


<h1>${board.boardId }번 게시물 수정</h1>
<form id="modifyForm" action="" method="post">
	<input type="text" name="boardId" value="${board.boardId }" readonly="readonly"> <br>
	
	카테고리
	<select name="boardCategory" id="">
		<option name="houses" value="1">집들이		
		<option name="tip" value="2">꿀팁전수		
		<option name="chat" value="3">잡담	
	</select> <br>
	제목 <input type="text" name="title" value="${board.title }"> <br>
	내용 <input type="text" name="content" value="${board.content }"> <br>
	
	<input type="submit" value="수정완료" data-bs-target="#modifyModal">
</form>

	<!-- 삭제버튼 -->
	<c:url value="/board/boardRemove" var="removeLink"></c:url>
		<form id="removeForm" action="${removeLink }" method="post">
		</form>
			<input type="submit" value="삭제" data-bs-target="#removeModal">
</div> <!-- 전체 컨테이너 -->

<!-- 수정 모달 -->
	<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">수정 확인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        수정하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button id="modifyConfirmBtn" type="button" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

	<!-- 삭제 모달 -->
	<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button id="removeConfirmBtn" type="button" class="btn btn-primary">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
// 수정 버튼 누르면 수정하도록 form으로 전송
document.querySelector("#modifyConfirmBtn").addEventListener("click", function() {
	document.querySelector("#modifyForm").submit();
});

// 삭제 버튼 누르면 삭제하도록 form으로 전송
document.querySelector("#removeConfirmBtn").addEventListener("click", function() {
	document.querySelector("#removeForm").submit();
});
</script>
</body>
</html>