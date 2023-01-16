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

	<c:if test="${not empty message }">
		<div class="alert alert-warning">
			${message}
		</div>
	</c:if>
	
	<h1>상품목록</h1>

	    <div class="container">	
			<c:forEach items="${storeList}" var="store">
			<c:url value="/store/storeGet" var="getLink">
	        	<c:param name="productId" value="${store.productId}"/>
	       	</c:url>
			<article class="card" style="width: 18rem;">
				<div class="card-top" >
					<a href="${getLink}">
						<img src="https://image.ohou.se/i/bucketplace-v2-development/uploads/productions/165888771016524175.jpg?gif=1&w=360&h=360&c=c&q=0.8&webp=1"  class="card-img-top">			
					</a>
					
					<div class="card-body">
						<h5 class="card-title">${store.productName }</h5>
						<span class="product_item_price">${store.price } 원</span>
						
						<!-- 카테고리 -->
						<div class="productCategory">
								<c:choose>
									<c:when test="${store.productCategory_categoryId eq 1 }">
									 	FURNITURE
									</c:when>
									<c:when test="${store.productCategory_categoryId eq 2 }">
									 	BEDDING
									</c:when>
									<c:when test="${store.productCategory_categoryId eq 3 }">
									 	LIVING FABRIC
									</c:when>
									<c:when test="${store.productCategory_categoryId eq 4 }">
									 	KITCHEN
									</c:when>
									<c:when test="${store.productCategory_categoryId eq 5 }">
									 	DECO
									</c:when>
									<c:when test="${store.productCategory_categoryId eq 6 }">
									 	PETS
									</c:when>
								</c:choose>
							</div>

						
						<p class="review">
							<strong class="avg">⭐${productReply.star }</strong> 
						    		리뷰${productReply.productReplyId }
						</p>	
					</div>
				</div>
			</article>        			
	    	</c:forEach>
	    </div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

</body>
</html>