<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> <%-- security 사용하기위해 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
#button1 #joinBtn {
	display: inline-block;
	position: absolute;
	background-color: #DCC1B0;
	left: 40%;
}

#userIdExist, #nickNameExist, #emailExist {
	background-color: #DCC1B0;
	display: inline-block;
	position: absolute;
	margin-top: 10px;
	margin-left: 10px;
	justify-content: center;
}

#adressBox>input {
	max-width: 500px;
}

</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<jsp:include page="/WEB-INF/include/header.jsp"></jsp:include>
<section class="p-5">

	<div class="container">
		<h1>회원가입</h1>
		<form action="" method="post">
		<div id="whole">
		
		<!-- 아이디 -->
		<div class="form-floating" style="margin: 10px;">
			<input style="width: 1000px; display: inline-block;" type="text" class="form-control" id="userIdInput1"placeholder="ID"name="userId" aria-describedby="button-addon1"> 
			<label for="ID">ID</label>
			<button class="btn btn-outline" type="button" id="userIdExist">중복확인</button>
			<div id="userIdText1" class="form-text">아이디 중복확인을 해주세요.</div>
		</div>
		
		<!-- 비밀번호 -->
		<div class="form-floating" style="margin: 10px;">
			<input style="width: 1000px;" type="password" class="form-control" id="passwordInput1" placeholder="Password" name="password"> 
			<label for="Password">Password</label>
			<div id="passwordText1" class="form-text"></div>
		</div>
		
		<!-- 비밀번호 확인 -->
		<div class="form-floating" style="margin: 10px;">
			<input style="width: 1000px;" type="password" class="form-control" id="passwordInput2"> 
			<label for="Password">Password check</label>
		</div>
		
		<!-- 실명 -->
		<div class="form-floating" style="margin: 10px;">
			<input style="width: 1000px;" type="text" class="form-control" id="userName"placeholder="userName" name="userName"> 
			<label for="name">name</label>
		</div>
		
		<!-- 닉네임 -->
		<div class="form-floating" style="margin: 10px;">
			<input style="width: 1000px; display: inline-block;"  type="text" class="form-control" id="nickNameInput1"placeholder="Nickname" name="nickName" aria-describedby="button-addon1"> 
			<label for="nickName">Nickname</label>
			<button class="btn btn-outline" type="button" id="nickNameExist">중복확인</button>
			<div id="nickNameText1" class="form-text">별명 중복확인을 해주세요.</div>
		</div>
		
		<!-- 이메일 주소 -->
		<div class="form-floating" style="margin: 10px;">
			<input style="width: 1000px; display: inline-block;" type="email" class="form-control" id="emailInput1" placeholder="name@example.com" name="email" aria-describedby="button-addon1"> 
			<label for="email">Email address</label>
			<button class="btn btn-outline" type="button" id="emailExist">중복확인</button>
			<div id="emailText1" class="form-text">이메일 중복확인을 해주세요.</div>
		</div>
		
		<!-- 생년월일 -->
		<div class="form-floating" style="margin: 10px;">
			<input style="width: 1000px;" type="Date" class="form-control" id="birthDate"placeholder="birthDate"name="birthDate"> 
			<label for="birthDate">birthDate</label>
		</div>
		
		<!-- 주소 -->
		<div id="adressBox" class="form-group" style="margin: 10px;">
			<input class="form-control" size="2" type="text" id="sample6_postcode" name="postal" style="width: 300px; height: 40px; display: inline-block; margin-bottom: 5px;" placeholder="우편번호">
			<input type="button" class="searchPostal" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
			<input class="form-control" style="width: 300px; height: 40px; vertical-align: middle;" type="text" id="sample6_address" name="address1" placeholder="주소"><br>
			<input class="form-control" style="width: 300px; height: 40px; margin-bottom: 5px; display: inline-block;" type="text" id="sample6_detailAddress" name="address2" placeholder="상세주소" >
			<input class="form-control" style="width: 300px; height: 40px; margin-bottom: 5px; display: inline-block;" type="hidden" id="sample6_extraAddress" placeholder="참고항목">
		</div>
		
		<!-- 전화번호 -->
		<div class="form-floating" style="margin: 10px;">
			<input style="width: 1000px;" type="text" class="form-control" id="phone"placeholder="phone" name="phone"> 
			<label for="phone">phone</label>
		</div>
		</div>
		
		<!-- 판매자/구매자 권한 설정 -->
		<div class="form-check">
			 <c:if test="${member.auth == 2 }">
			  <input class="form-check-input" type="checkbox" value="2" id="auth" name="auth">
			  <label class="form-check-label" for="auth">
			   판매자 등록
	  		  </label>			 
			 </c:if>
		</div>
		
		<div id="button1">		
			<button disabled id="joinBtn"class="btn btn-outline" type="submit">회원가입</button>			
		</div>	
		</form>
	
		
	</div>
</section>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> <!-- 다음주소 api -->
<script>
const ctx = "${pageContext.request.contextPath}";
//아이디 사용 가능
let availableId = false;
//패스워드 사용 가능
let availablePassword = false;
//별명 사용 가능
let availableNickName = false;
//이메일 사용 가능
let availableEmail = false;

function enableSubmitButton() {
	const button = document.querySelector("#joinBtn");
	if (availableId && availableEmail && availablePassword && availableNickName) {
		button.removeAttribute("disabled")
	} else {
		button.setAttribute("disabled", "");
	}
}

//id input 변경시 submit 버튼 비활성화
document.querySelector("#userIdInput1").addEventListener("keyup", function() {
	availableId = false;
	enableSubmitButton();
});

//이메일 input 변경시 submit 버튼 비활성화
document.querySelector("#emailInput1").addEventListener("keyup", function() {
	availableEmail = false;
	enableSubmitButton();
});

//비밀번호 input 변경시 submit 버튼 비활성화
document.querySelector("#passwordInput1").addEventListener("keyup", function() {
	availablePassword = false;
	enableSubmitButton();
});

//이메일 중복확인
document.querySelector("#emailExist").addEventListener("click", function() {
	availableEmail = false;
	const email = document.querySelector("#emailInput1").value;
	
	fetch(`\${ctx}/member/existEmail`, {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify({email})
	})
		.then(res => res.json())
		.then(data => {
			document.querySelector("#emailText1").innerText = data.message;
			
			if (data.status == "not exist") {
				availableEmail = true;
				enableSubmitButton();
			}
		});
});


//아이디 중복확인
document.querySelector("#userIdExist").addEventListener("click", function() {
	availableId = false;
	// 입력된 userId를
	const userId = document.querySelector("#userIdInput1").value;
	
	// fetch 요청 보내고
	fetch(ctx + "/member/existId/" + userId)
		.then(res => res.json())
		.then(data => {
			// 응답 받아서 메세지 출력
			document.querySelector("#userIdText1").innerText = data.message;
			
			if (data.status == "not exist") {
				availableId = true;
				enableSubmitButton();
			}
		}); 
	
});

//별명 중복확인
document.querySelector("#nickNameExist").addEventListener("click", function() {
	availableNickName = false;
	// 입력된 별명을
	const userId = document.querySelector("#nickNameInput1").value;
	
	// fetch 요청 보내고
	fetch(ctx + "/member/existNickName/" + userId)
		.then(res => res.json())
		.then(data => {
			// 응답 받아서 메세지 출력
			document.querySelector("#nickNameText1").innerText = data.message;
			
			if (data.status == "not exist") {
				availableNickName = true;
				enableSubmitButton();
			}
		}); 
	
});

/* 패스워드 일치하는 지 확인 시작 */
const passwordInput1 = document.querySelector("#passwordInput1");
const passwordInput2 = document.querySelector("#passwordInput2");
const passwordText1 = document.querySelector("#passwordText1");

function matchPassword() {
	availablePassword = false;
	
	const value1 = passwordInput1.value;
	const value2 = passwordInput2.value;
	
	if (value1 == value2) {
		passwordText1.innerText = "패스워드가 일치합니다.";
		availablePassword = true;
	} else {
		passwordText1.innerText = "패스워드가 일치하지 않습니다.";
	}
	
	enableSubmitButton();

}

passwordInput1.addEventListener("keyup", matchPassword);
passwordInput2.addEventListener("keyup", matchPassword);
/* 패스워드 일치하는 지 확인 끝 */

// 다음 주소api
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
</body>
</html>