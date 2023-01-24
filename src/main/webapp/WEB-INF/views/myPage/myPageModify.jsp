<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberInfo Edit</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap" rel="stylesheet">
<style>
/* 폰트 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500&display=swap');
/* 바디 */
.container {
	font-family: 'Noto Sans KR', sans-serif;
}
#whole {
	margin: 20px;
}
#button1 {
	text-align: center;
	position: relative;
}
#button1 #modifyBtn {
	display: inline-block;
	position: absolute;
	background-color: #DCC1B0;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<section class="p-5">
	<div class="container">
		<h1>개인정보 수정</h1>
		
		<div id="whole">
		
		<c:if test="${not empty message }">
			<div class="alert alert-success">
				${message }
			</div>
		</c:if>
		
		<form id="form1" action="" method="post">
		<sec:authorize access="hasAnyAuthority('0')">
			<select name="auth"  class="form-select" aria-label="Default select example"style="width: 200px; margin: 0 10px;">
	 			<c:choose>
	 				<c:when test="${member.auth == 0  }">
			 			<option selected>관리자</option>	
	 				</c:when>
	 				<c:when test="${member.auth == 1  }">
			 			<option selected>일반회원</option>	
	 				</c:when>
	 				<c:when test="${member.auth == 2  }">
			 			<option selected>판매자</option>	
	 				</c:when>
	 			</c:choose>
	  			<option value="1">일반회원 변경</option>
	  			<option value="2">판매자 등록</option>
	 			<c:if test="${member.auth == 0 }"> 
	 			<option value="8">일반회원 + 블랙</option>
	 			<option value="9">판매자 + 블랙</option>
	 			 </c:if>
			</select>
		</sec:authorize>

		
		<div class="form-floating" style="margin: 10px;">
			<input type="text" readonly class="form-control" value="${member.userId }" id="userId" placeholder="ID"name="userId"> 
			<label for="ID">아이디</label>
		</div>

	    <!-- 비밀번호 변경하기 -->
  		<input type="checkbox" name="newPassword" value="true" id="newPasswordCheckbox1"> 암호 변경
		
		<div class="form-floating" style="margin: 10px;">
			<input disabled id="passwordInput1" class="form-control" type="password" value="" name="password">
			<label for="Password">새 비밀번호</label>
			<div id="passwordText1" class="form-text"></div>
		</div>
			
		<div class="form-floating" style="margin: 10px;">
			<input disabled id="passwordInput2" class="form-control" type="password">
			<label for="" class="">새 비밀번호 확인</label>
		</div>
			
		<div class="form-floating" style="margin: 10px;">
			<input type="hidden" name="password" value="${member.password }" readonly="readonly">
		</div>
		
		
		<div class="form-floating" style="margin: 10px;">
			<input type="text" class="form-control" value="${member.userName }"id="userName"placeholder="userName" name="userName" readonly="readonly"> 
			<label for="userName">이름</label>
		</div>
		
		<!-- 닉네임 -->
		<div class="form-floating" style="margin: 10px;">
			<input style="width: 800px; display: inline-block;" id="nickNameInput1" class="form-control" type="text" value="${member.nickName }" name="nickName" data-old-value="${member.nickName }">	
			<label for="nickName">닉네임</label>
			<button style="margin-bottom: 13px;" disabled id="nickNameButton1" type="button" class="btn btn-outline-secondary">중복확인</button>
			<div id="nickNameText1" class="form-text"></div>
		</div>		
		
		<!-- 이메일 -->
		<div class="form-floating" style="margin: 10px;">
			<input style="width: 800px; display: inline-block;" id="emailInput1" class="form-control" type="email" value="${member.email }" name="email" data-old-value="${member.email }">			
			<label for="email">이메일 변경</label>
			<button style="margin-bottom: 13px;" disabled id="emailButton1" type="button" class="btn btn-outline-secondary">중복확인</button>
			<div id="emailText1" class="form-text"></div>
		</div>
		
		<!-- 생년월일 -->
		<%-- <div class="form-floating" style="margin: 10px;">
			<input type="text" readonly class="form-control" value="${member.birthDate }" id="birthDate"placeholder="birthDate"name="birthDate"> 
			<label for="birthDate">${member.birthDate }</label>
		</div> --%>
		
		<div class="form-floating" style="margin: 10px;">
			<input class="form-control" size="2" type="text" id="sample6_postcode" name="postal" 
			style="width: 300px; height: 40px; display: inline-block; margin-bottom: 5px; vertical-align: middle;" placeholder="우편번호" value="${member.postal }">
			<input style="text-align: center; margin-bottom: 5px;" type="button" class="searchPostal" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			<div class="addressBox">
				<input class="form-control" style="width: 300px; height: 40px; vertical-align: middle; display:inline-block; margin-right: 10px;" type="text" id="sample6_address" 
				name="address1" placeholder="주소" value="${member.address1 }">
				<input class="form-control" style="width: 300px; height: 40px; display:inline-block; vertical-align: middle; margin-right: 10px;" type="text" id="sample6_detailAddress" 
				name="address2" placeholder="상세주소" value="${member.address2 }">
			</div>
			<input class="form-control" style="width: 300px; height: 40px; margin-bottom: 5px; display: inline-block;" type="hidden" id="sample6_extraAddress" placeholder="참고항목">
		</div>
		
		<div class="form-floating" style="margin: 10px;">
			<input type="text" class="form-control" value="${member.phone }"id="phone"placeholder="phone" name="phone"> 
			<label for="phone">전화번호</label>
		</div>
		
			<input type="hidden" name="oldPassword">
		</form>
		
		<c:url value="/myPage/remove" var="removeUrl"></c:url>
			<form id="form2" action="${removeUrl }" method="post">
				<input type="hidden" name="userId" value="${member.userId }">
				<input type="hidden" name="oldPassword">
			</form>
			<input disabled id="modifyModalButton1" class="btn btn-warning" type="submit" value="수정" data-bs-toggle="modal" data-bs-target="#modifyModal">
			<input class="btn btn-danger" type="submit" value="탈퇴" data-bs-toggle="modal" data-bs-target="#removeModal">	
			</div>
		</div> <!-- 전체 container -->
</section>	

<%-- 수정 시 예전암호 입력 Modal --%>
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	   <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">기존 암호 입력</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <input id="oldPasswordInput1" type="password" class="form-control">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button id="modalConfirmButton" type="button" class="btn btn-primary">수정</button>
	      </div>
	    </div>
	</div>
</div>

<%-- 탈퇴 시 예전암호 입력 Modal --%>
<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">기존 암호 입력</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <input id="oldPasswordInput2" type="password" class="form-control">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button id="modalConfirmButton2" type="button" class="btn btn-danger">탈퇴</button>
	      </div>
	    </div>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음주소 api -->
<script>
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
   
const ctx = "${pageContext.request.contextPath}";
let availablePassword = true;
let availableEmail = true;
let availableNickName = true;
function enableModifyButton() {
	const button = document.querySelector("#modifyModalButton1");
	if (availablePassword && availableEmail && availableNickName) {
		// 수정버튼 활성화
		button.removeAttribute("disabled")
	} else {
		// 수정버튼 비활성화
		button.setAttribute("disabled", "");
	}
}

<!-- 새 패스워드 입력 체크박스 -->
document.querySelector("#newPasswordCheckbox1").addEventListener("change", function() {
	const pwInput1 = document.querySelector("#passwordInput1");
	const pwInput2 = document.querySelector("#passwordInput2");
	if (this.checked) {
		pwInput1.removeAttribute("disabled");
		pwInput2.removeAttribute("disabled");
	} else {
		pwInput1.setAttribute("disabled", "");
		pwInput2.setAttribute("disabled", "");
	}
});

<%-- 이메일 중복확인 --%>
const emailInput1 = document.querySelector("#emailInput1");
const emailButton1 = document.querySelector("#emailButton1");
const emailText1 = document.querySelector("#emailText1");
// 이메일 중복확인 버튼 클릭하면
emailButton1.addEventListener("click", function() {
	availableEmail = false;
	
	const email = emailInput1.value;
	
	fetch(`\${ctx}/member/existEmail`, {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify({email})
	})
		.then(res => res.json())
		.then(data => {
			emailText1.innerText = data.message;
			
			if (data.status == "not exist") {
				availableEmail = true;
			}
			enableModifyButton();
		});
});
// 이메일 input의 값이 변경되었을 때
emailInput1.addEventListener("keyup", function() {
	availableEmail = false;
	
	const oldValue = emailInput1.dataset.oldValue;
	const newValue = emailInput1.value;
	if (oldValue == newValue) {
		// 기존 이메일과 같으면 아무일도 일어나지 않음
		emailText1.innerText = "";
		emailButton1.setAttribute("disabled", "disabled");
		availableEmail = true;
	} else {
		// 기존 이메일과 다르면 중복체크 요청
		emailText1.innerText = "이메일 중복확인을 해주세요.";
		emailButton1.removeAttribute("disabled");
	}
	
	enableModifyButton();
});

<%-- 별명 중복확인 관련 코드 --%>
let nickNameInput1 = document.querySelector("#nickNameInput1");
let nickNameText1 = document.querySelector("#nickNameText1");
let nickNameButton1 = document.querySelector("#nickNameButton1");
//별명 중복확인 버튼 클릭하면
nickNameButton1.addEventListener("click", function() {
	availableNickName = false;
	
	const nickName = nickNameInput1.value;
	
	fetch(`\${ctx}/member/existNickName/\${nickName}`)
		.then(res => res.json())
		.then(data => {
			nickNameText1.innerText = data.message;
			
			if (data.status == "not exist") {
				availableNickName = true;
			}
			enableModifyButton();
		});
});
//닉네임 input의 값이 변경되었을 때
nickNameInput1.addEventListener("keyup", function() {
	availableNickName = false;
	
	const oldValue = nickNameInput1.dataset.oldValue;
	const newValue = nickNameInput1.value;
	if (oldValue == newValue) {
		// 기존 닉네임과 같으면 아무일도 일어나지 않음
		nickNameText1.innerText = "";
		nickNameButton1.setAttribute("disabled", "disabled");
		availableNickName = true;
	} else {
		// 기존 이메일과 다르면 중복체크 요청
		nickNameText1.innerText = "별명 중복확인을 해주세요.";
		nickNameButton1.removeAttribute("disabled");
	}
	
	enableModifyButton();
});

<!-- 암호 입력 일치하는지 확인  -->
const passwordInput1 = document.querySelector("#passwordInput1");
const passwordInput2 = document.querySelector("#passwordInput2");
const passwordText1 = document.querySelector("#passwordText1");
passwordInput1.addEventListener("keyup", matchPassword);
passwordInput2.addEventListener("keyup", matchPassword);
function matchPassword() {
	availablePassword = false;
	if (passwordInput1.value == passwordInput2.value) {
		passwordText1.innerText = "패스워드가 일치 합니다.";
		availablePassword = true;
	} else {
		passwordText1.innerText = "패스워드가 일치하지 않습니다.";
	}
	enableModifyButton();
}

<!-- 탈퇴 모달 확인 버튼 눌렀을 때 -->
document.querySelector("#modalConfirmButton2").addEventListener("click", function() {
	const form = document.forms.form2;
	const modalInput = document.querySelector("#oldPasswordInput2");
	const formOldPasswordInput = document.querySelector(`#form2 input[name="oldPassword"]`)
	// 모달 안의 기존 암호 input 값을
	// form의 기존 암호 input에 옮기고
	formOldPasswordInput.value = modalInput.value;	
	
	// form을 submit
	form.submit();
});
<!-- 수정 모달 확인 버튼 눌렀을 때 -->
document.querySelector("#modalConfirmButton").addEventListener("click", function() {
	const form = document.forms.form1;
	const modalInput = document.querySelector("#oldPasswordInput1");
	const formOldPasswordInput = document.querySelector(`#form1 input[name="oldPassword"]`)
	// 모달 암호 input 입력된 값을 
	// form 안의 기존암호 input에 옮기고
	formOldPasswordInput.value = modalInput.value;
	
	// form을 submit
	form.submit();	
});


</script>
</body>
</html>