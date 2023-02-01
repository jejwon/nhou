<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
.serv_list {
	padding-top: 30px;
	padding-bottom: 40px;
}
.serv_list .container {
	max-width: 1100px;
	height: 1500px;
	margin: auto;
}

.serv_list .container .title ul {
	padding-left: 0;
	list-style: none;
}

.serv_list .container .title ul li{
	display: inline;
	margin-right: 30px;
}

.serv_list .container .title ul li a{
	text-decoration: none;
	color: #444;
}

.serv_list .container .item_list{
	display: block;
	flex-wrap: wrap;
	justify-content: space-between;
}

.serv_list .container .item_list .card{
	border: 1px solid #eee;
	border-radius: 5px;
	height: 350px;
	width: 250px;
	padding: 5px;
	margin-bottom: 10px;
	margin-right: 0;
	float: left;
}

.serv_list .container .item_list .card img{
	height: 200px;
	width: 250px;
}
.serv_list .container .item_list .card .text p{
	font-size: 14px;
	opacity: .8;
	margin-bottom: 10px;
}
.serv_list .container .item_list .card .text p::after{
	content: "원";
}
.serv_list .container .item_list .card .text button{
	background: black;
	color: white;
	border: 2px solid white;
	border-radius: 5px;
	padding: 5px 10px;
	font-size: 10px;
	transition: .5s ease;
}
.serv_list .container .item_list .card .text button:hover{
	transition: .5s ease;
	border: 2px solid black;
	background: transparent;
	color: black;
}

/* 바닥영역 */
#buttom {
	margin: 30px 0;
	text-align: center;
	position: absolute;
	top: 80%;
}

#buttom .paginationBox {
	display: inline-block;
}

.cateBtn {
visibility: hidden;
}


</style>
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>

<div class="container-sm">
	<c:if test="${not empty message }">
		<div class="alert alert-warning">
			${message}
		</div>
	</c:if>
	
	<!-- 상품 리스트 -->
	<div class="serv_list">
		<div class="container">
			<div class="title">
				<c:url value="/store/storeList" var="listLink"></c:url>
				<form action="${listLink }">
					<div class="frame">
						<button class="cateBtn" name="productCategory_categoryId" value="1">FURNITURE</button>
						<button class="cateBtn" name="productCategory_categoryId" value="2">BEDDING</button>
						<button class="cateBtn" name="productCategory_categoryId" value="3">LIVING FABRIC</button>
						<button class="cateBtn" name="productCategory_categoryId" value="4">KITCHEN</button>
						<button class="cateBtn" name="productCategory_categoryId" value="5">DECO</button>
						<button class="cateBtn" name="productCategory_categoryId" value="6">PETS</button>
					</div>
				</form>
			</div>
		
		<c:forEach items="${storeList }" var="store">
		<c:url value="/store/storeGet" var="getLink">
			<c:param name="productId" value="${store.productId }"></c:param>
		</c:url>
			<div class="item_list">
				<div class="card" onclick="location.href='${getLink}'">
					<div class="img">
						<img src="" alt="">
					</div>
					<div class="text">
						<h2>${store.productName }</h2> <!-- 상품 이름 -->
						<span>${store.categoryName }</span> <!-- 상품 설명 -->
						<p>${store.price }</p> <!-- 상품 설명 -->
						<button><i class="fa fa-check" aria-hidden="true"></i>사러가기</button>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
	</div>
	
	<!-- 아래영역 -->
	<div id="bottom">
	<!-- 검색창 -->
	<div class="searchBox">
		<c:url value="/store/storeList" var="listLink"></c:url>
		<form id="searchForm" action="${pageContext.request.contextPath}/store/storeList" method="get" class="d-flex">
			<select class="searchSelect" name="type">
				<option value=""
						<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
					<option value="PM"
						<c:out value="${pageMaker.cri.type eq 'PM'?'selected':''}"/>>전체</option>
					<option value="P"
						<c:out value="${pageMaker.cri.type eq 'P'?'selected':''}"/>>상품명</option>
					<option value="M"
						<c:out value="${pageMaker.cri.type eq 'M'?'selected':''}"/>>판매자명</option>
			</select>
			<!-- 검색바 -->
			<div class="searchWrap">
				<input type="text" name='keyword' placeholder="검색어"
				        value='<c:out value="${pageMaker.cri.keyword }"/>'>
				<input type='hidden' name='pageNum'
						value='<c:out value="${pageMaker.cri.pageNum }"/>'> 
				<input type='hidden' name='amount'
						value='<c:out value="${pageMaker.cri.amount }"/>'>
				
				<button class="searchBtn" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
			</div>
		</form>
	</div>
	
	<!-- 페이지네이션 -->
	<div class="paginationBox">
		<ul class="pagination" style="position: absolute; right: 50%;">
			<c:if test="${pageMaker.prev }">
				<li class="page-item">
					<a class="page-link" href="${pageMaker.startPage -1 }" aria-label="Previous"> <i class="fa-solid fa-angle-left"></i></a>
				</li>
			</c:if>
			
			<c:forEach var ="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
				<li class="page-item ${pageMaker.cri.pageNum == num ?"active" : "" }"><a class="page-link" href="${num }">${num }</a></li>
			</c:forEach>
			
			<c:if test="${pageMaker.next }">
				<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1 }" aria-label="Next"> <i class="fa-solid fa-angle-right"></i></a>
				</li>
			</c:if>
		</ul>
	</div>
	
	<form id="actionForm" action="${pageContext.request.contextPath}/store/storeList" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
		<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
		<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
	</form>
</div>
</div> <!-- 전체컨테이너 -->
<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";
/* 페이징 버튼처리 */
var actionForm = document.getElementById("actionForm");

let pageButtons = document.querySelectorAll(".page-item a")

for (const button of pageButtons){
	button.addEventListener("click", function(e) {
		e.preventDefault();
		console.log('click');
		actionForm.querySelector("input[name='pageNum']").value= this.getAttribute("href");
		actionForm.submit();	
	})
}

/* 검색 이벤트 처리 */

var searchForm = document.getElementById("searchForm");
	
document.querySelector("#searchForm button").addEventListener("click", function(e) {
		e.preventDefault();
		//화면에 검색 종류가 없다면 검색하지 않도록 제어
		if(searchForm.querySelector("select[name='type']").value=="") {
			alert("검색 종류를 선택하세요");
			return false;
		}
		//화면에 키워드가 없다면 검색을 하지 않도록 제어
		if(searchForm.querySelector("input[name='keyword']").value=="") {
			alert("키워드를 입력하세요");
			return false;
		}
		
		//검색버튼을 클릭하면 <form>태그의 전송을 막고, 페이지 번호는 1 이되도록 처리
		searchForm.querySelector("input[name='pageNum']").value="1";
		
		searchForm.submit();
});
</script>
</body>
</html>