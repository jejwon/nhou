<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file = "../includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스토어 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<%-- 	<!-- 상품list -->
        <div class="row tm-row">
            <c:forEach items="${productList}" var="product">
            <c:url value="/store/get" var="getLink">
                <c:param name="productId" value="${product.productId}"/>
            </c:url>
            <input type="hidden" class="scrolling" data-productId="${product.productId}">
            <article class="col-12 col-md-6 tm-post" style="min-width:50%;max-width:calc(100 - 50%);">

                <hr class="tm-hr-primary">

                <div class="tm-post-link-inner" style="">
                    <a href="${getLink}" class="effect-lily tm-post-link tm-pt-60" style="max-height: 626px;">
                            이미지
                        <img src="${imgUrl}/${product.productId}/${product.productFileImage}" alt="Image"
                             class="img-fluid" style="max-width:470px">
                    </a>
                </div>
                    제목
                <h2 class="tm-pt-30 tm-color-primary tm-post-title">"${product.productName}"</h2>
 			</article>
 			</c:forEach> --%>
 			
 			
    <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/165888771016524175.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1" class="rounded float-start" alt="...">
        <h1 class="today-deal-item__header">
            <span class="today-deal-item__header__brand">루시아이 </span>
            <span class="today-deal-item__header__name">[오늘의딜] 귀여운 볼살 토끼 저금통2colors</span>
        </h1>
        
        
        <div class="today-deal-item__stats-mobile">
            <p class="production-item-stats production-item-stats--review">
            <span class="production-item-price__price">13,900</span>
                <svg class="icon" width="24" height="24" viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet"></svg>
                <strong class="avg">⭐4.9</strong> 
                리뷰 52
            </p>
        </div>
                     		

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>