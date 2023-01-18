<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인테리어 소품은 여기에서!</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
/* 광고 슬라이더 */
.main_slider {
	width: 100%;
	height: 700px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	margin-top: 100px;
}

.fill_hight {
	height: 100%;
}

.main_slider_content {
	width: 60%;
}

.main_slider_content h6 {
	font-weight: 500;
	text-transform: uppercase;
	margin-bottom: 20px;
}

.main_slider_content h1 {
	font-weight: 400;
	line-height: 1;
}

.red_button {
	display: inline-flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	width: auto;
	height: 40px;
	background: #fe4c50;
	border-radius: 3px;
	transition: all 0.3s ease;
}

.red_button a {
	display: block;
	color: #fff;
	text-transform: uppercase;
	font-size: 14px;
	font-weight: 500;
	text-align: center;
	line-height: 40px;
	width: 100%;
	text-decoration: none;
	color: inherit;
}

.red_button:hover {
	background: #fe7c7f;
}

.shop_now_button {
	width: 140px;
	margin-top: 32px;
}

/* 배너 */
.banner {
	width: 100%;
	margin-top: 30px;
}

.banner_item {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	height: 100px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
}

.banner_category {
	height: 20px;
}

/* 상품 리스트 */
#mainList>ul li {
    list-style-type: none;
    padding: 0px;
    margin: 0px 0px 15px 0px;
    float: left;
    width: 23%;
}

.con {
    margin-left: auto;
    margin-right: auto;
}

.listLi {
    box-sizing: border-box;
    margin-bottom: 20px;
}

.listLi:hover {
	cursor: pointer;
}

.listUl::after {
    content: "";
    display: block;
}

.img-box {
	width: 260px;
}
.img-box > img {
    display: block;
    width: 100%;
    height: 250px;
    text-align: center;
}

.list > ul > li {
    width: calc(100% / 6);
}

.list > ul > li {
    padding: 0 10px;
}

.list > ul {
    margin: 0 -10px;
}

.list > ul > li > .product-name {
    text-align: center;
    font-weight: bold;
    width: 260px;
}
.list > ul > li:hover > .product-name {
    text-decoration: underline;
}

.list > ul > li > .product-price {
    text-align: center;
    font-weight: bold;
    font-size: 1.3rem;
    width: 260px;
}

.list > ul > li > .product-price::after {
    content: "원";
    font-size: 1rem;
    font-weight:normal;
}


</style>
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<div class="container">

	<!-- 광고 헤더 -->
	<div class="main_slider" style="width: 1200px; height: 500px; margin:10px; background-image: url('https://i.pinimg.com/564x/10/92/79/10927995b066d30989a9e9e315264573.jpg')">
		<div class="container fill_hight">
			<div class="row align-items-center fill_hight">
				<div class="col">
					<div class="main_slider_content">
						<h6>상품</h6>
						<h1>겨울 행사중</h1>
						<div class="red_button shop_now_button">
							<a href="#">Shop now</a>
						</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 배너 -->
		<div class="banner">
			<div class="container">
				<div class="row">
					<div class="col-md">
						<div class="banner_item align-item-center" style="width:150px; height: 150px; margin: 0px; padding: 0px; background-image: url('https://ifh.cc/g/wyDryA.png')">
							<div class="banner_category">
								<a href="#"></a>
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="banner_item align-item-center" style="width:150px; height: 150px; margin: 0px; padding: 0px; background-image: url('https://ifh.cc/g/mJnV6B.png')">
							<div class="banner_category">
								<a href=""></a>
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="banner_item align-item-center" style="width:150px; height: 150px; margin: 0px; padding: 0px; background-image: url('https://ifh.cc/g/nWJpj4.png')">
							<div class="banner_category">
								<a href="#"></a>
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="banner_item align-item-center" style="width:150px; height: 150px; margin: 0px; padding: 0px; background-image: url('https://ifh.cc/g/Sb3ofp.png')">
							<div class="banner_category">
								<a href="#"></a>
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="banner_item align-item-center" style="width:150px; height: 150px; margin: 0px; padding: 0px; background-image: url('https://ifh.cc/g/LXKpd9.png')">
							<div class="banner_category">
								<a href="#"></a>
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="banner_item align-item-center" style="width:150px; height: 150px; margin: 0px; padding: 0px; background-image: url('https://ifh.cc/g/74dnG3.png')">
							<div class="banner_category">
								<a href="#"></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<div id="mainList" class="list con">
	<c:forEach items="${list }" var="list">
		<c:url value="/store/storeGet" var="getLink">
			<c:param name="productId" value="${list.productId }"></c:param>
		</c:url>
    <ul class="listUl">
        <li class="listLi" onclick="location.href='${getLink}'">
            <div class="img-box"><img src="http://bnx.oa.gg/img/bnx_16fw_visual_01_list.jpg" alt=""></div>
            <div class="product-name"><c:out value="${list.productName }"></c:out></div>
            <div class="product-price"><c:out value="${list.price }"></c:out></div>
        </li>
    </ul>
    </c:forEach>
    </div>
	<!-- 상품 리스트 -->
	<%-- <table class="product_table">
		<thead>
			<tr>
				<td>#</td>
				<td>상품 이름</td>
				<td>카테고리</td>
				<td>판매자</td>
			</tr>
		</thead>
		
		<c:forEach items="${list }" var="list">
		<tr>
			<td><c:out value="${list.productId }"></c:out></td>
			<td><c:out value="${list.productName }"></c:out></td>
			<td><c:out value="${list.productCategory_categoryId }"></c:out></td>
			<td><c:out value="${list.nickName }"></c:out></td>
		</tr>
		</c:forEach> 
	</table> --%>
	
	<!-- https://www.youtube.com/watch?v=9F1PtfWHh1o -->
	
</div> <!-- 전체 div -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	$("")
})
</script>
</body>
</html>