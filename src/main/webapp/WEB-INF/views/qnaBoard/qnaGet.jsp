<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개별문의</title>
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
#qnaCategory {
	margin: 20px; 
	width: 130px;
}
#nickName {
	margin: 20px; 
	width: 200px;
}
#titleBox {
	margin: 20px; 
}
#contentBox {
	margin: 20px; 
}
/* 삭제버튼 */
#button1 {
	text-align: center;
	position: relative;
}
#deleteSubmit {
	display: inline-block;
	position: absolute;
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
	left: 300px;
	background-color: #D5D4D1;
}
/*댓글 삭제 버튼*/
#button3 {
	text-align: center;
	position: relative;
}
.deleteButtonStyle {
	display: inline-block;
	position: absolute;
	/* background-color: #DCC1B0; */
}

/*댓글 작성 버튼*/
#replySubmit {
	text-align: center;
	position: relative;
}
#qnaReplySend {
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
<section class="bg-light p-5">
	<div class="container" >
			<h1>문의보기</h1>
		
		<select id="qnaCategory"class="form-select" aria-label="Disabled select example" disabled> 
	  		<c:choose>
		  	<c:when test="${qna.qnaCategory == 0 }">
	  		<option selected>배송</option>
			</c:when>
			<c:when test="${qna.qnaCategory == 1 }">
	  		<option selected>교환/환불</option>
			</c:when>
			<c:when test="${qna.qnaCategory == 2 }">
	  		<option selected>기타</option>
			</c:when>
			</c:choose>
		</select>


		<div  id="nickName" class="input-group input-group-sm mb-3">
		  <span class="input-group-text" id="inputGroup-sizing-sm">작성자</span>
		  <input type="text"  value="${qna.nickName }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"readonly>
		</div>
		<div id="titleBox"class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingInput" value="${qna.title }" name="title"readonly>
		  <label for="floatingInput">제목</label>
		</div>
		
		<div id="contentBox"class="form-floating">
		  <textarea class="form-control"id="floatingTextarea" name="content" style="resize: none; height: 150px;"readonly>${qna.content }</textarea>
		  <label for="floatingTextarea">문의 내용</label>
		</div>
		
		
		<%-- <input readonly type="text" value="${member_userId }" name="member_userId"> --%>
		<%-- <c:if test="${qna.member_userId == username}"> </c:if>--%>

		
				<c:url value="/qnaBoard/delete" var="deleteLink"/>
				<form id="deleteForm" action="${deleteLink }" method="post">
					<input type="hidden" name="qnaId" value="${qna.qnaId }">
				</form>				
			<div id="button1">	
				<button id="deleteSubmit" class="btn btn-outline">삭제</button>					
			</div>

			<div class="button2">
				<c:url value="/main/list" var="listLink"/>
				<a href="${listLink }">
					<button id="back"class="btn btn-outline">메인으로</button>
				</a>
			</div>
	</div>
	
<%--댓글 작성 --%>
<br>
<br>
<input type="hidden" id="qna_qnaId" value="${qna.qnaId }">
<!-- 로그인했을 떄
<sec:authorize access="isAuthenticated()"></sec:authorize> 관리자권한만 확인-->
<!-- 댓글 입력 -->
<hr>
<div class="container">
	<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="qnaReplyInput" placeholder="답변쓰기" >
		  <label for="floatingInput"></label>
	</div>
	<div id="replySubmit">
		<button id="qnaReplySend"class="btn btn-outline">작성</button>	
	</div>
</div>
<br>
<br>

<input type="hidden" id="memberAuth"value="${member.auth }" />
<div class="container" >
	<div  id="replyListContainer"></div>
</div>			


<%-- 댓글 삭제 확인 모달 --%>
	<!-- Modal -->
	<div class="modal fade" id="deleteReplyConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">답변 삭제 확인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        답변을 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" data-bs-dismiss="modal" id="deleteReplySubmit" class="btn btn-danger">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
</section>	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
const ctx = "${pageContext.request.contextPath}";

listReply();

//삭제 모달 클릭 시 댓글 삭제
document.querySelector("#deleteReplySubmit").addEventListener("click", function(){
	deleteReply(this.dataset.replyId);
})

//댓글 삭제
function deleteReply(qnaReplyId){
	fetch(ctx + "/qnaReply/delete/" + qnaReplyId, {
		method : "delete"
	})
	//메세지 받은 게 없어서 코드 지움
	//.then(res => res.json())
	.then(() => listReply());
} 

//답변 리스트 (1개 작성) replyDto(시간 형식 변환 확인)
function listReply(){
	const qna_qnaId = document.querySelector("#qna_qnaId").value;
	
	fetch(`\${ctx}/qnaReply/list/\${qna_qnaId}`)
	.then(res => res.json())
	.then(list => {
		const replyListContainer = document.querySelector("#replyListContainer");
		//한 번 지우고 다시 불러오기
		replyListContainer.innerHTML = "";
		
		for(const item of list){
		
		const deleteReplyButtonId = `deleteReplyButton\${item.qnaReplyId}`;
		const deleteButton = `<button  class="btn btn-outline " data-bs-toggle="modal" data-bs-target="#deleteReplyConfirmModal" 
		data-reply-id="\${item.qnaReplyId}" id="\${deleteReplyButtonId}"
		style="background-color: #DCC1B0; margin: 0 0 0 70px;">삭제</button>`
		
		const memberAuth = document.querySelector("#memberAuth").value;
		
		
		//const editReplyButtonId = `editReplyButton\${item.qnaReplyId}`;
		//const editButton = `<button data-bs-toggle="modal" data-bs-target="#editReplyConfirmModal" data-reply-id="\${item.qnaReplyId}" id="\${editReplyButtonId}">수정</button>`
		
		const replyDiv = ` 
							<label for="qnaAnswer" class="form-label"></label>							
							<textarea class="form-control" id="qnaAnswer" rows="3" style="resize: none; height:150px;" readonly>
							\${item.writer} 관리자 답변
							\${item.content}</textarea>						
							<div class="time">
							 \${item.insertDatetime}
							</div>
							<div id="button3">
							\${deleteButton} 								
							</div>
						`;
							replyListContainer.insertAdjacentHTML("beforeend", replyDiv);
							
							//삭제 확인 버튼에 replyId 옮기기
							document.querySelector("#" + deleteReplyButtonId).addEventListener("click", function(){
								//console.log(this.dataset.replyId + "삭제버튼 클릭됨"); //data-reply-id : attribute 속성
								
								document.querySelector("#deleteReplySubmit").setAttribute("data-reply-id", this.dataset.replyId);
								//deleteReply(this.dataset.replyId);
							});	
		}					
	});
}

//댓글 입력
document.querySelector("#qnaReplySend").addEventListener("click", function(){
	const qna_qnaId = document.querySelector("#qna_qnaId").value;
	const content = document.querySelector("#qnaReplyInput").value;
	
	const data = {
			qna_qnaId,
			content
	};
	
	fetch(`\${ctx}/qnaReply/insert`, {
		method: "post",
		headers: {
			"Content-Type" : "application/json"
		},
		body: JSON.stringify(data) 
	})
	.then(res=>res.json()) //순서대로 실행
	.then(data=>{
		document.querySelector("#qnaReplyInput").value="";
	})
	.then(() => listReply());
});

//삭제 버튼 클릭하면 삭제 form 전송
document.querySelector("#deleteSubmit").addEventListener("click", function(){
	document.querySelector("#deleteForm").submit();
});
</script>
</body>
</html>

















