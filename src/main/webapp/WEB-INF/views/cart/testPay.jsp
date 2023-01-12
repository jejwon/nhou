<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
    <script>
  //카카오 결제 API
    var IMP = window.IMP; // 생략가능
    IMP.init('imp13488808');  // 가맹점 식별코드
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({
        pg : 'kakaopay', //pg사 선택 (kakao, kakaopay 둘다 가능)
        pay_method: 'card',
        merchant_uid : 'merchant_' + new Date().getTime(), //주문번호
        name : 'Bunddeuk', // 상품명
        amount : 1,
        //customer_uid 파라메터가 있어야 빌링키 발급을 시도함
        customer_uid : 'buyer_name' + new Date().getTime(),
        buyer_email : 'iamport@siot.do',
        buyer_name : 'buyer_name',
        buyer_tel : '10211-555',
        buyer_addr : '도곡',
    }, function(rsp) { //callback
        if ( rsp.success ) {
          console.log('빌링키 발급 성공', rsp)
          //빌링키 발급이 완료되었으므로, 서버에 결제 요청
          alert('예약 결제가 완료되었습니다!');
        } else {
          var msg = '결제에 실패하였습니다.\n';
          msg += rsp.error_msg;
          alert(msg);
          return false;
        }
        $("#final-support-submit").submit();
    });
    </script>
    <meta charset="UTF-8">
    <title>Sample Payment</title>
</head>
<body>
    <button id="final-support-submit">결제하기</button>
</body>
</html>