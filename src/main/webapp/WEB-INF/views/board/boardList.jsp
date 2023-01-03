<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style type="text/css">
/* 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap');

/* 카테고리 */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#categorySelect {
	text-align: center;
	margin: 60px;
}

#categorySelect .categoryBtn {
	border: 0;
	background: 0;
	font-size: 15px;
	margin: 0 20px;
}

#categorySelect .categoryBtn:hover {
	color: #CD7070;
	font-weight: bold;
	transition: 0.3s;
}

/* 바디 */
.container {
	font-family: 'Noto Sans KR', sans-serif;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>

<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<!-- 전체 컨테이너 -->
<section class="bg-light p-5">
<div class="container">
	<div id="boardTitle">
		<h1>커뮤니티 게시판</h1>
	</div>

	<!-- 카테고리 -->
 	<div id="categorySelect" class="">
		<c:url value="/board/boardList" var="listLink"></c:url>
		<form action="${listLink }">
			<button id="btn1" class="categoryBtn" name="boardCategory" value="">전체</button>
			<button id="btn2" class="categoryBtn" name="boardCategory" value="1">인테리어 자랑</button>
			<button id="btn3" class="categoryBtn" name="boardCategory" value="2">꿀팁 방출</button>
			<button id="btn4" class="categoryBtn" name="boardCategory" value="3">잡담</button>
		</form>
	</div> 
		
	<!-- 게시판 목록 -->
	<div id="tableList">
		<table class="table bg-white">
			<thead class="bg-light">
				<tr style="background-color: #DCC1B0;/* #E3A6A1; */">
					<th>글 번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList }" var="board">
					<tr>
						<td>${board.boardId }</td>
						<td>${board.boardCategory }</td>
						
						<td>
							<c:url value="/board/boardGet" var="getLink">
								<c:param name="boardId" value="${board.boardId }"></c:param>
							</c:url>
							<a href="${getLink }">${board.title }</a>
						</td>
						
						<td>${board.member_userId }</td>
						<td>${board.insertDatetime }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>