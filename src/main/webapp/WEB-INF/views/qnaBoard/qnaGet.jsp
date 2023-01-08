<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>

<!DOCTYPE html>
<html>
<style>

</style>
<head>
<meta charset="UTF-8">
<title>개별문의</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
	<div class="container" style="background-color:pink;">

		<h1>문의보기</h1>
		
		  <c:choose>
		  	<c:when test="${qna.qnaCategory == 0 }">
		  	<input type="text" readonly value="배송">
		  	</c:when>
		  	<c:when test="${qna.qnaCategory == 1 }">
		  <input type="text" readonly value="교환/환불">
		  	</c:when>
		  	<c:when test="${qna.qnaCategory == 2 }">
		  	<input type="text" readonly value="기타"> 	
		  	</c:when>
		  </c:choose>
			<input type="text" readonly value="${qna.nickName }">
		
		<div class="form-floating mb-3">
		  <input type="text" class="form-control" id="floatingInput" placeholder="" name="title">
		  <label for="floatingInput">${qna.title }</label>
		</div>
		
		<div class="form-floating">
		  <textarea class="form-control" placeholder="" id="floatingTextarea" name="content" style="resize: none; height: 150px;"></textarea>
		  <label for="floatingTextarea">${qna.content }</label>
		</div>
		
		
		<%-- <input readonly type="text" value="${member_userId }" name="member_userId"> --%>
		<%-- <c:if test="${qna.member_userId == username}"> </c:if>--%>

		
			<c:url value="/qnaBoard/delete" var="deleteLink"/>
			<form id="deleteForm" action="${deleteLink }" method="post">
				<input type="hidden" name="qnaId" value="${qna.qnaId }">
			</form>
			<input id="deleteSubmit" type="submit" value="삭제">
		
		<c:url value="/main/list" var="listLink"/>
		<a href="${listLink }">
			<input type="submit" value="홈으로">
		</a>
	</div>


	
<%--댓글 작성 --%>
<hr>
<input type="hidden" id="qna_qnaId" value="${qna.qnaId }">
<!-- 로그인했을 떄
<sec:authorize access="isAuthenticated()"></sec:authorize> 관리자권한만 확인-->
<!-- 댓글 입력 -->

<div class="container" style="background-color: skyblue;">
<input type="text" id="qnaReplyInput" placeholder="답변쓰기">
<button type="button" id="qnaReplySend">작성</button>
</div>


<input type="hidden" id="memberAuth"value="${member.auth }" />
<div class="container" style="background-color: skyblue;">
	<div  id="replyListContainer"style="background-color: green;"></div>
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
	
<%-- 댓글 수정 모달 --%>
	<!-- Modal -->
<!-- <div class="modal fade" id="editReplyConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5">답변 수정</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      <label for="editReplyInput" class="form-label"></label>
		  <textarea class="form-control" id="editReplyInput" rows="3" style="resize: none;"></textarea>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" data-bs-dismiss="modal" id="editSubmit" class="btn btn-danger">수정</button>
	      </div>
	    </div>
	  </div>
	</div>	 -->	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
const ctx = "${pageContext.request.contextPath}";

listReply();
//댓글 수정
<%-- document.querySelector("#editSubmit").addEventListener("click", function(){
	const content = document.querySelector("#editReplyInput").value;
	const id = this.dataset.replyId;
	const data = {id, content};
	
	fetch(`\${ctx}/qnaReply/modify`, {
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	//.then(res => res.json())
	.then(() => listReply());
}); --%>

//댓글 수정 모달
<%--function readReplyAndSetModalFrom(qnaReplyId) {
	fetch(`\${ctx}/qnaReply/get/\${qnaReplyId}`)
	//.then(res => res.json())
	.then(reply => {
	document.querySelector("#editReplyInput").value = reply.content;
	});
} --%>


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
		const deleteButton = `<button data-bs-toggle="modal" data-bs-target="#deleteReplyConfirmModal" data-reply-id="\${item.qnaReplyId}" id="\${deleteReplyButtonId}">삭제</button>`
		
		const memberAuth = document.querySelector("#memberAuth").value;
		
		
		//const editReplyButtonId = `editReplyButton\${item.qnaReplyId}`;
		//const editButton = `<button data-bs-toggle="modal" data-bs-target="#editReplyConfirmModal" data-reply-id="\${item.qnaReplyId}" id="\${editReplyButtonId}">수정</button>`
		
		const replyDiv = ` 
							<div id="reply"> 
							<label for="qnaAnswer" class="form-label">\${item.writer} 관리자 답변</label>
							<textarea class="form-control" id="qnaAnswer" rows="3" style="resize: none;" readonly>\${item.content} \${item.insertDatetime}
							</textarea>
							 \${deleteButton} 	
						`;
							replyListContainer.insertAdjacentHTML("beforeend", replyDiv);
							
							//수정 폼 모달에 댓글 내용 넣기
							<%--document.querySelector("#" + editReplyButtonId).addEventListener("click", function(){
								document.querySelector("#editSubmit").setAttribute("data-reply-id", this.dataset.replyId);
								readReplyAndSetModalForm(this.dataset.replyId);
							}); --%>
							
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

















