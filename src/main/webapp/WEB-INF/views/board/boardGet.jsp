<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>

<div class="container">
	<h1>${board.boardId }번 게시물</h1>
		<div class="top">
			<p class="category">${board.boardCategory }</p>
			<p class="title">${board.title }</p>
		</div>

제목 <input type="text" value="${board.title }" readonly="readonly"> <br>
카테고리 <input type="text" value="${board.boardCategory }" readonly="readonly"> <br>
내용 <input type="text" value="${board.content }" readonly="readonly"> <br>
작성일시 <input type="text" value="${board.insertDatetime }" readonly="readonly"> <br>
작성자 <input type="text" value="${board.member_userId }" readonly="readonly"> <br>

<!-- 수정 버튼 -->
<c:url value="/board/boardModify" var="modifyLink">
	<c:param name="boardId" value="${board.boardId }"></c:param>
</c:url>
<a class="btn btn-primary" href="${modifyLink }">수정</a>

<hr>

<!-- 댓글 알림창 -->
<div id="replyMessage1"></div>

<!-- 댓글 입력하기 -->
<div class="replyInsertBox">
	게시글 번호 
	<input id="board_boardId" type="text" value="${board.boardId }" readonly="readonly"> <br>
			
	댓글 내용
	<input class="form-control" type="text" id="content"> <br>
			
	<button id="replyBtn1">댓글작성</button>
</div>


<!-- 댓글 목록 -->
<div class="row">
	<div class="col">
		<div id="replyListContainer">
		
		</div>
	</div>
</div>

<!-- 댓글 삭제확인 모달 -->
<div id="deleteReplyModal" class="modal fade" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">댓글 삭제 알림</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <p>댓글을 삭제하시겠습니까?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button id="replyDeleteConfirmBtn" type="button" class="btn btn-primary">삭제</button>
      </div>
    </div>
  </div>
</div>

<!-- 댓글 수정확인 모달 -->
<div class="modal fade" id="replyModifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	    <div class="modal-content">
	       <div class="modal-header">
	         <h1 class="modal-title fs-5" id="exampleModalLabel">댓글 수정 양식</h1>
	         <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <input type="text" id="modifyReplyInput"/>	
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" id="replyModifyConfirmBtn" class="btn btn-primary" data-bs-dismiss="modal">수정</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</div> <!-- 전체 container -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
// 경로 설정
const ctx = "${pageContext.request.contextPath}";

// 댓글 리스트
listReply();

// 댓글수정 모달에 수정확인버튼
document.querySelector("#replyModifyConfirmBtn").addEventListener("click", function() {
	
	const boardReplyId = this.dataset.replyId;
	const content = document.querySelector("#modifyReplyInput").value;
	const data = {boardReplyId, content}
	
	fetch(`\${ctx}/boardReply/modify`, {
		method : "put",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => res.json())
	.then(data => document.querySelector("#replyMessage1").innerText = data.message)
	.then(() => listReply());
});

//댓글 삭제 확인버튼
document.querySelector("#replyDeleteConfirmBtn").addEventListener("click", function() {
	removeReply(this.dataset.replyId);
});

// 수정모달에 댓글내용 담기
function readReplySetModalForm(boardReplyId) {
	fetch(`\${ctx}/boardReply/get/\${boardReplyId}`)
	.then(res => res.json())
	.then(reply => {
		document.querySelector("#modifyReplyInput").value=reply.content;
	});
}

function listReply() {
	const board_boardId = document.querySelector("#board_boardId").value;
	
	fetch(`\${ctx}/boardReply/list/\${board_boardId}`)
	.then(res => res.json())
	.then(list => {
		// 댓글 목록 뺐다가
		const replyListContainer = document.querySelector("#replyListContainer");
		replyListContainer.innerHTML = "";
		
		// 리셋하여 다시 댓글 리스트 담기
		for (const item of list) {
			
		const modifyReplyBtnId = `modifyReplyBtn\${item.boardReplyId}`;
		const removeReplyBtnId = `removeReplyBtn\${item.boardReplyId}`;
		
		// 댓글 보여주기
		const replyDiv = `
			<div>
				\${item.content} : \${item.insertDatetime}
			
				<button data-bs-toggle="modal" data-bs-target="#replyModifyModal" data-reply-id="\${item.boardReplyId}" id="\${modifyReplyBtnId}">수정</button>
				<button data-bs-toggle="modal" data-bs-target="#replyDeleteModal" data-reply-id="\${item.boardReplyId}" id="\${removeReplyBtnId}">삭제</button>
			</div>
			`;
			
			replyListContainer.insertAdjacentHTML("beforeend", replyDiv);
			
		// 수정 모달에 댓글 내용 담기
		document.querySelector("#" + modifyReplyBtnId).addEventListener("click", function() {
			document.querySelector("#replyModifyConfirmBtn").setAttribute("data-reply-id", this.dataset.replyId)
			// 수정 모달에 있는 댓글 내용 가져와서 수정된 새댓글 내용 넣기
			readReplySetModalForm(this.dataset.replyId);
		});
		
		// 모달 삭제확인 버튼에 replyId 옮기기
		document.querySelector("#" + removeReplyBtnId).addEventListener("click", function() {
			document.querySelector("#removeDeleteConfirmBtn").setAttribute("data-reply-id", this.dataset.replyId)
		});
	   }
	});
}

// 댓글 삭제
function removeReply(replyId) {
	fetch(ctx + "/boardReply/delete/" + replyId, {
		method : "delete"
	})
	.then(res => res.json())
	.then(data => document.querySelector("#replyMessage1").innerText = data.message)
	.then(() => listReply());
}

// 댓글 입력창
document.querySelector("#replyBtn1").addEventListener("click", function() {
	const board_boardId = document.querySelector("#board_boardId").value;
	const content = document.querySelector("#content").value;
	
	const data = {
			board_boardId,
			content
	}
	
	fetch(`\${ctx}/boardReply/add`, {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => json())
	.then(data => {
		document.querySelector("#content").value = "";
		document.querySelector("#replyMessage1").innerText = data.message;
	})
	.then(() => listReply()); 
});

</script>
</body>
</html>