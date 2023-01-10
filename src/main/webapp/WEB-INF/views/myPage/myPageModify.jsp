<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo Edit</title>
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
#whole {
	margin: 20px;
}
#button1 {
	text-align: center;
	position: relative;
}
#button1 #modifyBtn {
	display: inline-block;
	position: absolute;
	background-color: #DCC1B0;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<section class="p-5">
	<div class="container">
		<h1>개인정보 수정</h1>
		<form id="editForm"action="" method="post">
		<div id="whole">
		<div class="form-floating" style="margin: 10px;">
			<input type="text" readonly class="form-control" value="${member.userId }"id="userId"placeholder="ID"name="userId"> 
			<label for="ID">아이디</label>
		</div>
		<div class="form-floating" style="margin: 10px;">
			<input type="password" class="form-control" value="${member.password }"id="password"placeholder="Password" name="password"> 
			<label for="Password">비밀번호</label>
		</div>
		<div class="form-floating" style="margin: 10px;">
			<input type="text" class="form-control" value="${member.userName }"id="userName"placeholder="userName" name="userName"> 
			<label for="userName">이름</label>
		</div>
		<div class="form-floating" style="margin: 10px;">
			<input type="text" class="form-control" value="${member.nickName }"id="nickName"placeholder="Nickname" name="nickName"> 
			<label for="nickName">별칭</label>
		</div>		
		<div class="form-floating" style="margin: 10px;">
			<input type="email" class="form-control" value="${member.email }"id="email"placeholder="name@example.com" name="email"> 
			<label for="email">이메일</label>
		</div>
		<div class="form-floating" style="margin: 10px;">
			<input type="Date" readonly class="form-control" value="${member.birthDate }" id="birthDate"placeholder="birthDate"name="birthDate"> 
			<label for="birthDate">${member.birthDate }</label>
		</div>
		<div class="form-floating" style="margin: 10px;">
			<input type="text" class="form-control" value="${member.address }" id="address"placeholder="address"name="address"> 
			<label for="address">주소</label>
		</div>
		<div class="form-floating" style="margin: 10px;">
			<input type="text" class="form-control" value="${member.phone }"id="phone"placeholder="phone" name="phone"> 
			<label for="phone">전화번호</label>
		</div>
		</div>
		<c:if test="${member.auth != 2}">
		<div class="form-check">
			  <input class="form-check-input" type="checkbox" value="2" id="auth" name="auth">
			  <label class="form-check-label" for="auth">
			   판매자 등록
	  		  </label>			 
		</div>
		
		</c:if>
		<c:if test="${member.auth != 1}">
		<div class="form-check">
			  <input class="form-check-input" type="checkbox" value="2" id="auth" name="auth">
			  <label class="form-check-label" for="auth">
			   일반회원 변경
	  		  </label>			 
		</div>
		</c:if>
		
		<div id="button1">		
			<button id="modifyBtn"class="btn btn-outline">수정하기</button>			
		</div>			
		</form>
	</div>
	
</section>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
const ctx = "${pageContext.request.contextPath}";

document.querySelector("#editSubmit").addEventListener("click", function(){
	document.querySelector("#editForm").submit();
});


</script>
</body>
</html>