<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>왁자지껄 커뮤니티</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style type="text/css">
/* 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap');
/* top */
#serachBox {
	position: absolute;
	left: 80%;
	top: 29%;
	transform: translate(-70%, -30%);
}
select {
	border-radius: 50px;
	border: 1px solid #DCC1B0;
	padding: 0px 10px;
	display: inline-block;
}
input {
	position: relative;
	display: inline-block;
	box-sizing: border-box;
	transition: .5s;
	font-size: 15px;
	border: 1px solid #DCC1B0;
	vertical-align: middle;
}	
input[type="search"] {
	padding: 0 25px;
	border-radius: 25px 0 0 25px;
	border-color: #DCC1B0;
	vertical-align: middle;
	width: 240px;
	text-align: left;
	height: 28px;
}
input[type="submit"] {
	position: relative;
	border-radius: 0 25px 25px 0;
	cursor: pointer;
	background: #DCC1B0;
	left: -5px;
	border: none;
	font-family: FontAwesome;
	height: 28px;
	width: 39px;
	vertical-align: middle;
	color: #fff;
}
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
	font-size: 18px;
	margin: 0 20px;
}
#categorySelect .categoryBtn:hover {
	color: #CD7070;
	font-weight: bold;
	transition: 0.3s;
}
#btn1::after {
	content: "|";
	padding-left: 33px;
}	
#btn2::after {
	content: "|";
	padding-left: 33px;
}	
#btn3::after {
	content: "|";
	padding-left: 33px;
}
/* 댓글 아이콘 */
#chatCount {
	font-size: 20px;
}	
/* 바디 */
.container {
	font-family: 'Noto Sans KR', sans-serif;
}
/* buttom */
#buttom {
	text-align: center;
	position: relative;
}
/* 페이지 버튼 */
#buttom .paginationBox {
	display: inline-block;
	
}
/* 글쓰기 버튼 */
#buttom .insertBtn {
	display: inline-block;
	position: absolute;
	top: 0;
	left: 0;
	background-color: #DCC1B0;
}
#writeBtn:hover {
	color: #fff;
}
/* 게시판 body */
#tableList {
	text-align: center;
	border-spacing: 10px;
}
#tableList .table {
	font-size: 17px;
}
#tableList .table tr td {
	height: 60px;
	vertical-align: middle;
}

a:link {
	text-decoration: none;
	color: black;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>

<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<!-- 전체 컨테이너 -->
<section class="bg-light p-5">
<div class="container">
	<div id="top">
		<div class="title">
			<h1>커뮤니티 게시판</h1>
		</div>
		
	<!-- 검색창 -->
	<div id="serachBox">
		<c:url value="/board/boardList" var="listLink"></c:url>
		<form action="${listLink }" role="search">
		<!-- 검색 범위 설정 -->
		<select name="t">
			<option value="all">전체
			<option value="title" ${param.t == 'title' ? 'selected' : ''}>제목
			<option value="content" ${param.t == 'content' ? 'selected' : ''}>내용
			<option value="nickName" ${param.t == 'nickName' ? 'selected' : ''}>작성자
		</select>
		
		<div class="btns">
			<input class="searchBtn" value="${param.q }" type="search" placeholder="검색어" aria-label="Search" name="q">
			<input class="search" type="submit" value="&#xf002;">
		</div>
		</form>
	</div>
</div>
	
	<!-- 카테고리 -->
 	<div id="categorySelect" class="">
		<c:url value="/board/boardList" var="listLink"></c:url>
		<form action="${listLink }">
			<button id="btn1" class="categoryBtn" name="category" value="">전체</button>
			<button id="btn2" class="categoryBtn" name="category" value="인테리어 자랑">인테리어 자랑</button>
			<button id="btn3" class="categoryBtn" name="category" value="꿀팁 방출">꿀팁 방출</button>
			<button id="btn4" class="categoryBtn" name="category" value="잡담">잡담</button>
		</form>
	</div> 
		
	<!-- 게시판 목록 -->
	<div id="tableList">
		<table class="table bg-white">
			<thead class="bg-light">
				<tr style="background-color: #DCC1B0;/* #E3A6A1; */">
					<th style="width: 80px;">#</th>
					<th style="width: 130px;">카테고리</th>
					<th style="width: 800px;">제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>좋아요</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${boardList }" var="board">
					<tr>
						<td>${board.boardId }</td>
						
						<td>${board.boardCategory }</td>
						
						<td style="text-align: left; padding-left: 15px;">
							<c:url value="/board/boardGet" var="getLink">
								<c:param name="boardId" value="${board.boardId }"></c:param>
							</c:url>
							<!-- 게시글 제목 / 링크 -->
							<a href="${getLink }">${board.title }</a>
							<!-- 댓글 갯수 -->
							<c:if test="${board.replyCount > 0 }">
								<span id="chatCount" class="material-symbols-outlined">chat</span>
								<span style="font-size: 13px;">${board.replyCount}</span>
							</c:if>
						</td>
						
						<td>${board.nickName }</td>
						<td>${board.ago }</td>
						<td>${board.likeCount }</td>
						<!-- 조회수 -->
						<td>${board.viewCount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<div id="buttom">
	<!-- 글작성 버튼 -->
	<div class="insertBtn">
		<c:url value="/board/boardInsert" var="insertLink"></c:url>
		<a href="${insertLink }">
			<button id="writeBtn" class="btn btn-outline">글쓰기</button>
		</a>
	</div>
	
	<!-- 페이징 처리 -->
	<div class="paginationBox">
		<ul class="pagination">
				
			<!-- 1페이지 일때 첫번째 버튼 제외하고 다른 페이지에선 '처음으로' 버튼 존재하도록 -->
				<c:if test="${pageInfo.currentPageNum != 1}">
					<c:url value="/board/boardList" var="listLink">
						<c:param name="page" value="1"></c:param>
						<c:param name="q" value="${param.q }"></c:param>
						<c:param name="t" value="${param.t }"></c:param>
						<c:param name="category" value="${param.category }"></c:param>
					</c:url>
					<li class="page-item"><a class="page-link" href="${listLink }">처음으로</a></li>
				</c:if>
						
					<!-- 이전 페이지 버튼 -->
					<c:if test="${pageInfo.hasPreBtn }">
						<c:url value="/board/boardList" var="listLink">
							<c:param name="page" value="${pageInfo.jumpPrePageNum }"></c:param>
							<c:param name="q" value="${param.q }"></c:param>
							<c:param name="t" value="${param.t }"></c:param>
							<c:param name="category" value="${param.category }"></c:param>
						</c:url>
						<li class="page-item"><a class="page-link" href="${listLink }">이전</a></li>
					</c:if>
					
					<c:forEach begin="${pageInfo.leftPageNum }" end="${pageInfo.rightPageNum }" var="pageNum">
						<c:url value="/board/boardList" var="listLink">
							<c:param name="page" value="${pageNum }"></c:param>
							<c:param name="q" value="${param.q }"></c:param>
							<c:param name="t" value="${param.t }"></c:param>
							<c:param name="category" value="${param.category }"></c:param>
						</c:url>
						
					<!-- 현재 자신이 위치하고있는 페이지 표시(active) -->
					<li class="page-item ${pageInfo.currentPageNum == pageNum ? 'active' : '' }">
						<a class="page-link" href="${listLink }">${pageNum }</a>
					</li>
					</c:forEach>
					
				<!-- 다음 페이지 버튼 활성화 -->
				<c:if test="${pageInfo.hasNextBtn }">
					<c:url value="/board/boardList" var="listLink">
						<c:param name="page" value="${pageInfo.jumpNextPageNum }"></c:param>
						<c:param name="q" value="${param.q }"></c:param>
						<c:param name="t" value="${param.t }"></c:param>
						<c:param name="category" value="${param.category }"></c:param>
					</c:url>
					<li class="page-item"><a class="page-link" href="${listLink }">다음</a></li>
				</c:if>
				
				<!-- 맨끝으로 가는 페이지 버튼 활성화 : 맨마지막 제외하고 다른 페이지에서는 존재하도록 -->
				<c:if test="${pageInfo.currentPageNum != pageInfo.lastPageNum}">
					<c:url value="/board/boardList" var="listLink">
						<c:param name="page" value="${pageInfo.lastPageNum}"></c:param>
						<c:param name="q" value="${param.q }"></c:param>
						<c:param name="t" value="${param.t }"></c:param>
						<c:param name="category" value="${param.category }"></c:param>
					</c:url>
					<li class="page-item"><a class="page-link" href="${listLink }">맨끝으로</a></li>
				</c:if>
				</ul>
		</div>
	</div>
</div> <!-- 첫번째 container를 감싸는 div -->
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>