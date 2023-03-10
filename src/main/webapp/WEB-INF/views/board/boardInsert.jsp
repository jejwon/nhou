<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style type="text/css">

/* 글씨폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap');

.container-sm {
	letter-spacing: -1px;
	font-size: 16px;
	margin: 10px;
	padding: 0 100px 0 100px;
	width: 800px;
	font-family: 'Noto Sans KR', sans-serif;
}

.categorySelectBox {
	text-align: left;
	font-family: 'Noto Sans KR', sans-serif;
}

.categorySelectBox p {
	display: inline-block;
	color: #333;
	font-size: 20px;
	padding-left: 5px;
}

.categorySelectBox .category {
	display: inline-block;
	width: 200px;
	height: 40px;
	border: 0;
	outline: none;
	margin: 30px 0 10px 10px;
	font-size: 20px;
	font-weight: bold;
}

.categorySelectBox .category option {
	font-size: 16px;
	color: #666;
	font-weight: normal;
	font-family: 'Noto Sans KR', sans-serif;
}
	
.b1 {
	position: relative;
    border: none;
    display: inline-block;
    padding: 6px 12px;
    border-radius: 15px;
    text-decoration: none;
    font-weight: 600;

}

.w-btn-green {
    background-color: #DCC1B0;
    color: #fbfbf7;
}

.b2 {
	background-color: #D3D3D3;
	border-radius: 5px;
	border-color: #D3D3D3;
	color: #fff;
	width: 60px;
	height: 30px;
}

.btns {
	display: inline-block;
	margin: 10px 5px;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<div class="container">
	<form action="${pageContext.request.contextPath}/board/boardInsert" method="post" enctype="multipart/form-data">
		<div class="categorySelectBox">
		<div>
			<input type="hidden" name="member_userId" disabled="disabled">
		</div>
			<p>카테고리</p>
			
			<select class="category" name="boardCategory" id="">
				<option name="houses">인테리어 자랑</option>
				<option name="tip">꿀팁 방출</option>
				<option name="chat">잡담</option>
			</select>
		</div>
		
		
		<div class="form-floating" style="padding-bottom: 10px;">
			<input class="form-control" type="text" name="title">
			<label>제목</label>		
		</div>
		 
		<div class="form-floating mb-3">
			<textarea class="form-control" name="content" style="resize: none; height: 150px;"></textarea>
		</div>
		
		<div class="form-floating" style="padding-bottom: 10px;">
			<input class="form-control" value="<sec:authentication property="name"/>" type="hidden" name="nickName" readonly="readonly">
		</div>
		
		<div class="mb-3">
			<label class="form-label">파일</label>
			<input multiple type="file" class="form-control" name="files">
		</div>
		
		
		<div class="row-g-2" style="display: inline-block; padding: 10px 100px 10px 100px; margin: 10px 500px 10px 500px;">
			<input class="b1 w-btn-green" type="submit" value="등록"> 
			<c:url value="/board/boardList" var="listLink" />
		</div>
	</form>
</div>
<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">

</script>
</body>
</html>