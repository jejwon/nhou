<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 담기(수량)</title>
<style type="text/css">

</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
	
<div class="container">
	<div class="wholeCartList"><span>장바구니</span></div> 
	<!-- 장바구니 리스트 -->
	<div class="wholeCartPrice"></div>
	<!-- 장바구니 가격 합계 -->
	
	<!-- 장바구니 정보 -->
	<div class="wholeCartCount">
		<table class="table1">
			<caption>표 제목</caption>
			<tbody>
				<tr>
					<th class="tdWidth1"></th>
					<th class="tdWidth2"></th>
					<th class="tdWidth3">상품명</th>
					<th class="tdWidth4">가격</th>
					<th class="tdWidth5">수량</th>
					<th class="tdWidth6">합계</th>
					<th class="tdWidth7">삭제</th>
				</tr>
			</tbody>
		</table>
		<table class="table2">
			<caption>표 내용</caption>
			<tbody>
				<c:forEach items="${cartList}" var="cart">
							<tr>
								<td class="tdWidth1"></td>
								<td class="tdWidth2"></td>
								<td class="tdWidth3">${cart.productName}</td>
								<%-- <fmt:formatNumber value="${ci.bookPrice}" pattern="#,### 원" /> --%>
								<td class="tdWidth4Price">
									판매가 :<span class="red_color">${cart.price }원"</span><br>	
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${cart.count}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									${cart.price * cart.count}원 />
								</td>
								<td class="td_width_4 table_text_align_center delete_btn"><button>삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

	</div>
</div> <!-- 전체 컨테이너 -->
</body>
</html>