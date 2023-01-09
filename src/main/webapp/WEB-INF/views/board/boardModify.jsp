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
.container-sm { 
	letter-spacing: -1px;
	font-size: 16px;
}

.categoryBox {
	text-align: left;
}

.categoryBox p {
	display: inline-block;
	color: #333;
	font-size: 20px;
	padding-left: 5px;
}

.categoryBox .categorySelect {
	display: inline-block;
	width : 100px;
	height: 40px;
	border: 0;
	outline:none;
	margin: 5px 0 15px 10px;
	font-size: 20px;
	font-weight: bold;
}

.categoryBox .categorySelect option {
	font-size: 16px;
	color: #666;
	font-weight: normal;
}

/* 본문 */
.boardModify input[type="text"] {
	padding: 10px;
	box-sizing: border-box;
}

.boardModifyWrap .content textarea {
	display: block;
	width: 100%;
	height: 200px;
	padding: 15px;
	box-sizing: border-box;
	border: 0;
	resize: vertical;
}

.boardModifyWrap {
	width: 80%;
	border-top: 2px solid #DCC1B0;
}

.boardModify .boardTitle, .boardModify .info {
	padding: 10px;
}

.boardModify .content {
	border-bottom: 1px solid #DCC1B0;
}

.boardModify .info dl {
	display: inline-block;
	width: 50%;
	vertical-align: middle;
}

.boardModify .boardTitle dl {
	font-size: 0;
}

.boardModify .boardTitle dt,
.boardModify .boardTitle dd,
.boardModify .info dt,
.boardModify .info dd {
	display: inline-block;
	vertical-align: middle;
	font-size: 15px;
}

.boardModify .info dt,
.boardModify .boardTitle dt {
	width: 60px;
}

.boardModify .boardTitle dd {
	width: calc(100% - 60px);
}

.boardModify .boardTitle input[type="text"] {
	width: 80%;
}

.boardModify .boardTitle input[type="text"],
.boardModify .info nput[type="text"] {
	padding: 10px;
	box-sizing: border-box;
}

.boardModify .info .nick {
	padding-right: 100px;
}

.boardModify .info .date {
	position: absolute;
	float: right;
}

.boardModify .info {
	position: relative;
}


.form {
	border-color: #E1E1E3;
	border-radius: 5px;
	border: 1px solid;
}

input:focus {
	outline: none;
	box-shadow: none;
}


</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>


<div class="container-sm">

<div class="boardWrap">
	<form id="modifyForm" action="" method="post">
		<input type="hidden" name="boardId" value="${board.boardId }" readonly="readonly"> <br>
		<input type="hidden" name="member_userId" value="${board.member_userId }" readonly="readonly"> <br>
		
		<div class="categoryBox">
			<p>카테고리</p>
			<select class="categorySelect" name="boardCategory" id="">
				<option name="houses" value="1">집들이		
				<option name="tip" value="2">꿀팁전수		
				<option name="chat" value="3">잡담	
			</select>
		</div>
		
		<div class="boardModifyWrap">
			<div class="boardModify">
				<div class="boardTitle">
					<dl>
						<dt>제목</dt>
						<dd><input class="form" type="text" name="title" value="${board.title }"></dd>
					</dl>
				</div>
			
			<div class="info">
				<dl>
					<dt>작성자</dt>
					<dd class="nick"><input class="form-control" type="text" name="nickName" value="${board.nickName }" readonly="readonly"></dd>
					<dt>작성일자</dt>
					<dd class="date"><input class="form-control" type="text" name="insertDatetime" value="${board.insertDatetime }" readonly="readonly"></dd>
				</dl>
				
				<div class="content">
					<textarea class="">${board.content }</textarea>
				</div>
			</div>
		</div>
		<input type="submit" value="수정완료" data-bs-target="#modifyModal">
	</form>

	<!-- 삭제버튼 -->
	<c:url value="/board/boardRemove" var="removeLink"></c:url>
		<form id="removeForm" action="${removeLink }" method="post">
		</form>
			<input type="submit" value="삭제" data-bs-target="#removeModal">
		</div>
		
	</div>
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