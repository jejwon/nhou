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
<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&family=Nunito:wght@200;300&display=swap" rel="stylesheet">
<style type="text/css">
/* 폰트체 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&family=Nunito:wght@200;300&display=swap');

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

.carousel-caption {
	width: 1100px;
	height: 600px;
	position: absolute;
}

.main_slider_content h6 {
	font-weight: 500;
	text-transform: uppercase;
	margin-bottom: 20px;
	left: 70px;
	top: 400px;
	position: absolute;
}

.main_slider_content h3 {
	font-weight: 400;
	line-height: 1;
	left: 20px;
	top: 450px;
	position: absolute;
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
	left: 30px;
	bottom: 50px;
	position: absolute;
	
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
.carousel-inner {
	position: relative;
}

.first {
    width: 1250px;
    height: 600px;
    margin: 10px;
    
}

.d-block2 {
    width: 1250px;
    height: 600px;
    margin: 10px;
    
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

.banner_category {
	cursor: pointer;
}

.cateTitle {
	font-family: 'Nunito', sans-serif;
	font-weight: bolder;
	font-size: 20px;
}



</style>
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<div class="container">

	<!-- 광고 헤더 -->
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block first" src="https://img.freepik.com/free-photo/bedroom-background-zoom-calls_52683-95239.jpg?w=1380&t=st=1675171952~exp=1675172552~hmac=d8feefbce1635e1804710e6316fb3c93769a9ac6f45acde908310d8632926862" alt="First slide">
      <div class="carousel-caption main_slider_content">
    	<h6>판매중</h6>
    	<h3>겨울 행사중</h3>
    	<div class="red_button shop_now_button">
			<a href="#">Shop now</a>
		</div> 
  	  </div>
    </div>
    <div class="carousel-item">
      <img class="d-block2" src="https://img.freepik.com/free-photo/abstract-blur-empty-curtain-interior-decoration-living-room_1339-7397.jpg?w=1380&t=st=1675173434~exp=1675174034~hmac=72c0be4bc2ec6f95756e799a1cb69d0651f549fce092de4e871726bb5b05bfe8" alt="Second slide">
      <div class="carousel-caption main_slider_content">
    	<h6>판매중</h6>
    	<h3>겨울 행사중</h3>
    	<div class="red_button shop_now_button">
			<a href="#">Shop now</a>
		</div> 
  	  </div>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="..." alt="Third slide">
    </div>
  </div>
  <a style="width: 130px;" class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
	<!-- <div class="main_slider" style="width: 1200px; height: 500px; margin:10px; background-image: url('https://i.pinimg.com/564x/10/92/79/10927995b066d30989a9e9e315264573.jpg')">
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
	</div> -->
	
	<!-- 배너 -->
		<div class="banner">
			<div class="container">
				<div class="row">
					<label for=""><span class="cateTitle">카테고리별 상품 찾기&nbsp; <i class="fa-brands fa-gitlab"></i></span></label>
					<div class="col-md">
						<div class="banner_item align-item-center" onclick="location.href='${pageContext.request.contextPath}/store/storeList?productCategory_categoryId=1'" style="width:150px; height: 150px; margin: 0px; padding: 0px; cursor: pointer; background-image: url('https://ifh.cc/g/wyDryA.png')">
							<div class="banner_category">
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="banner_item align-item-center" onclick="location.href='${pageContext.request.contextPath}/store/storeList?productCategory_categoryId=2'" style="cursor: pointer; width:150px; height: 150px; margin: 0px; padding: 0px; background-image: url('https://ifh.cc/g/mJnV6B.png')">
							<div class="banner_category">
								<a href=""></a>
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="banner_item align-item-center" onclick="location.href='${pageContext.request.contextPath}/store/storeList?productCategory_categoryId=3'" style="cursor: pointer; width:150px; height: 150px; margin: 0px; padding: 0px; background-image: url('https://ifh.cc/g/nWJpj4.png')">
							<div class="banner_category">
								<a href=""></a>
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="banner_item align-item-center" onclick="location.href='${pageContext.request.contextPath}/store/storeList?productCategory_categoryId=4'" style="cursor: pointer; width:150px; height: 150px; margin: 0px; padding: 0px; background-image: url('https://ifh.cc/g/Sb3ofp.png')">
							<div class="banner_category">
								<a href=""></a>
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="banner_item align-item-center" onclick="location.href='${pageContext.request.contextPath}/store/storeList?productCategory_categoryId=5'" style="cursor: pointer; width:150px; height: 150px; margin: 0px; padding: 0px; background-image: url('https://ifh.cc/g/LXKpd9.png')">
							<div class="banner_category">
								<a href=""></a>
							</div>
						</div>
					</div>
					<div class="col-md">
						<div class="banner_item align-item-center" onclick="location.href='${pageContext.request.contextPath}/store/storeList?productCategory_categoryId=6'" style="cursor: pointer; width:150px; height: 150px; margin: 0px; padding: 0px; background-image: url('https://ifh.cc/g/74dnG3.png')">
							<div class="banner_category">
								<a href=""></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	
	
	
</div> <!-- 전체 div -->
<jsp:include page="/WEB-INF/include/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
</script>
</body>
</html>