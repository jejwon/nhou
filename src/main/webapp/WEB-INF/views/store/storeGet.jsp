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

<h1> 상품 조회 페이지 </h1>

	<div class="container">
		<form>
			<div class="card mb-3" style="max-width: 2000px;">
				<div class="row g-0">
				<div class="col-md-4">
					<img src="/image/${store.productId}/${store.productImage}" class="img-fluid rounded-start" alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body">
					<h1 class="card-title">${store.productName }</h1>
					<p class="card-text"><small class="text-muted">⭐⭐⭐⭐⭐${store.star } 리뷰${store.productReplyId }</small></p>
					<h2 class="card-text">${store.price } 원</h2>
					
					<br>
					<hr>
					<br>
		
					<h5 class="card-text">🧡판매자</h5>
		
					<br>
		
					옵션1
					<select class="form-select" aria-label="Default select example">
						<option selected>색상</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
		
					<br>
		
					옵션2
					<select class="form-select" aria-label="Default select example">
						<option selected>사이즈</option>
						<option value="1">One</option>
						<option value="2">Two</option>
						<option value="3">Three</option>
					</select>
					
					<br>
					
					<div class="mb-3">
						<label for="chooseOption">Option</label>
  						<input type="text" class="form-control" name="chooseOption" id="chooseOption" placeholder="색상/사이즈" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>
		
		
					<br>
		
					<h5 class="selling-price" readonly>
						<span class="price_left" style="text-align-last: left;">주문금액</span>
						<span class="price_right" style="text-align-last: right;">
							<span class="price_number">${store.price }</span>
								원
						</span>
					</h5>
		
					<br>
		
					<button type="button" class="btn btn-outline-primary btn-lg" style="width: 250px; height: 55px;">장바구니</button>
					<button type="button" class="btn btn-primary btn-lg" style="width: 250px; height: 55px;">바로구매</button>
		
					</div>					
				</div>					
		</form>
		
				<nav id="navbar-example2" class="navbar navbar-expand-lg bg-body-tertiary px-3 mb-3" style="background-color: #e6cc88;">
					<div class="navbar-brand">
					<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					  <li class="nav-item">
						<a class="nav-link" href="#scrollspyHeading1">상세정보</a>
					  </li>
					  <li class="nav-item">
						<a class="nav-link" href="#scrollspyHeading2">리뷰</a>
					  </li>
					</ul>
					</div>
				</nav>
		
				  <div data-bs-spy="scroll" data-bs-target="#navbar-example2" data-bs-root-margin="0px 0px -40%" data-bs-smooth-scroll="true" class="scrollspy-example bg-body-tertiary p-3 rounded-2" tabindex="0">
					<h4 id="scrollspyHeading1">상세정보</h4>
						<c:forEach items="${store.productFileName}" var="file">
						<div class="col-md-4">
							<img src="/image/${store.productId}/${file}" class="img-fluid rounded-start" alt="...">
							<p>${store.productContents }</p>
						</div>
						</c:forEach>
					<h4 id="scrollspyHeading2">리뷰 ${store.productReplyId }</h4>
					<p>따뜻해요!</p>
				  </div>
				</div>		
			</div>
		
			<!-- 수정 버튼 -->
			<c:url value="/store/storeModify" var="modifyLink">
				<c:param name="productId" value="${store.productId }"></c:param>
			</c:url>
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a class="btn btn-warning" href="${modifyLink }">수정</a>
			</div>			

			<hr>
			<div id="reviewMessage1"></div>

			<!-- 댓글 입력 -->	
			<div class="container-md">
				<div class="row">
					<div class="col">
						<input type="hidden" id="product_productId" value="${store.productId }"> 
						<input type="text" id="reviewInput1">
						<button id="reviewSendButton1">댓글쓰기</button>
					</div>
				</div>
			</div>
			
			<!-- 댓글 리스트 -->
			<div class="row">
				<div class="col">
					<div id="reviewListContainer">
					
					</div>
				</div>
			</div>
			
			<%-- 댓글 삭제 확인 모달 --%>
			<!-- Modal -->
			<div class="modal fade" id="removeReviewConfirmModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
			        <button type="button" data-bs-dismiss="modal" id="removeReviewConfirmModalSubmitButton" class="btn btn-primary">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
			
			<%-- 댓글 수정 모달 --%>
			<!-- Modal -->
			<div class="modal fade" id="modifyReviewFormModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5">댓글 수정</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			        <input type="text" id="modifyReviewInput">
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <button type="button" data-bs-dismiss="modal" id="modifyFormModalSubmitButton" class="btn btn-primary">수정</button>
			      </div>
			    </div>
			  </div>
			</div>						
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script>
const ctx = "${pageContext.request.contextPath}";

listReview();

document.querySelector("#modifyFormModalSubmitButton").addEventListener("click", function() {
	const content = document.querySelector("#modifyReviewInput").value;
	const productReplyId = this.dataset.reviewId;
	const data = {productReplyId, content}
	
	fetch(`\${ctx}/storeReview/modify`, {
		method : "put",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => res.json)
	.then(data => document.querySelector("#reviewMessage1").innerText = data.message)
	.then(() => listReview());
});

document.querySelector("#removeReviewConfirmModalSubmitButton").addEventListener("click", function() {
	removeReview(this.dataset.reviewId);
});

function readReviewAndSetModalForm(productReplyId) {
	fetch(`\${ctx}/storeReview/get/\${productReplyId}`)
	.then(res => res.json())
	.then(review => {
		document.querySelector("#modifyReviewInput").value = review.content;
	});
}

// 댓글 list view
function listReview() {
	const product_productId = document.querySelector("#product_productId").value;
	fetch(`\${ctx}/storeReview/list/\${product_productId}`)
	.then(res => res.json())
	.then(list => {
		const reviewListContainer = document.querySelector("#reviewListContainer")
		reviewListContainer.innerHTML = "";
		
		for (const item of list) {
			
			const modifyReviewButtonId = `modifyReviewButton\${item.productReplyId}`;
			const removeReviewButtonId = `removeReviewButton\${item.productReplyId}`;
			// console.log(item.productReplyId);
			
			const reviewDiv = `
				<div>\${item.content}
					 <button data-bs-toggle="modal" data-bs-target="#modifyReviewFormModal" id="\${modifyReviewButtonId}">수정</button>
					 <button data-bs-toggle="modal" data-bs-target="#removeReviewConfirmModal" data-review-id="\${item.productReplyId}" productReplyId="\${removeReviewButtonId}">삭제</button>
				</div>`;
			reviewListContainer.insertAdjacentHTML("beforeend", reviewDiv);
			// 수정 폼 모달에 수정 댓글 입력 
			document.querySelector("#" + modifyReviewButtonId)
				.addEventListener("click", function() {
					document.querySelector("#modifyFormModalSubmitButton").setAttribute("data-review-id", this.dataset.reviewId);
					readReviewAndSetModalForm(this.dataset.reviewId);
				});
			
			// 삭제확인 버튼에 reviewId 옮기기
			document.querySelector("#" + removeReviewButtonId)
				.addEventListener("click", function() {
					// console.log(this.productReplyId + "번 삭제버튼 클림 됨");
					console.log(this.dataset.reviewId + "번 댓글 삭제할 예정", "모달 띄움")
					document.querySelector("#removeReviewConfirmModalSubmitButton").setAttribute("data-review-id", this.dataset.reviewId);
					// removeReview(this.dataset.reviewId);
				});
		}
	});
}


function removeReview(reviewId) {
	// /review/remove/{productReplyId}, method:"delete"
	fetch(ctx + "/review/remove/" + reviewId, {
		method: "delete"
	})
	.then(res => res.json())
	.then(data => document.querySelector("#reviewMessage1").innerText = data.message)
	.then(() => listReview());
}

// 댓글의 data 전송 버튼
document.querySelector("#reviewSendButton1").addEventListener("click", function() {
	const product_productId = document.querySelector("#product_productId").value;
	const content = document.querySelector("#reviewInput1").value;
	
	const data = {
			product_productId,
			content
	};
	
	fetch(`\${ctx}/storeReview/add`, {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#reviewInput1").value = "";
		document.querySelector("#reviewMessage1").innerText = data.message;
	})
	.then(() => listReview());

});

</script>
</body>
</html>