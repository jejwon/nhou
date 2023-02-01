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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
/* Import Google font - Poppins */
@import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap");
.container {
	font-family: "Poppins", sans-serif;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>

	<div class="container">
		<c:url value="/store/storeModify" var="modifyLink">
			<c:param name="productId" value="${store.productId }"></c:param>
		</c:url>
								
		<sec:authentication property="name" var="username" />
						
		<%-- 작성자와 authentication.name 같으면 보여줌 --%>
		<c:if test="${store.member_userId == username}">
			<a class="btn btn-warning" href="${modifyLink }" style="float: right;">
				<i class="fa-solid fa-pen-to-square"></i>
			</a>
		</c:if>
		
			<sec:authorize access="not isAuthenticated()">
				style="pointer-events: none;"
			</sec:authorize>
		
		<form>
			
			<br>
			<br>
			
			<div class="card mb-3" style="max-width: 2000px; border:none;">
				<div class="row g-0">
				<div class="col-md-4">
					<img src="/image/${store.productId}/${store.productImage}" class="rounded" alt="...">
				</div>
				<div class="col-md-8">
					<div class="card-body">
					<h1 class="card-title">${store.productName }</h1>
						<p class="card-text"><small class="text-muted">⭐⭐⭐⭐⭐5.0 / 💬 ${store.reviewCount }</small></p>
					<h2 class="card-text">${store.price } 원</h2>
					
					<hr>
		
					<h5 class="card-text"><small class="text-muted">🧡${store.member_userId }</small></h5>
					
					<h6 class="card-text" name="productContent" id="productContent">${store.productContent }</h6>		
					
					<br>

					수량
					<select class="form-select" aria-label="Default select example" name="count">
					  <option selected>수량 선택</option>
					  <option value="1">1</option>
					  <option value="2">2</option>
					  <option value="3">3</option>
					  <option value="4">4</option>
					  <option value="5">5</option>
					  <option value="6">6</option>
					  <option value="7">7</option>
					  <option value="8">8</option>
					  <option value="9">9</option>
					  <option value="10">10+ 문의 주세요</option>
					</select>
					
					<br>
									
					<div class="mb-3">
						<label for="option">Option</label>
  						<input type="text" class="form-control" name="option" id="option" placeholder="색상/사이즈" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
					</div>
		
					<input type="hidden" name="price" value="${store.price }" readonly>
					<br>
					
					<h5 class="selling-price">
						<span class="price_left" style="text-align-last: left;">주문금액</span>
						<span class="price_right" style="text-align-last: right;">
							<input type="text" name="sum" value="${store.price }" style="border:none" readonly>
								원
						</span>
					</h5>
		
					<br>
					<input type="hidden" value="${member.userId }" name="member_userId">
					<input type="hidden" value="${store.productId }" name="product_productId">			
					<button id="putCart" type="button" class="btn btn-success btn-lg border border-success-subtle" style="width: 250px; height: 55px; background-color: #588068;">장바구니</button>			
					
					<a href="/cart/pay"><button type="button" class="btn btn-success btn-lg border border-success-subtle" style="width: 250px; height: 55px; background-color: #588068;">바로구매</button></a>
		
					</div>					
				</div>
				
					<nav id="navbar-example2" class="navbar navbar-expand-lg bg-body-tertiary px-3 mb-3" style="background-color: #e6cc88;">
						<div class="navbar-brand">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						  <li class="nav-item">
							<a class="nav-link">상세정보</a>
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
							</div>
							</c:forEach>
					</div>
							<hr>
				</div>		
			</div>
			
			
		</form>
		
		<%-- 댓글 메시지 토스트 --%>
		<div id="reviewMessageToast" class="toast align-items-center top-0 start-50 translate-middle-x position-fixed" role="alert" aria-live="assertive" aria-atomic="true">
		  <div class="d-flex">
		    <div id="reviewMessage1" class="toast-body">
		      Hello, world! This is a toast message.
		    </div>
		    <button type="button" class="btn-close me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
		  </div>
		</div>
		
		<div class="container-md">
			<div class="row">
				<div class="col">
					<h3 id="scrollspyHeading2"><i class="fa-solid fa-comments"></i></h3>
				</div>
			</div>					
			<div class="row">
				<div class="col">
				
					<input type="hidden" id="product_productId" value="${store.productId }">
					 
					<sec:authorize access="isAuthenticated()">	
						<!-- 댓글 입력 -->
						<div class="input-group">
							<input type="text" class="form-control" id="reviewInput1">
							<button class="btn btn-outline-secondary" id="reviewSendButton1"><i class="fa-solid fa-reply"></i></button>
						</div>
					</sec:authorize>
					<sec:authorize access="not isAuthenticated()">
						<div class="alert alert-light">
							댓글을 작성하시려면 로그인하세요.
						</div>				
					</sec:authorize>	
				</div>
			</div>
			
			<div class="row mt-3">
				<div class="col">
					<div class="list-group" id="reviewListContainer">
						<!-- 댓글 리스트 -->
					</div>
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
			        <input type="text" class="form-control" id="modifyReviewInput">
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
			        <button type="button" data-bs-dismiss="modal" id="modifyFormModalSubmitButton" class="btn btn-primary">수정</button>
			      </div>
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
			        <button type="button" data-bs-dismiss="modal" id="removeConfirmModalSubmitButton" class="btn btn-primary">삭제</button>
			      </div>
			    </div>
			  </div>
			</div>
			
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
const ctx = "${pageContext.request.contextPath}";

//장바구니 버튼 누르면 모달창 열림
//document.querySelector("#putCart").addEventListener("click", function(){ })

//장바구니에 들어갈 정보
const cart = {
		member_userId : $('input[name=member_userId]').val(),
		product_productId : $('input[name=product_productId]').val(),
		option : '',
		count : ''
		
}

//장바구니 버튼 누르고 담기
$('#putCart').on('click', function(){
	 //console.log(cart);
	 cart.count = $('select[name=count]').val();
	 cart.option = $('input[name=option]').val();
//장바구니 추가를 요청하는 ajax 코드
	$.ajax({
		url: '/cart/cartInsert', //호출할 url 
		dataType: 'JSON',
		type: 'POST', //url 호출 할 방법(GET, POST, PATCH 등)
		data: cart, //서버로 보낼 데이터
		success: function(){
			//서버가 요청을 성공적으로 수행했을 때 수행될 메소드, 파라미터는 서버가 반환한 값
		}

	})
	
}) 


//수량 input 클릭시 옆에 합계 변함
	$(function(){
		
		$('select[name=count]').on('click', function(){
			const count = $('select[name=count]').val();
			const price = $('input[name=price]').val();
			const sum = count * price;
			
			$('input[name=sum]').prop('value', sum);
			
			
		})
	})


listReview();

const toast = new bootstrap.Toast(document.querySelector("#reviewMessageToast"));

document.querySelector("#modifyFormModalSubmitButton").addEventListener("click", function() {
	
	const content = document.querySelector("#modifyReviewInput").value;
	const productReplyId = this.dataset.reviewId;
	const data = {productReplyId, content};
	
	fetch(`\${ctx}/storeReview/modify`, {
		method : "put",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => res.json)
	.then(data => { 
		document.querySelector("#reviewMessage1").innerText = data.message;
		toast.show();
	})	
	.then(() => listReview());
});

document.querySelector("#removeConfirmModalSubmitButton").addEventListener("click", function() {
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
		const reviewListContainer = document.querySelector("#reviewListContainer");
		reviewListContainer.innerHTML = "";
		
		for (const item of list) {
			
			const modifyReviewButtonId = `modifyReviewButton\${item.productReplyId}`;
			const removeReviewButtonId = `removeReviewButton\${item.productReplyId}`;
			// console.log(item.productReplyId);
			
			const editButton = `
				<div>
					<button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#modifyReviewFormModal" data-review-id="\${item.productReplyId}" id="\${modifyReviewButtonId}">
						<i class="fa-solid fa-pen"></i>
					</button>
					<button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#removeReviewConfirmModal" data-review-id="\${item.productReplyId}" id="\${removeReviewButtonId}">
						<i class="fa-solid fa-x"></i>
					</button>
				</div>			
			`
			
			const reviewDiv = `
				<div class="list-group-item d-flex">
					<div class="me-auto">
						<h5>
							<i class="fa-solid fa-user"></i>
							\${item.nickName}
						</h5>
						<small class="text-muted">
							\⭐⭐⭐⭐⭐5.0
						</small>
						<div>
							\${item.content}
						</div>
						<small class="text-muted">
							<i class="fa-regular fa-clock"></i> 
							\${item.ago}
						</small>
					</div>
					\${item.editable ? editButton : ''}
				</div>`;
			reviewListContainer.insertAdjacentHTML("beforeend", reviewDiv);

			if(item.editable) {
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
					document.querySelector("#removeConfirmModalSubmitButton").setAttribute("data-review-id", this.dataset.reviewId);
					// removeReview(this.dataset.reviewId);
				});
		  }
	   }
   });
} 


function removeReview(reviewId) {
	// /review/remove/{productReplyId}, method:"delete"
	fetch(ctx + "/storeReview/remove/" + reviewId, {
		method: "delete"
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#reviewMessage1").innerText = data.message;
		toast.show();
	})
	.then(() => listReview());
}

// 댓글의 data 전송 버튼
const reviewSendButton1 = document.querySelector("#reviewSendButton1");
if (reviewSendButton1 != null) {
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
			toast.show();
		})
		.then(() => listReview());
	});
}
</script>
</body>
</html>