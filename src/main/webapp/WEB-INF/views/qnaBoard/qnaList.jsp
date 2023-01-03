<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
=
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 문의</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
	<div class="container" style="background-color:pink;">
		<table class="table">
			<thead>
				<tr>
					<td>#</td>
					<td>종류</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일시</td>
					<td>답변상태</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${qnaList }" var="qna"><!-- 받는 객체 동일하게 -->
				<tr> <!-- 질문마다 전체 선택 가능하게 -->			
					<td><a href="/qnaBoard/qnaGet?qnaId=${qna.qnaId }">${qna.qnaId }</a></td>
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
					<td>${qna.insertDatetime }</td>				
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
		
		
		<c:url value="/qnaBoard/qnaInsert" var="insertLink"></c:url>
		<div id="submit" class="container-sm" style="">
			<i class="fa-solid fa-clipboard-question"></i>
			<a href="${insertLink }">문의작성</a>			
		</div>
		
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>