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
		<select name="auth"  class="form-select" aria-label="Default select example"style="width: 200px; margin: 0 10px;">
 			<c:choose>
 				<c:when test="${member.auth == 0  }">
		 			<option selected>관리자</option>	
 				</c:when>
 				<c:when test="${member.auth == 1  }">
		 			<option selected value="1">일반회원</option>	
 				</c:when>
 				<c:when test="${member.auth == 2  }">
		 			<option selected value="2">판매자</option>	
 				</c:when>
 			</c:choose>
  			<option value="1">일반회원 변경</option>
  			<option value="2">판매자 등록</option>
 			<c:if test="${member.auth == 0 }"> 
 			<option value="8">일반회원 + 블랙</option>
 			<option value="9">판매자 + 블랙</option>
 			 </c:if>
		</select>
		
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