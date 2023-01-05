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

</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<%-- 	<!-- 상품list (1:48:18) -->
			
			...
			
            <article class="col-12 col-md-6 tm-post">

                <hr class="tm-hr-primary">

                <div class="tm-post-link-inner" style="">
                    <a href="${getLink}" class="effect-lily tm-post-link tm-pt-60" style="max-height: 626px;">
                            이미지
                        <img src="${imgUrl}/${product.productId}/${product.productFileImage}" alt="Image"
                             class="img-fluid" style="max-width:470px">
                    </a>
                </div>--%>
 			
	<div class="container">
	
		<c:forEach items="${productList}" var="product">
        <c:url value="/store/get" var="getLink">
        	<c:param name="productId" value="${product.productId}"/>
       	</c:url>
       	<input type="hidden" class="scrolling" data-productId="${product.productId}"> 	
 	
			<a herf="# ${getLink }">			       
				<div class="card" style="width: 18rem;">
				  <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/165888771016524175.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1" class="card-img-top" >
				  <div class="card-body">
				    <h5 class="card-title">[오늘의딜] 귀여운 볼살 토끼 저금통2colors "${product.productName }"</h5>
				    <span class="product_item_price">13,900 "${product.price }"</span>
				    <p class="review">
				    	<strong class="avg">⭐4.9 "${productReply.star }"</strong> 
				    	리뷰 52 "${productReply.productReplyId }"
				    </p>
				  </div>
				</div>
			</a>		        
    	
    	</c:forEach>
    </div> 

<%-- 	<ul class="product-list">
		<li><a herf="# ${getLink }">			       
				<i class="card" style="width: 18rem;">
				  <img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/165888771016524175.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1" class="card-img-top" >
				  <i class="card-body">
				    <h5 class="card-title">[오늘의딜] 귀여운 볼살 토끼 저금통2colors "${product.productName }"</h5>
				    <span class="product_item_price">13,900 "${product.price }"</span>
				    <p class="review">
				    	<strong class="avg">⭐4.9 "${productReply.star }"</strong> 
				    	리뷰 52 "${productReply.productReplyId }"
				    </p>
				  </i>
				</i>
			</a></li>  --%>   
    
                  		

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>