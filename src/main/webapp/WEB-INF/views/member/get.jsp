<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>관리자모드</title>
<style type="text/css">
/*폰트*/
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap');

/*바디*/
.seleAuth {
	padding-top: 10px;
	text-align: center;
	margin: 0;
}

.authBtn {
	padding-top: 10px;
	text-align: center;
	margin: 0;
}

.container1 {
	border: 1px solid #DCC1B0;
	border-radius: 10px;
	font-color: black;
	width: 100px;
	font-size: 18px;
	border-radius: 10px;
	margin: 10px 10px;
	padding: 5px 10px;
	background: #DCC1B0;
}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<section class="page-section" id="contact">
	<div class="container">
		<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">${memberInfoByUserId.userId}님의 회원정보</h2>
		
		<div class="row justify-content-center">
        	<div class="col-lg-8 col-xl-7">
        			<form action="${pageContext.request.contextPath}/member/addAuth" method="post">
        				<input type="hidden" name="userId" value="${memberInfoByUserId.userId }"/>
        				<div class="d-flex mb-2">
        					<div class="col-3 seleAuth">
        						<select class="form-control" name="auth" id="addAuth">
        							<option value="" disabled selected="selected">권한 수정</option>
        							<option value="1">일반회원</option>
        							<option value="2">판매자</option>
        						</select>
        					</div>
        					<div class="col-3 authBtn">
        						<button type="submit" class="btn btn-warning">권한 수정</button>
        					</div>
        				</div>
        			</form>
        		
        		<form id="contactForm" data-sb-form-api-token="API_TOKEN">	
					<!-- 현재 권한 -->
					<input style="text-align: center;" type="hidden" name="auth" value="${memberInfoByUserId.auth }"/>
					<div class="container1" id="auth">
					<c:choose>
						<c:when test="${memberInfoByUserId.auth == 0}">
							관리자
						</c:when>
						<c:when test="${memberInfoByUserId.auth == 1}">
							일반회원
						</c:when>
						<c:when test="${memberInfoByUserId.auth == 2}">
							판매자
						</c:when>
					</c:choose>
					</div>
					
					<!-- ID -->
					<div class="form-floating mb-3">
						<input class="form-control" id="userId" type="text"
							name="userId" value="${memberInfoByUserId.userId}"
							data-sb-validations="required" disabled="disabled" /> <label for="userId">ID</label>
					</div>
					
								
					<!-- 이름 -->
					<div class="form-floating mb-3">
					<input class="form-control" id="userName" type="text" name="userName"
						value="${memberInfoByUserId.userName}" data-sb-validations="required" disabled="disabled" />
					<label for="name">이름</label>
					</div>
					
					<!-- 닉네임 -->
					<div class="form-floating mb-3">
					<input class="form-control" id="nickName" type="text"
						name="nickName" value="${memberInfoByUserId.nickName}"
						data-sb-validations="required" disabled="disabled"/> <label for="nickName">닉네임</label>
					</div>
					
					<!-- 이메일 -->
					<div class="form-floating mb-3">
						<input class="form-control" id="email" type="email" name="email" value="${memberInfoByUserId.email}" data-sb-validations="required" disabled="disabled"/>
						<label for="email">이메일</label>
					</div>
					
					<!-- 주소 -->
					<div class="form-floating mb-3">
						<input class="form-control" id="address1" type="text" name="address1" value="${memberInfoByUserId.address1}" data-sb-validations="required" disabled="disabled"/>
						<label for="email">집주소</label>
					</div>
				</form>
        	</div>
        </div>
	</div>
</section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>