<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>
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
.selectCategory {
	margin: 20px; 
}
#titleBox {
	margin: 20px; 
}
#contentBox {
	margin: 20px; 
}
/*등록버튼*/
#button1 {
	text-align: center;
	position: relative;
}
#insertSubmit {
	display: inline-block;
	position: absolute;
	top: 0;
	background-color: #DCC1B0;
}

/*취소버튼*/
#button2 {
	text-align: center;
	position: relative;
}
#back {
	display: inline-block;
	position: absolute;
	left: 0;
	top: 0;
	background-color: #D5D4D1;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<section class="bg-light p-5">
	<div class="container" >

		<h3>문의작성</h3>
		<form action="" method="post">
		<div class="selectCategory">
			<select class="form-select" aria-label="Default select example" name="qnaCategory">
			  <option selected>질문 종류를 선택해주세요.</option>
			  <option value="0">배송</option>
			  <option value="1">교환/환불</option>
			  <option value="2">기타</option>
			</select>
		</div>
		
		<div id="titleBox" class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingInput" placeholder="" name="title">
		  <label for="floatingInput">제목을 작성해주세요.</label>
		</div>
		
		<div id="contentBox" class="form-floating">
		  <textarea class="form-control" placeholder="" id="floatingTextarea" name="content" style="resize: none; height: 150px;"></textarea>
		  <label for="floatingTextarea">문의 내용을 작성해주세요.</label>
		</div>
		
		<%-- <input readonly type="text" value="${member_userId }" name="member_userId"> --%>
		<div id="button1">
		<button id="insertSubmit" class="btn btn-outline">등록</button>
		</div>
		</form>
		<div id="button2">
			<c:url value="/main/list" var="listLink"/>
			<a href="${listLink }">
			<button id="back" class="btn btn-outline">취소</button>
			</a>		
		</div>
	</div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>

</script>
</body>
</html>