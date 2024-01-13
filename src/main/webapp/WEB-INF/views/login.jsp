<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>HTU</title>
<link rel="icon" href="/resources/images/favicon.ico">
<link href="/resources/css/reset.css" rel="stylesheet" />
<link href="/resources/css/style.css" rel="stylesheet" />
<link href="/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/button.css" rel="stylesheet">
<script src="/resources/js/jquery.min.js"></script>
<style>
.login_div {
	position: relative;
	width: 300px;
}

.login_input {
	font-size: 15px;
	color: #222222;
	width: 318px;
	border: none;
	padding-left: 10px;
	position: relative;
	background: none;
	z-index: 5;
}

.login_input::placeholder {
	color: #aaaaaa;
}

.login_input:focus {
	outline: none;
}

.login_div span {
	display: block;
	position: absolute;
	bottom: 0;
	left: 0%;
	background-color: #666;
	width: 0;
	height: 2px;
	border-radius: 2px;
	transition: 0.5s;
}

.login_div label {
	position: absolute;
	color: #aaa;
	left: 10px;
	font-size: 18px;
	transition: all .2s;
}

.login_input:focus ~ label, input:valid ~ label {
	font-size: 14px;
	bottom: 33px;
	color: #666;
	font-weight: bold;
}

.login_input:focus ~ span, input:valid ~ span {
	width: 100%;
}

/* Additional Styles for the Modal */
.custom-modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: 10% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 470px;
	border-radius: 5px;
	text-align: center;
}

.close-modal {
	position: absolute;
	top: 10px;
	right: 10px;
	font-size: 20px;
	cursor: pointer;
}

</style>
<!-- sweetalert -->
<link rel="stylesheet" href="/resources/css/sweetalert2.min.css">
</head>
<body>
	<div
		style="background-color: #eeeeee; width: 100%; height: 100vh; margin: 0; padding: 0;"
		class="loginPage">
		<div class="background"
			style="display: flex; flex-direction: column; box-sizing: border-box; padding: 40px; width: 900px; height: 450px; border-radius: 3px; box-shadow: 0px 0px 10px 1px #dedede; background-color: #ffffff; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
			<div class="login_logo_box"
				style="margin: 0 auto; display: flex; align-items: center;">
				<img src="/resources/images/login_logo.png" alt="logo"
					style="width: 80px; margin-right: 10px;">
				<p style="font-size: 22px; font-weight: 600;">학사관리시스템</p>
			</div>
			<div style="display: flex;">
				<div
					style="border-radius: 3px 0 0 3px; width: 450px; border-right: 2px solid #d1d0d0; padding: 20px;">
					<div style="display: flex;">
						<div
							style="font-size: 18px; font-weight: 600; margin-bottom: 40px;">로그인</div>
					</div>
					<form action="/login" method="post">
						<div class="login_div"
							style="border: 1px solid #d1d0d0; width: 320px; height: 40px; line-height: 40px; margin-bottom: 30px;">
							<input type="text" id="username" class="login_input" name="username" style="height:37px;"
								required="required" autofocus /> <label>ID</label> <span></span>
						</div>
						<div class="login_div"
							style="border: 1px solid #d1d0d0; width: 320px; height: 40px; line-height: 40px; margin-bottom: 10px;">
							<input type="password" id="password" class="login_input" name="password"
								required="required" /> <label>pw</label> <span></span>
						</div>
						<div
							style="display: flex; justify-content: space-between; font-size: 11px; margin: 20px 0;">
							
							<div style="display: flex;">
								<input type="checkbox" id="remember"
									style="border: 1px solid red;" /> <label for="remember">
									<span
									style="font-size: 11px; font-weight: 400; margin-left: 3px;">학번/사번
										저장</span>
								</label>
							</div>
							<div style="display: flex; margin-right: 47px;">
								<div class="hoverBold" onclick="openIdModal()"
									style="margin-right: 8px; cursor: pointer;">학번/사번 찾기</div>
								<div class="hoverBold" onclick="openPwModal()"
									style="cursor: pointer;">비밀번호찾기</div>
							</div>
						</div>
						<button type="submit" 
							style="border: none; width: 320px; height: 40px; background-color: #40060b; color: #ffffff; line-height: 40px; text-align: center; cursor: pointer;">로그인</button>
						<sec:csrfInput />
					</form>
				</div>
				<div
					style="font-size: 18px; font-weight: 600; border-radius: 0 3px 3px 0; width: 450px; padding: 20px 0 20px 60px;">
					<div style="margin-bottom: 40px;">시스템 공지</div>
					<div class="login_warning" 
					style="display:flex; justify-content:space-between; align-items:center; border-bottom: 1px solid #d1d0d0; width: 320px; height: 40px; padding:0 7px; line-height: 40px;font-size:14px; cursor:pointer;">
						<svg xmlns="http://www.w3.org/2000/svg" height="12" width="10" viewBox="0 0 384 512"><path fill="#cccccc" d="M32 32C32 14.3 46.3 0 64 0H320c17.7 0 32 14.3 32 32s-14.3 32-32 32H290.5l11.4 148.2c36.7 19.9 65.7 53.2 79.5 94.7l1 3c3.3 9.8 1.6 20.5-4.4 28.8s-15.7 13.3-26 13.3H32c-10.3 0-19.9-4.9-26-13.3s-7.7-19.1-4.4-28.8l1-3c13.8-41.5 42.8-74.8 79.5-94.7L93.5 64H64C46.3 64 32 49.7 32 32zM160 384h64v96c0 17.7-14.3 32-32 32s-32-14.3-32-32V384z"/></svg>
						<span>사용자 로그인시 주의사항</span>
						<span style="color:#888888; font-size:13px;">이상민     24.01.01</span>
					</div>
					<div class="login_warning2" 
					style="margin-top:20px; display:flex; justify-content:space-between; align-items:center; border-bottom: 1px solid #d1d0d0; width: 320px; height: 40px; padding:0 7px; line-height: 40px;font-size:14px; cursor:pointer;">
						<svg xmlns="http://www.w3.org/2000/svg" height="12" width="10" viewBox="0 0 384 512"><path fill="#cccccc" d="M32 32C32 14.3 46.3 0 64 0H320c17.7 0 32 14.3 32 32s-14.3 32-32 32H290.5l11.4 148.2c36.7 19.9 65.7 53.2 79.5 94.7l1 3c3.3 9.8 1.6 20.5-4.4 28.8s-15.7 13.3-26 13.3H32c-10.3 0-19.9-4.9-26-13.3s-7.7-19.1-4.4-28.8l1-3c13.8-41.5 42.8-74.8 79.5-94.7L93.5 64H64C46.3 64 32 49.7 32 32zM160 384h64v96c0 17.7-14.3 32-32 32s-32-14.3-32-32V384z"/></svg>
						<span>안면인식 로그인 주의사항</span>
						<span style="color:#888888; font-size:13px;">이상민     24.12.31</span>
					</div>
				</div>
			</div>
				<div style="margin-top: -6px; margin-left: 538px;">	
				    <!-- 학생 로그인 체크박스 -->
				    <input type="checkbox" class="btn-two mini gray login-checkbox" id="stu-login-btn" />
				    <label for="stu-login-btn">
				    <span style="font-size: 11px; font-weight: 400; margin-left: -10px; position: relative; top: -4px">학생 로그인</span>
				    </label>
				    <!-- 교수 로그인 체크박스 -->
				    <input type="checkbox" class="btn-two mini gray login-checkbox" id="pro-login-btn" />
				    <label for="pro-login-btn">
				    <span style="font-size: 11px; font-weight: 400; margin-left: -10px; position: relative; top: -4px">교수 로그인</span>
				    </label>
				    <!-- 관리자 로그인 체크박스 -->
				    <input type="checkbox" class="btn-two mini gray login-checkbox" id="emp-login-btn" />
				    <label for="emp-login-btn">
				    <span style="font-size: 11px; font-weight: 400; margin-left: -10px; position: relative; top: -4px">관리자 로그인</span>
				    </label>
				</div>
		</div>
	</div>
	<!-- 사용자 로그인시 주의사항 -->
<div class="login_warning_modal modal-bg" style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
    <div class="modal_back" style="position:relative; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);"></div>
    <div class="login_warning_box" style="border-radius:20px; position:absolute; width:480px; height:500px; z-index: 999; padding:10px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
        
        <div class="image-container" style="width:100%; height:200px; text-align: center;">
        <!-- 이미지 클릭시 이동할 경로 -->
            <a href="/common/board/notice/detail?nbCd=NOBD1310">
        <!-- 이미지 경로 -->
        <img src="/resources/upload/2024/01/01/832.jpg" style="position: relative; top: 8px;"></a>
        </div>
        <!-- 텍스트 등 추가 내용 -->
    </div>
</div>
	
	<!-- 안면인식 로그인 주의사항  -->
	<div class="login_warning_modal2 modal-bg" style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
		<div class="modal_back" style="position:relative; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);"></div>
		<div class="login_warning_box" style="border-radius:20px; position:absolute; width:480px; height:500px; z-index: 999; padding:10px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
		<button type="button" class="btn-two gray mini login_close_bt" onclick="closeModal()" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>
		설정은 마이페이지에서 어쩌구저쩌구
		</div>
	</div>

	<!--------------------------------------- 학번/사번 찾기 모달창 시작 --------------------------------------->
	<div class="custom-modal" id="findIdModal">
		<div class="modal-content">
			<span class="close-modal" onclick="closeIdModal()">&times;</span>
			<h2 style="margin-bottom: 20px; color: #000; font-size:25px; font-weight:600;">학번/사번 찾기</h2>
			<div style="margin-bottom: 15px; text-align: left;">
				<div style="margin-bottom: -30px; margin-left: 355px;">
					<input type="checkbox" class="btn-two mini gray search" id="id-search" />
					<label for="id-search">
					<span style="font-size: 11px; font-weight: 400; margin-left: -10px; position: relative; top: -5px;">자동완성</span>
					</label>
				</div>
				<label for="userName"
					style="display: block; margin-bottom: 5px; font-weight: bold; position: relative; left: 5px; width: 100px;">사용자
					정보</label> <input type="text" id="userNm" name="userNm"
					placeholder="이름을 입력하세요"
					style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px;"
					required>
			</div>
			<div style="margin-bottom: 20px; text-align: left; display: flex;">
				<input type="text" id="userReg1" name="userReg1" pattern="\d{1,6}"
					placeholder="주민번호 앞 6자리"
					style="flex: 1; padding: 10px; border: 1px solid #ddd; border-radius: 5px 0 0 5px;"
					required
					oninput="this.value = this.value.replace(/\D/g,'').substring(0, 6)">
				<span style="padding: 10px; font-size: 20px;">-</span> <input
					type="text" id="userReg2" name="userReg2" pattern="\d{1,7}"
					placeholder="뒷 7자리"
					style="flex: 1; padding: 10px; border: 1px solid #ddd; border-radius: 0 5px 5px 0;"
					required
					oninput="this.value = this.value.replace(/\D/g,'').substring(0, 7)">
			</div>
			<button type="button" id="btnFind"
				style="width: 100%; background-color: #800000; color: #fff; padding: 10px; border: none; border-radius: 5px; cursor: pointer;">학번/사번
				찾기</button>
		</div>
	</div>
	<!--------------------------------------- 학번/사번 찾기 모달창 끝 --------------------------------------->

	<!--------------------------------------- 사용자 코드 표시 모달창 --------------------------------------->
	<div class="custom-modal" id="userCdModal">
		<div class="modal-content">
			<span class="close-modal" onclick="closeUserCdModal()">&times;</span>
			<h2 style="margin-bottom: 20px; color: #800000;">학번/사번</h2>
			<div id="userCdDisplay"
				style="margin-bottom: 20px; text-align: center; font-size: 24px; font-weight: bold;"></div>
			<!-- 직접 링크로 이동 -->
			<a href="/login"
				style="background-color: #800000; color: #fff; padding: 10px 20px; text-decoration: none; display: inline-block; border-radius: 5px;">확인</a>
		</div>
	</div>
	<!--------------------------------------- 사용자 코드 표시 모달창 끝 --------------------------------------->

	<!--------------------------------------- 비밀번호 찾기 모달 창 시작 --------------------------------------->
	<div class="custom-modal" id="findPasswordModal">
		<div class="modal-content">
			<span class="close-modal" onclick="closePwModal()">&times;</span>
			<h2 style="margin-bottom: 20px; color: #000; font-size:25px; font-weight:600;">비밀번호 찾기</h2>
			<div style="margin-bottom: 15px; text-align: left;">
				<div style="margin-bottom: -30px; margin-left: 355px;">
					<input type="checkbox" class="btn-two mini gray search" id="pw-search" />
					<label for="pw-search">
					<span style="font-size: 11px; font-weight: 400; margin-left: -10px; position: relative; top: -4px;">자동완성</span>
					</label>
				</div>
				<label for="userId"
					style="display: block; margin-bottom: 5px; font-weight: bold; position: relative; left: 5px; width:100px;">학번/사번
				</label> <input type="text" id="userCd" name="userCd" maxlength="8"
					placeholder="학번/사번을 입력하세요"
					style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px;"
					oninput="validateNumericInput(this)" required>
			</div>
			<div style="margin-bottom: 15px; text-align: left;">
				<label for="userPhone"
					style="display: block; margin-bottom: 5px; font-weight: bold; position: relative; left: 5px;">휴대폰
					번호</label> <input type="text" id="userTel" name="userTel" maxlength="11"
					placeholder="-를 제외한 휴대폰 번호를 입력하세요"
					style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px;"
					oninput="validateNumericInput(this)" required>
			</div>
			<div id="verificationCodeForm" style="margin-bottom: 15px; text-align: left; display: none;">
				<label for="verificationCode"
					style="display: block; margin-bottom: 5px; font-weight: bold; position: relative; left: 5px;">인증번호</label>
					<input type="text" id="verificationCode" name="verificationCode" maxlength="11"
					placeholder="인증번호를 입력해주세요."
					style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px;"
					oninput="validateNumericInput(this)" required>
			</div>
			<button type="button" id="btnFindPassword"
				style="width: 100%; background-color: #800000; color: #fff; padding: 10px; border: none; border-radius: 5px; cursor: pointer;">비밀번호
				찾기</button>
		</div>
	</div>
	<!--------------------------------------- 비밀번호 찾기 모달 창 끝 --------------------------------------->
	
	<!--------------------------------------- 비밀번호 변경 모달 --------------------------------------->
	<div class="custom-modal" id="modPasswordModal">
		<div class="modal-content">
			<span class="close-modal" onclick="closeModPasswordModal()">&times;</span>
			<h2 style="margin-bottom: 20px; color: #800000; font-size:25px; font-weight:600;">비밀번호변경</h2>
			<div style="margin-bottom: 15px; text-align: left;">
				<label for="newPassword"
					style="display: block; margin-bottom: 5px; font-weight: bold; position: relative; left: 5px;">새 비밀번호
				</label> <input type="password" id="newPassword" name="newPassword" maxlength="16"
					placeholder="변경할 비밀번호를 입력하세요."
					style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px;" required>
			</div>
			<div style="margin-bottom: 15px; text-align: left;">
				<label for="checkPassword" style="display: block; margin-bottom: 5px; font-weight: bold; position: relative; left: 5px;">비밀번호 확인</label> 
				<input type="password" id="checkPassword" name="checkPassword" maxlength="16" placeholder="변경할 비밀번호를 입력하세요." style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px;" required>
				<p id="checkMessage" style="color: red; font-size:12px; text-wrap:nowrap; display:none; margin:5px 0 0 5px!important;"> * 비밀번호가 일치하지 않습니다.</p>
			</div>
			<button type="button" id="btnModPassword" style="width: 100%; background-color: #800000; color: #fff; padding: 10px; border: none; border-radius: 5px; cursor: pointer;">비밀번호 변경</button>
		</div>
	</div>
	
	<!-- 비밀번호 찾기 모달에서 숫자만 입력하게끔 시작 -->
	<script>
		function validateNumericInput(element) {
			// Allow only numeric input
			element.value = element.value.replace(/\D/g, '').substring(0,
					element.maxLength);
		}
	</script>
	<!-- 비밀번호 찾기 모달에서 숫자만 입력하게끔 끝 -->
	
	<script src="/resources/js/main.js"></script>
   	<!--sweetalert-->
    <script src="/resources/js/sweetalert2.min.js"></script>
	<script src="/resources/js/bootstrap.min.js"></script>
	<c:if test="${not empty error}">
		<script>
			alertError("로그인 정보가 일치하지 않습니다.");
		</script>
	</c:if>
	
	
    <script type="text/javascript">
			
			if ('${param.auth}' == 1) {
				const jsonUserVO = JSON.parse('${jsonUserVO}');
				console.log(jsonUserVO);
				const faceCheck = window.open("/face", "_blank", "width = 800, height = 600, top = 100, left = 200, location = no, menubar=no, toolbar=no, resizable=no, scrollbars=no");
				
				const closedInterval = setInterval(() => {
					if (faceCheck && faceCheck.closed) {
						clearInterval(closedInterval);
						location.href="/professor/mypage";
					}
				}, 100);
			}
			
			
			
			// 로그인 체크박스 변경 시 실행되는 함수
			$(".login-checkbox").on("change", function () {
					// 선택된 체크박스 이외의 모든 체크박스 상태를 해제
					$(".login-checkbox").not(this).prop("checked", false);
					
					// 선택된 체크박스에 따라 사용자명과 비밀번호 설정
					if ($("#stu-login-btn").prop("checked")) {
							$("#username").val("21201001");
							$("#password").val("java");
					} else if ($("#pro-login-btn").prop("checked")) {
							$("#username").val("20102");
							$("#password").val("java");
					} else if ($("#emp-login-btn").prop("checked")) {
							$("#username").val("1001");
							$("#password").val("java");
					}
			});
			
			$("#id-search").on("click", function (){
					$("#userNm").val("이상민");
					$("#userReg1").val("123456");
					$("#userReg2").val("123456");
			});
			$("#pw-search").on("click", function (){
					$("#userCd").val("1001");
					$("#userTel").val("01091350378");
			});
		function openIdModal() {
			$('#findIdModal').show();
		}

		function openPwModal() {
			$('#findPasswordModal').show();
		}

		function closeIdModal() {
			$('#findIdModal').hide();
		}

		function closePwModal() {
			location.href="/login";
		}

		function closeUserCdModal() {
			$('#userCdModal').hide();
		}
		
		function closeModPasswordModal() {
			$("#modPasswordModal").hide();
		}

		function openUserCdModal(userCd) {
			$('#userCdDisplay').text("학번/사번: " + userCd);
			$('#userCdModal').show();
		}

		$(function() {
			
			let code = "";
			let userCd2 = "";
			
			$("#btnFind").on("click", function() {
				const userNm = $("#userNm").val();
				const userReg1 = $("#userReg1").val();
				const userReg2 = $("#userReg2").val();
						
				console.log("userNm:", userNm);
				console.log("userReg1:", userReg1);
				console.log("userReg2:", userReg2);

				let data = {
					"userNm" : userNm,
					"userReg1" : userReg1,
					"userReg2" : userReg2
				};

				//{"userNm": "강아지","userReg1": "040101","userReg2": "2222222"}
				console.log("data : ", data);

				// Ajax 요청 전에 CSRF 토큰 가져오기
				// 			const csrfToken = $("meta[name='_csrf']").attr("content");
				// 			const csrfHeader = $("meta[name='_csrf_header']").attr("content");

				$.ajax({
					url : "/findinfo/loginSearchId",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					type : "post",
					dataType : "json",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						console.log("result : ", result);
						if (result.result && result.result.userCd) {
							openUserCdModal(result.result.userCd);
						} else {
							alert("사용자 정보를 다시 입력해주세요.");
							$("#userNm").val("");
							$("#userReg1").val("");
							$("#userReg2").val("");
						}
					},
					error : function(request, status, error) {
						console.log("status : " + status + ", error : "
								+ error);
						alert("사용자 정보를 다시 입력해주세요.");
						$("#userNm").val("");
						$("#userReg1").val("");
						$("#userReg2").val("");
					}
				});
			});
			
			$("#btnFindPassword").on("click", function() {
				const userCd = $("#userCd").val();
				const userTel = $("#userTel").val();

				console.log("userCd:", userCd);
				console.log("userTel:", userTel);

				let data = {
					"userCd" : userCd,
					"userTel" : userTel,
				};

				console.log("data : ", data);

				$.ajax({
					url : "/findinfo/loginSearchPw",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(data),
					type : "post",
					dataType : "json",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success : function(result) {
						console.log("result : ", result);
						if (result.message.statusCode == 2000) {
							alertSuccess("인증번호가 전송되었습니다.");
							code = result.code;
							userCd2 = userCd;
							$("#userCd").prop("disabled", true);
							$("#userTel").prop("disabled", true)
							$("#verificationCodeForm").css("display", "block");
							$("#btnFindPassword").text("인증")
							$("#btnFindPassword").off("click")
							$("#btnFindPassword").attr("id", "btnCompareCode");
						} else {
							alertError("사용자 정보를 다시 입력해주세요.");
							$("#userCd").val("");
							$("#userTel").val("");
						}
					},
					error : function(request, status, error) {
						console.log("status : " + status + ", error : "
								+ error);
						alert("사용자 정보를 다시 입력해주세요.");
						$("#userCd").val("");
						$("#userTel").val("");
					}
				});
			});
			
			$(document).on("click", "#btnCompareCode", function() {
				if ($("#verificationCode").val() == code) {
					$("#findPasswordModal").hide();
					$("#modPasswordModal").show();
				} else {
					alertError("인증번호가 일치하지 않습니다.");
				}
			});
			
			$("#checkPassword").on("keyup", function() {
				const password1 = $("#newPassword").val();
				if (password1 != $(this).val()) {
					$("#checkMessage").css("display", "block");
					$("#checkMessage").css("color", "red");
					$("#checkMessage").text("비밀번호가 일치하지 않습니다.");
				} else {
					$("#checkMessage").css("color", "green");
					$("#checkMessage").text("비밀번호가 일치합니다.");
				}
			});
			
			$("#btnModPassword").on("click", function() {
				if ($("#checkMessage").css("color") == "red") {
					alertError("비밀번호가 일치하지 않습니다.");
					return;
				} else {
					const password = $("#newPassword").val();
					$.ajax({
						url: "/findinfo/modPassword",
						type: "post",
						contentType: "application/json; charset=UTF-8",
						data: JSON.stringify({
							userPass:password,
							userCd: userCd2
						}),
						beforeSend : function(xhr) {
							xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
						},
						success: res => {
							if (res == 1) alertSuccess("비밀번호 변경에 성공하였습니다.\n다시 로그인해주세요.", "/login");
						}
					})
				}
			})
			
		});
		$(document).on("click",".login_warning",function(){
			$('.login_warning_modal').show();
		})
		$(document).on("click",".login_warning2",function(){
			$('.login_warning_modal2').show();
		})
		$(document).on("click",".login_close_bt",function(){
			closeModal();
		})
		$(document).on("click", ".modal_back", function () {
	    	closeModal();
		});
		//모달 출력시 닫기버튼 또는 배경을 누르면 모달닫힘
		function closeModal() {
		    $(".login_warning_modal").fadeOut();
		    $(".login_warning_modal2").fadeOut();
		//     $(".modal-bg").fadeOut();
		}
	</script>
</body>
</html>