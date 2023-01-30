<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
.addressBox {
	margin-top: 30px;
}

.addressWrap {
	border-bottom: 1px solid #f3f3f3;
	height: 260px;
}

.address_btn {
	background-color: #555;
    color: white;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    font-size: 17px;
    width: 50%;
}

.address_btn:hover {
	background-color: #777;
}

.addressBtn_div::after {
	content: '';
	display: block;
	clear: both;
}

.addressInfo_div {
	padding:12px;
	text-align: left;
	display: none;
	line-height: 40px;
}

.addressInfo_div th {
	border-color: transparent;
	background-color: transparent;	
}

.addressInfo_div th {
	padding : 12px 5px 12px 20px;
	vertical-align: top;	
}

.addressInfo_div td {
	padding : 8px 12px;	
}

.addressInfo_input2 {
	padding: 6px 5px;
}

.address_search_btn{
    vertical-align: middle;
    display: inline-block;
    border: 1px solid #aaa;
    width: 90px;
    text-align: center;
    height: 30px;
    line-height: 30px;
    color: #555;
    cursor: pointer;
}
input {
	border:none;
}
input:focus {
    outline: none;
  }
.container {
	font-size: 20px;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
	
	<div class="container">

			
			<table class="table">			
				<thead>
					<tr>						
						<th>상품명</th>
						<th>옵션</th>
						<th>가격</th>
						<th>수량</th>
						<th>합계</th>
					
					</tr>
				</thead>
			
				<tbody id="itemContainer">
				<c:set var = "total" value = "0" />
					<c:forEach items="${cartList }" var="cart" varStatus="status">
					<input name="member_userId" type="hidden" value="${cart.member_userId }" readonly>				
					<input name="cartId" type="hidden" value="${cart.cartId }" readonly>
					
						<c:if test="${member.userId == cart.member_userId }">
							<tr class="tr">								
								<td>
								<input type="hidden" name="product_productId" value="${cart.product_productId }">
								<input type="text" name="productName" value="${cart.productName}">
								</td>
								<td><input type="text" name="option" value="${cart.option }"></td>
								<td><input type="text"   name="price" value="${cart.price}" readonly>\</td>
								<td>
								<input type="number" name="count"  value="${cart.count }" readonly> 
								</td> <!-- 수량 조절 -->
								<td>
								<input type="text" name="amount" value="${cart.price * cart.count}" readonly>
								</td>
								
							</tr>
							<c:set var= "total" value="${total + cart.price * cart.count}"/>	
						</c:if>	
					</c:forEach>

				</tbody>	 
		
			</table>


<div class="addressBox">
				<div class="addressBtn_div">
					<button class="address_btn addressBtn1" onclick="showAddress('1')" style="background-color: #3c3838;">기존 배송지</button>
					<button class="address_btn addressBtn2" onclick="showAddress('2')">직접 입력</button>
				</div>

				<div class="addressWrap">
					<!-- 기존 배송지 -->
					<div class="addressInfo_div addressInfo_input1" style="display: block;">
						<table>
							<colgroup>
								<col>
								<col>
							</colgroup>
							<tbody>
								<tr>
									<td>이름</td>
									<td><input type="text" name="receiverName" value="${member.userName }" style="border-style: none;" readonly="readonly"></td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type="text" name="postal" value="${member.postal}" style="border-style: none;" readonly="readonly"> 
										<input type="text" name="address1" value="${member.address1 }" style="border-style: none;" readonly="readonly"> <br> 
										<input type="text" name="address2" value="${member.address2 }" style="border-style: none;" readonly="readonly"></td>
								</tr>
								
						
								<tr>
									<td>전화번호</td>
									<td><input type="text" name="receiverPhone" value="${member.phone }" style="border-style: none;" readonly="readonly"></td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- 배송지 직접 입력 -->
					<div class="addressInfo_div addressInfo_input2">
						<table>
							<colgroup>
								<col width="25%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<td>이름</td>
									<td>
										<input name="receiverName" class="form-control address_new">
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td> 
										<input class="form-control" size="2" type="text" id="sample6_postcode" name="postal" style="width: 300px; height: 40px; display: inline-block; margin-bottom: 5px;" placeholder="우편번호" >
										<input type="button" class="searchPostal" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
										<input class="form-control" style="width: 300px; height: 40px; vertical-align: middle;" type="text" id="sample6_address" name="address1" placeholder="주소">
										<input class="form-control" style="width: 300px; height: 40px; margin-bottom: 3px; display: inline-block;" type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" >
										<input class="form-control" style="width: 300px; height: 40px; margin-bottom: 3px; display: inline-block;" type="hidden" id="sample6_extraAddress" placeholder="참고항목">
									</td>
								</tr>
								<tr>
									<td>전화번호</td>
									<td style="padding: 6px 10px;">
										<input class="form-control phone_new" name="receiverPhone">
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			
			
				<%-- <tr>
					<td>주문인</td>	
					<td>${member.userName }</td>					
				</tr>		
				<tr>
					<td>기본 배송지/변경 전 값</td>	
					<td>
					<input type="text" value="${member.postal}" name="postal">
					<input type="text" value="${member.address1 }" name="address1">
					<input type="text" value="${member.address2 }" name="address2">
					</td>					
				</tr>
				<tr>
					<td>배송지변경</td>	
					<td>주소 api 넣어주세요</td>					
				</tr>
				
				</tr>
				<tr>
					<td>이메일</td>	
					<td>${member.email }</td>					
				</tr>	 --%>	

		</div>		
		

		<input type="text" name="receiverName">

		<h1>합계</h1>	
			<div>
				배송비: 무료배송
				<input type="radio" name="cal_info" value="card" checked><label>&nbsp;카드 결제</label>
			</div>
			<div>
				최종결제금액: <input type="text" name="payment" value="<c:out value="${total}"/>">
			</div>

		<%-- <c:url value="/payment/orderPage" var="orderLink"></c:url>
		<a href="${orderLink }"> </a>--%>
			<button id="orderButton">주문하기</button>
		


	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> <!-- jQuery -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script> <!-- iamport.payment.js -->
</body>
<script>
const ctx = "${pageContext.request.contextPath}";
var r = Math.floor(Math.random()*10000)+1; //1~10000

//주문서에 들어갈 정보
const order = {		
		orderId : r, 
		member_userId :  $('input[name=member_userId]').val(),
		productName : $('input[name=productName]').val(),
		address1 : '',
		address2 : '',
		postal : '',
		receiverName : '',
		receiverPhone : '',
		payment : $('input[name=payment]').val()	
}

//배열 담기
const orderItem = {
		nhou_order_orderId : order.orderId,
		product_productId : $('input[name=product_productId]').val(),
		count : $('input[name=count]').val(),
		itemPrice : $('input[name=amount]').val(),
		selectOption : $('input[name=option]').val()
		
	}
	

console.log(order);
console.log(orderItem);



//주문하기
$('#orderButton').on('click', function(){
	order.address1 =  $('input[name=address1]').val();
	order.address2 = $('input[name=address2]').val();
	order.postal = $('input[name=postal]').val();
	order.receiverName = $('input[name=receiverName]').val();
	order.receiverPhone = $('input[name=receiverPhone]').val();	
	
//주문 요청 담기 //promise .then
$.ajax({
		url: '/cart/payInsert',
		dataType: 'JSON',
		//async의 값을 false로 주면 동기방식으로 전역변수에 셋팅
		type: 'POST',
		data: order,
		success: function(res){	
			//orderItem.nhou_order_orderId = order.orderId;
			alert('1번 성공!'); //리턴 타입 void -> int로 
		
			$.ajax({	
				url: '/cart/orderItemInsert',
				dataType: 'JSON',
				type: 'POST',
				data: orderItem,
				success: function(res){	
					alert('성공');
				
					
						IMP.init('imp13488808');

						IMP.request_pay({
							pg: "kakaopay",
							pay_method: "card",
							merchant_uid: order.orderId,
							name: order.productName,
							amount: order.payment,
							buyer_name: order.receiverName,
							buyer_email: "ONOFF@ONOFF.com",
							buyer_addr: order.address1,
							buyer_tel: order.receiverPhone,
							buyer_postcode: order.postal,
						}, function (rsp) {
							console.log(rsp);
							
							if(rsp.success) { // 결제 성공시
								var msg = "결제 완료";
				
								alert("결제 완료" + msg);
								location.href = "${ctx}/myPage/myPageOrderList";
						
							} else {
								alert("결제 실패");
							}
						});
					
					
					
					
				}, fail: function(res){
					alert('ㅠㅠ');
				}	
			
			}) 

		}
	
	})  
	

	

});









// 주소입력란 숨김, 등장
function showAddress(className) {
	// 모두 숨기기
	$(".addressInfo_div").css('display', 'none');
	// 컨텐츠 보이기
	$(".addressInfo_input" + className).css('display', 'block');
	
	// 버튼색상 변경
		// 모든 색상 동일
			$(".address_btn").css('backgroundColor', '#555');
		// 지정 색상 변경
			$(".addressBtn" + className).css('backgroundColor', '#3c3838');
}

//다음 주소api
function sample6_execDaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var addr = ''; // 주소 변수
               var extraAddr = ''; // 참고항목 변수

               //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   addr = data.roadAddress;
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   addr = data.jibunAddress;
               }

               // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
               if(data.userSelectedType === 'R'){
                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                   if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있고, 공동주택일 경우 추가한다.
                   if(data.buildingName !== '' && data.apartment === 'Y'){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                   if(extraAddr !== ''){
                       extraAddr = ' (' + extraAddr + ')';
                   }
                   // 조합된 참고항목을 해당 필드에 넣는다.
                   document.getElementById("sample6_extraAddress").value = extraAddr;
               
               } else {
                   document.getElementById("sample6_extraAddress").value = '';
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               document.getElementById('sample6_postcode').value = data.zonecode;
               document.getElementById("sample6_address").value = addr;
               // 커서를 상세주소 필드로 이동한다.
               document.getElementById("sample6_detailAddress").focus();
           }
       }).open();
   }
   

</script>
</html>