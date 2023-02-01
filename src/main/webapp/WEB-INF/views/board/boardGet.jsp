<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&family=Nunito:wght@200;300&display=swap');
.bodyContent {
	border-radius: 10px;
	margin-bottom: 10px;
}
.toList {
	width: 40px;
	height: 35px;
	font-size: 13px;
	background-color: #DCC1B0;
	border: none;
	border-radius: 5px;
	font-family: 'Nunito', sans-serif;
	font-weight: bold;
	text-align: center;
	
}
.listBtn {
	text-decoration: none;
}
.topBtn {
	margin: 10px auto;
	width: 100%;
	display: flex;
}

.bodyContent .likeBox i {
	color: #DCC1B0;
}
.likeBox .likeIcon {
	font-size: 26px;
	color: #DCC1B0;
}
.likeBox .likeCount1 {
	font-size: 14px;
	margin-top: -20px;
	color: #333;
}
.like>p {
	font-size: 14px;
	margin-top: -15px;
	font-weight: bold;
	color: #333;
	text-align: center;
}
/* 본문 */
table {
	width: 100%;
	border: 1px solid #DCC1B0;
}
.thbuttom {
	text-align: right;
}
/* 댓글 */
.notLogin {
	text-align: center;
	margin: 5px;
	font-family: 'Nunito', sans-serif;
	color: #DCC1B0;
	font-size: 20px;
}
.replyInsertBox {
	border: 1px solid #DCC1B0;
	border-radius: 10px;
	margin-bottom: 30px;
	height: 70px;
	position: relative;
}
.replyInsertBox .row {
	padding-left: 30px;
}
.replyInsertBox .replyContent {
	border: 0;
	height: 80px;
	margin-top: 10px;
	padding-left: 20px;
}
.replyInsertBox .insertBtn {
	position: absolute;
	bottom: 0;
	right: 0;
	border: 1px solid #DCC1B0;
	background-color: #DCC1B0;
	font-family: 'Nunito', sans-serif;
	font-weight: bolder;
	border-radius: 5px 5px 8px 5px;
	color: #fff;
	width: 40px;
	height: 30px;
	text-align: center;
	vertical-align: middle;
}
input[type="text"] {
	border-style: none;
	height: 30px;
}
/* 댓글 리스트 */
.reply_list {
	margin-bottom: 10px; 
	padding: 0 20px;
}
.reply_list span {
	height: 1px;
	background: #ced4da;
	margin-bottom: 20px; 
}
.reply_list .replylist_top {
	text-align: left;
	position: relative;
}
.reply_list .replylist_top p {
	display: inline-block;
	font-size: 14px;
}
.reply_list .replylist_top .ago {
	display: inline-block;
	font-size: 12px;
	color: #666;
	margin-left: 10px;
}
.reply_list .replylist_top .btn {
	position: absolute;
	top: 0;
	right: 0;
}
.reply_list .replylist_top .b1 {
	position: absolute;
	top: 0;
	right: 45px;
}

.goListBtn {
	box-sizing: border-box;
	float: left;
	flex: 9.5;
}

.editBtn {
	box-sizing: border-box;
	float: right;
	flex: 0.5;
	font: #fff;
}

.deleteBtn {
	box-sizing: border-box;
	float: right;
	flex: 0;
}

/* 댓글 목록 */
#comentBox {
	width: 100%;
	border-bottom: 1px solid #DCC1B0;
	position: relative;
}

#comentBox .contentText, .date, .editBtns, .nickName {
	width: 100%;
	margin: 3px;
	padding: 3px;
	display: flex;
	
}

#comentBox .nickName {
	font-size: 20px;
	font-family: 'Nunito', sans-serif;
	font-weight: bolder;
}

#comentBox .editBtns {
	justify-content: flex-end;
	font-family: 'Nunito', sans-serif;
}

#comentBox .date {
	font-size: 14px;
	font-family: 'Nunito', sans-serif;
	vertical-align: middle;
}

#comentBox i {
	margin-right: 3px;
	vertical-align: middle;
}

.modiBtn{
	box-shadow:inset 0px 39px 0px -24px #DCC1B0;
	background-color:#d4b39e;
	border-radius:4px;
	border:1px solid #ffffff;
	display:inline-block;
	cursor:pointer;
	color:#fbfbf7;
	font-family:Arial;
	font-size:15px;
	padding:6px 9px;
	text-decoration:none;
	text-shadow:0px 1px 0px #e4cfc2;
}
.modiBtn:hover {
	background-color:#e4cfc2;
}
.modiBtn:active {
	position:relative;
	top:1px;
}

.remoBtn{
	box-shadow:inset 0px 39px 0px -24px #e67a73;
	background-color:#e4685d;
	border-radius:4px;
	border:1px solid #ffffff;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	padding:6px 9px;
	text-decoration:none;
	text-shadow:0px 1px 0px #b23e35;
}
.remoBtn {
	background-color:#eb675e;
}
.remoBtn:active {
	position:relative;
	top:1px;
}

/* 게시글 수정/삭제 버튼 */
.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 6px 12px;
    border-radius: 15px;
    text-decoration: none;
    font-weight: 600;
}

.w-btn-outline {
    position: relative;
    padding: 6px 12px;
    border-radius: 15px;
    text-decoration: none;
    font-weight: 600;
}

.w-btn-green {
    background-color: #DCC1B0;
    color: #fbfbf7;
}

.w-btn-gray {
    background-color: #e0e3e3;
    color: #fff;
}



</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<input type="hidden" value="${board.boardId }" readonly="readonly">
<input type="hidden" value="${board.member_userId }">
<input type="hidden" id="board_boardId" value="${board.boardId }" readonly="readonly">

<div class="container"> <!-- 전체 컨테이너 -->
		
		<!-- 상단 버튼 -->
		<div class="topBtn">
			<div class="goListBtn">
				<!-- 목록으로 -->
				<c:url value="/board/boardList" var="listLink"></c:url>
					<a class="listBtn" href="${listLink }">
						<button class="toList">List</button>
					</a>
			</div>
			
			<sec:authentication property="name" var="username"/>
			<!-- 작성자와 authentication.namedl 같아야 보여줌 -->
			<c:if test="${board.member_userId == username}">
				<div class="editBtn">
					<!-- 수정페이지로 -->
					<c:url value="/board/boardModify" var="modifyLink">
						<c:param name="boardId" value="${board.boardId }"></c:param>
					</c:url>
						<a href="${modifyLink }">
							<input class="w-btn w-btn-green" type="button" value="수정">
						</a>
				</div>
					
				<div class="deleteBtn">
					<!-- 삭제하기 -->
					<c:url value="/board/boardRemove" var="removeLink"></c:url>
					<form action="${removeLink }" id="removeForm" method="post">
						<input type="hidden" name="boardId" value="${board.boardId }">
					</form>
					<input class="w-btn w-btn-gray" type="submit" value="삭제" data-bs-toggle="modal" data-bs-target="#removeModal"/>
				</div>
			</c:if>
		</div>
		
<!-- 본문 -->
<div class="bodyContent">
<div class="container my-1">
	<div class="row">
			<table class="table">
				<thead>
				<tr class="table-active">
					<th class="thTop" style="width: 50%">
						<span style="color: #070504;">[${board.boardCategory }] &nbsp;</span>
						<span>${board.title }</span><br>
						<span style="vertical-align: middle; font-size: 20px;"><i class="fa-solid fa-circle-user"></i>
							${board.nickName }</span><br>
						<%-- <span>${board.boardCategory }</span><br> --%>
					</th> 
					<th class="thbuttom" style="width: 40%">
						<span><i class="fa-solid fa-heart"></i>
								${board.likeCount }
						</span>
						<span><i class="fa-regular fa-eye"></i>
								${board.viewCount }</span><br />
					 	<span>${board.ago }</span>
					</th>
				</tr>
				</thead>
				<tbody>
					<tr>
						<td>${board.content }</td>
					</tr>
				</tbody>			
			</table>
		</div>
	</div>
	<%-- <div class="contentTop">
		<p class="category"></p>
		<p class="title">${board.title }</p>
		<ul>
			<li class="nickName">${board.nickName }</li>
			<li class="insertDatetime">${board.ago }</li>
			<li class="likeCount">좋아요 ${board.likeCount }</li> 
		</ul> --%>
	


<!-- 파일 -->
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<div class="imgBox">
	<c:forEach items="${board.boardFileName }" var="fileName">
		<div class="img">
			<img class="img-fluid img-thumbnail" alt="" src="${ctx }/atrium/board/${board.boardId}/${fileName}"
				 width="500px" height="400px">
		</div>
	</c:forEach>
</div>
<!-- 좋아요 -->
<div class="likeBox" style="text-align: center;">
	<p <sec:authorize access="not isAuthenticated()">
			style="pointer-events: none;"
		</sec:authorize>
		id="likeBtn" class="likeIcon">
		
			<c:if test="${board.liked }">
				<i class="fa-solid fa-heart"></i>
			</c:if>
			<c:if test="${not board.liked }">
				<i class="fa-regular fa-heart"></i>
			</c:if>
		</p>
		<!-- <p class="likeCount1">좋아요</p> -->
		<p id="likeCount" class="likeCount2">${board.likeCount }</p>
	
</div>
</div>
<!-- 댓글 알림창 -->
<div id="replyMessage1"></div>

<!-- 댓글 입력하기 -->
<div class="replyInsertBox container">
	
	<!-- 로그인 했을때 -->
		<!-- 댓글 입력하기 -->
	<sec:authorize access="isAuthenticated()">
		<div class="row">
			<input id="content" class="row replyContentInput" type="text" placeholder="댓글을 입력하세요."/>
			<br />
		<button class="insertBtn" id="replyBtn1"><i class="fa-solid fa-pen-to-square"></i></button>
		</div>
	</sec:authorize>
	
		<!-- 로그인 안했을때 -->
		<div class="notLogin">
			<sec:authorize access="not isAuthenticated()">
				로그인을 해주세요.
			</sec:authorize>
		</div>
</div>


	<!-- 댓글 목록 -->
	<div class="row">
		<div class="col">
			<div id="replyListContainer">
			
			</div>
		</div>
	</div>
</div> <!-- 전체 container -->
<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
	<!-- 게시글 삭제확인 모달 -->
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
	        <button id="removeConfirmButton" type="button" class="btn btn-primary">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>

	<%-- 댓글 삭제 확인 모달 --%>
	<!-- Modal -->
	<div class="modal fade" id="removeReplyConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">댓글 삭제 확인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        댓글을 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" data-bs-dismiss="modal" id="removeConfirmModalSubmitButton" class="btn btn-danger">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>

<%-- 댓글 수정 모달 --%>
	<!-- Modal -->
	<div class="modal fade" id="modifyReplyFormModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5">댓글 수정 양식</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <input type="text" class="form-control" id="modifyReplyInput">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" data-bs-dismiss="modal" id="modifyFormModalSubmitButton" class="btn btn-primary">수정</button>
	      </div>
	    </div>
	  </div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
// 경로 설정
const ctx = "${pageContext.request.contextPath}";

//삭제확인 버튼 클릭하면 삭제 form 전송
document.querySelector("#removeConfirmButton").addEventListener("click", function() {
	document.querySelector("#removeForm").submit();
});

// 좋아요 버튼 클릭시 
document.querySelector("#likeBtn").addEventListener("click", function() {
	const board_boardId = document.querySelector("#board_boardId").value;

	
	fetch(`\${ctx}/board/boardLike`, {
		method : "put",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify({board_boardId})
	})
	.then(res => res.json())
	/* .then(data => console.log(data)); */
	.then(data => {
		if (data.current == 'liked') {
			document.querySelector("#likeBtn").innerHTML = `<i class="fa-solid fa-heart"></i>`;
		} else {
			document.querySelector("#likeBtn").innerHTML = `<i class="fa-regular fa-heart"></i>`;
		}
		document.querySelector("#likeCount").innerText = data.count;
	})
});

// 댓글 리스트
listReply();

// 댓글 모달폼에서 수정 이벤트
document.querySelector("#modifyFormModalSubmitButton").addEventListener("click", function() {
	
	const content = document.querySelector("#modifyReplyInput").value;
	const boardReplyId = this.dataset.replyId;
	const data = {boardReplyId, content};
	
	
	fetch(`\${ctx}/boardReply/modify`, {
		method : "put",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => res.json())
	.then(() => listReply());
	
});

// 댓글 삭제 이벤트 추가
document.querySelector("#removeConfirmModalSubmitButton").addEventListener("click", function() {
	removeReply(this.dataset.replyId);
});

/* readReplyAndSetModalForm 선언 */
function readReplyAndSetModalForm(boardReplyId) {
	fetch(`\${ctx}/boardReply/get/\${boardReplyId}`)
	.then(res => res.json())
	.then(reply => {
		document.querySelector("#modifyReplyInput").value = reply.content;
	});
}

// 댓글 리스트
function listReply() {
	const board_boardId = document.querySelector("#board_boardId").value;
	
	fetch(`\${ctx}/boardReply/list/\${board_boardId}`)
		.then(res => res.json())
		.then(list => {
			const replyListContainer = document.querySelector("#replyListContainer");
			replyListContainer.innerHTML = ""; /* 페이지 로딩 안하고 바로 댓글 뿌림 */
			
			for (const item of list) {
				
				const modifyReplyBtnId = `modifyReplyBtn\${item.boardReplyId}`;
				const removeReplyBtnId = `removeReplyBtn\${item.boardReplyId}`;
				// console.log(item.boardReplyId);
				
				// 작성자와 로그인한 id가 같을때 버튼 나오도록
				const editBtn = `
					<div class="editBtns">
						<button class="modiBtn" data-bs-toggle="modal" data-bs-target="#modifyReplyFormModal" data-reply-id="\${item.boardReplyId}" id="\${modifyReplyBtnId}">수정</button>
						<button class="remoBtn" data-bs-toggle="modal" data-bs-target="#removeReplyConfirmModal" data-reply-id="\${item.boardReplyId}" id="\${removeReplyBtnId}">삭제</button>
					</div>`
				
				const replyDiv = 
					`<div id="comentBox">
						<div class="nickName">\${item.nickName}</div>
						<div class="contentText">\${item.content}</div>
						<div class="date">
							<i class="fa-regular fa-clock"></i>
							\${item.ago}
						</div>
						
						\${item.editable ? editBtn : ''}
						
					</div>`;
						/* // 작성자와 로그인한 id가 같을때 버튼 나오도록 판별하는 함수
						// 같으면 editBtn나오고, 아니면 빈string으로  */
					/* data-reply-id라는 attribute 통해 버튼마다 id값 부여 */
				replyListContainer.insertAdjacentHTML("beforeend", replyDiv);
					
				if (item.editable) {
					// 수정 폼 모달에 덧글 수정하기
					document.querySelector("#" + modifyReplyBtnId)
						.addEventListener("click", function() {
							document.querySelector("#modifyFormModalSubmitButton").setAttribute("data-reply-id", this.dataset.replyId);
							readReplyAndSetModalForm(this.dataset.replyId); /* db에서 댓글 내용을 가지고와 넣기 */
						
						});
						
						
						
					// 삭제확인 모달 이벤트	
					document.querySelector("#" + removeReplyBtnId)
						.addEventListener("click", function() {
							/* console.log(this.id + "삭제버튼"); */
							/* this.id는 removeReplyBtnId */
							console.log(this.dataset.replyId + "번 댓글 삭제, 모달");
							/* removeReply(this.dataset.replyId); */
							/* 여기서 this는 document.querySelector("#" + removeReplyBtnId)의 참조값 */
							document.querySelector("#removeConfirmModalSubmitButton").setAttribute("data-reply-id", this.dataset.replyId);
							/* data-reply-id의 값을 this.dataset.replyId으로 넘긴다 */
						});
				}
			}
		});
}

// 댓글 삭제
function removeReply(replyId) {
	fetch(ctx + "/boardReply/delete/" + replyId, {
		method : "delete"
	})
	.then(res => res.json())
	.then(() => listReply());
}

// 댓글 입력
const replyBtn1 = document.querySelector("#replyBtn1");

if (replyBtn1 != null) {
	
	document.querySelector("#replyBtn1").addEventListener("click", function() {
		
		const board_boardId = document.querySelector("#board_boardId").value;
		const content = document.querySelector("#content").value;
		
		const data = {
				board_boardId,
				content
		};
		
		fetch(`\${ctx}/boardReply/add`, {
			method : "post",
			headers : {
				"Content-Type" : "application/json"
			},
			body : JSON.stringify(data)
		})
		.then(res => res.json())
		.then(data => {
			document.querySelector("#content").value = "";
		})
		.then(() => listReply());
	});
}	
</script>
</body>
</html>
