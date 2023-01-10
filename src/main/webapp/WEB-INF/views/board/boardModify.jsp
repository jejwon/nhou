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
	margin: auto;
	padding-left: 100px;
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
	display: inline-block;
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
	margin: auto;
}

.boardModify .boardTitle {
	padding-top: 20px;
}

.boardModify .boardTitle, .boardModify .info {
	vertical-align: middle;
}

.boardModify .content {
	border-top: 1px solid #DCC1B0;
	border-bottom: 1px solid #DCC1B0;
	padding-bottom: 10px;
}

.boardModify .info dl {
	display: inline-block;
	width: 1000px;
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

.boardModify .boardTitle dt {
	width: 60px;
}

.boardModify .info dt {
	width: 50px;
}

.boardModify .boardTitle dd {
	width: calc(100% - 60px);
}

.boardModify .boardTitle input[type="text"] {
	width: 80%;
}

.boardModify .boardTitle input[type="text"],
.boardModify .info input[type="text"] {
	padding: 10px;
	box-sizing: border-box;
}

.boardModify .info .nick {
	padding-right: 200px;
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

.w-btn {
    border: none;
    padding: 6px 12px;
    border-radius: 15px;
    text-decoration: none;
    font-weight: 600;
    text-align: center;
    display: block;
    margin: 20px 474px 0 474px;
}

.w-btn-green {
    background-color: #DCC1B0;
    color: #fbfbf7;
    
}

.w-btn-gray {
    background-color: #e0e3e3;
    color: #fff;
}

dl, ol, ul {
	margin-bottom: 0.5rem;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>


<div class="container-sm">

<div id="boardWrap">
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
					<%-- <dt>작성일</dt>
					<dd class="date"><input class="form-control" type="text" name="insertDatetime" value="[[${#temporals.format(boardDto.insertDatetime, 'yyyy-MM-dd HH:mm')}]]" readonly="readonly"></dd> --%>
				</dl>
				
				<div class="content">
					<textarea class="">${board.content }</textarea>
				</div>
				
				
				<!-- 파일 -->
				<c:set var="ctx" value="${pageContext.request.contextPath}" />
				<div class="imgBox">
					<c:forEach items="${board.boardFileName }" var="fileName">
					<%-- 삭제 여부 체크박스 --%>
					<div class="form-check form-switch text-danger">
						<input name="removeFiles" value="${name }" class="custom-check form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked${status.count }" >
						<label class="form-check-label" for="flexSwitchCheckChecked${status.count }"><i class="fa-regular fa-trash-can"></i></label>
					</div>
					
					<div class="img">
						<img class="img-fluid img-thumbnail" alt="" src="${ctx }/board/${board.boardId}/${fileName}">
					</div>
					</c:forEach>
					<div class="mb-3">
						<label class="form-label">파일 추가</label>
						<input multiple type="file" accept="${ctx }" class="form-control" name="fileName">
					</div>
				</div>
			</div>
		</div>
		<input class="w-btn w-btn-green" type="submit" value="수정완료" data-bs-target="#modifyModal">
	</form>

	<!-- 삭제버튼 -->
	<%-- <c:url value="/board/boardRemove" var="removeLink"></c:url>
		<form id="removeForm" action="${removeLink }" method="post">
		</form>
			<input class="w-btn w-btn-gray"  type="submit" value="삭제" data-bs-target="#removeModal">
		</div> --%>
		
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

<!-- 		삭제 모달
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
	</div> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
// 수정 버튼 누르면 수정하도록 form으로 전송
document.querySelector("#modifyConfirmBtn").addEventListener("click", function() {
	document.querySelector("#modifyForm").submit();
});

/* // 삭제 버튼 누르면 삭제하도록 form으로 전송
document.querySelector("#removeConfirmBtn").addEventListener("click", function() {
	document.querySelector("#removeForm").submit();
}); */

// 파일추가수정할때 중복검사
document.querySelector(`#modifyForm input[name="files"]`).addEventListener("change", function() {
	const textDiv = document.querySelector("#addFileInputText");
	textDiv.innerText = "";
	
	// 검증해서
	let ok = false;
	
	// input:file 에서 선택한 파일명들
	const files = document.querySelector(`#modifyForm input[name="files"]`).files;
	console.log(files);
	
	// #modifyForm input[name="removeFiles"] 의 value들
	const removeFileChecks = document.querySelectorAll(`#modifyForm input[name="removeFiles"]`);
	
	ok = Array.from(removeFileChecks).every((check) => Array.from(files).every((file) => file.name != check.value))
	/*
	for (const removeFileCheck of removeFileChecks) {
		console.log(removeFileCheck.value);
	}
	*/
	
	// 과 비교해서 중복되는 게 있으면 ok = false
	// 그렇지 않으면 true
	
	if (!ok) {
		textDiv.innerText = "중복된 파일명이 있습니다.";
	}
});
</script>
</body>
</html>