<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 문의</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style>
/* 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap');
/* 바디 */
.container {
	font-family: 'Noto Sans KR', sans-serif;
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
/* button */
#button {
	text-align: center;
	position: relative;
}
/* 페이지 버튼 */
#button .pageBox {
	display: inline-block;
	
}

/* 글쓰기 버튼 */
#button .submit {
	display: inline-block;
	position: absolute;
	top: 0;
	left: 0;
	background-color: #DCC1B0;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>

<section class="bg-light p-5">
	<div class="container">
		<div class="title">
			<h1>고객 문의</h1>
		</div>
	
					
	<div id="tableList">
		<table class="table bg-white">
			<thead class="bg-light">
				<tr style="background-color: #DCC1B0;">
					<td style="width: 60px;">#</td>
					<td style="width: 100px;">종류</td>
					<td style="width: 600px;">제목</td>
					<td style="width: 150px;">작성자</td>
					<td style="width: 250px;">작성일시</td>
					<td style="width: 100px;">답변상태</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${qnaList }" var="qna"><!-- 받는 객체 동일하게 -->
			
				<tr> <!-- 질문마다 전체 선택 가능하게 -->			
					<td style="text-align: left; padding-left: 15px;">
					<a href="/qnaBoard/qnaGet?qnaId=${qna.qnaId }">${qna.qnaId }</a>
					</td>
					<c:choose>
					<c:when test="${qna.qnaCategory == 0 }">
					<td>배송</td>
					</c:when>
					<c:when test="${qna.qnaCategory == 1 }">
					<td>교환/환불</td>
					</c:when>	
					<c:when test="${qna.qnaCategory == 2 }">
					<td>기타</td>
					</c:when>			
					</c:choose>
					<td>${qna.title }</td>
					<td>${qna.nickName }</td>
					
					<td id="day">
					${qna.insertDatetime }
					
					</td>				
					<c:choose>
					<c:when test="${qna.status == 0 }">
					<td>답변대기</td>
					</c:when>
					<c:when test="${qna.status == 1 }">
					<td>답변완료</td>
					</c:when>				
					</c:choose>				
				</tr>
			</c:forEach>
			</tbody>
		</table>
</div>		
		
		<div id="button">		
			<div class="submit">
			<c:url value="/qnaBoard/qnaInsert" var="insertLink"></c:url>
				<!-- <i class="fa-solid fa-clipboard-question"></i>  -->
				<a href="${insertLink }">
				<button id="wrtieBtn"class="btn btn-outline">문의작성</button>
				</a>			
			</div>
		
		
		<%--페이징 --%>
		<div class="pageBox">
			<ul class="pagination">
			
			<c:if test="${pageInfo.currentPageNum != 1 }">
				<c:url value="/qnaBoard/qnaList" var="listLink">
					<c:param name="page" value="1"></c:param>
				</c:url>
				<li class="page-item"><a class="page-link" href="${listLink }">처음으로</a></li>
			</c:if>
			
			<c:if test="${pageInfo.hasPrevBtn }">
				<c:url value="/qnaBoard/qnaList" var="listLink">
					<c:param name="page" value="${pageInfo.jumpPrevNum }"></c:param>
				</c:url>
				<li class="page-item"><a class="page-link"href="${listLink }"></a>이전</li>
			</c:if>
			
			<c:forEach begin="${pageInfo.leftPageNum }" end="${pageInfo.rightPageNum }" var="pageNum">
				<c:url value="/qnaBoard/qnaList" var="listLink">
					<c:param name="page" value="${pageNum }"></c:param>
				</c:url>
				
				<li class="page-item ${pageInfo.currentPageNum == pageNum ? 'active' : '' }">
					<a class="page-link" href="${listLink }">${pageNum }</a>
				</li>			
			</c:forEach>
			
			<!-- 다음 페이지 버튼 활성화 -->
			<c:if test="${pageInfo.hasNextBtn }">
				<c:url value="/qnaBoard/qnaList" var="listLink">
					<c:param name="page" value="${pageInfo.jumpNextPageNum }"></c:param>
				</c:url>	
				<li class="page-item"><a class="page-item" href="${listLink }"></a>다음</li>
			</c:if>
			
			<c:if test="${pageInfo.currentPageNum != pageInfo.lastPageNum }">
				<c:url value="/qnaBoard/qnaList" var="listLink">
					<c:param name="page" value="${pageInfo.lastPageNum }"></c:param>
				</c:url>
				<li class="page-item"><a class="page-link" href="${listLink }">맨끝으로</a></li>
			</c:if>
			</ul>
		</div>
	</div>	
<!--전체 박싱 -->
	</div>	
</section>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
const ctx = "${pageContext.request.contextPath}";
<script type="text/javascript">
const insertDatetime1 = document.querySelector("#insertDatetime1").value;
var yyyyMMdd = String(insertDatetime1);
var sYear = yyyyMMdd.substring(0,4);
var sMonth = yyyyMMdd.substring(5,7);
var sDate = yyyyMMdd.substring(8,10);
var date = (sYear) + '/' + (sMonth) + '/' + (sDate);

document.getElementById("day").innerHTML += date
</script> 

</body>
</html>
































