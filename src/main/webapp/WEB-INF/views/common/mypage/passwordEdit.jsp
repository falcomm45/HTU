<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.content {
	background-color: #ffffff;
}

.profile_wrap {
	width: 55%;
	margin: 20px;
	padding: 20px;
	border: 1px solid #dddddd;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	margin: 20px;
}

.table_topic {
	font-size: 24px;
	font-weight: bold;
	padding-bottom: 20px;
	display: flex;
	margin-left: 10px;
	position: relative;
}

.info-icon {
	font-size: 24px;
	position: absolute;
	left: 9.5%;
}

.profile_photo_wrap {
	display: flex;
	align-items: center;
	margin-top: 20px;
	margin-bottom: 20px;
}

.profile_photo {
	width: 170px;
	height: 160px;
	overflow: hidden;
	margin-right: 20px;
	border: 2px solid #000000;
}

.profile_photo img {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.upload_form {
	display: flex;
	flex-direction: column;
	margin-top: 20px;
}

.upload_form input {
	margin-bottom: 10px;
	width: 100%;
}

.upload_form button {
	padding: 10px;
	background-color: #4caf50;
	color: #ffffff;
	border: none;
	cursor: pointer;
}

.profile_wrap table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	border-radius: 10px; /* 모서리를 곡선으로 만듭니다. */
	overflow: hidden;
}

.profile_wrap th, .profile_wrap td {
	border: 1px solid #dddddd;
	padding: 10px;
	text-align: left;
}

.profile_wrap th {
	width: 170px;
	font-size: 14px;
	font-weight: bold;
	background-color: #f2f2f2; /* th 배경색 추가 */
}

.profile_wrap td {
	padding: 15px;
	font-weight: bold;
}

/* 수정 가능한 입력 폼 스타일 추가 */
.edit_form {
	border: 1px solid #ddd; /* 테두리 추가 */
	background-color: #f9f9f9; /* 배경색 추가 */
	/* 	border-radius: 5px; */
	padding: 5px;
}

.logo {
	width: 10%;
	height: 15%;
	position: absolute;
	left: 46%;
	top: 4.2%;
}

.edit-icon {
	cursor: pointer;
	color: #800020; /* Burgundy color */
	margin-left: 5px;
}

.editable {
	display: inline-block;
	margin-right: 5px;
}

.editable-input {
	font-size: 15px;
	font-family: sans-serif;
	font-weight: bold;
	width: 95%;
	background-color: #e0f7fa;
}

#profileForm {
  width: 300px;
  margin: 0 auto;
  padding: 10px;
  border: 1px solid #dddddd;
  border-radius: 5px;
  background-color: #ffffff;
}

#profileForm label {
  display: block;
  font-size: 16px;
  font-weight: bold;
}

#profileForm input {
  display: block;
  width: 100%;
  height: 40px;
  padding: 10px;
  border: 1px solid #dddddd;
  border-radius: 5px;
  font-size: 16px;
}

#profileForm img {
  width: 100%;
  height: 200px;
  border-radius: 5px;
}

form {
    position: relative;
}

#passwordRequirements {
    color: orange;
    font-size: 12px; /* 조절할 폰트 크기 */
    position: absolute;
}
#passwordMatchMessage {
	color: orange;
    font-size: 12px; /* 조절할 폰트 크기 */
    position: absolute;
}
.table_topic{font-size: 20px; padding-bottom:30px;}
.table_topic i{margin-left:10px;}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<sec:authentication property="principal.userVO" var="userVO" />

<!-- 프로필 사진 등록폼 시작 -->
<div class="profile_wrap">
<input type="hidden" id="userCd" value="${userVO.userCd}"/>
<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		
		<c:if test="${userVO.comdCd == 'USER01'}">
<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER02'}">		
<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER03'}">		
<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>
		
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/common/mypage/profile">마이페이지</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/common/mypage/passwordEdit">비밀번호 변경</a></span>
	</div>
		<div class="table_topic" style="font-weight: 400;">비밀번호 변경<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>

	<form id="passwordEditForm" action="/common/mypage/passwordEdit" method="post">
    <table>
        <tr>
            <th><b>현재 비밀번호</b></th>
            <td class="form-inline"><input type="password" id="curPwd" name="curPwd" class="form-control" /></td>
        </tr>
        <tr>
            <th><b>새 비밀번호</b></th>
            <td class="form-inline">
                <input type="password" id="newPwd" name="newPwd" class="form-control" />
                <div id="passwordRequirements" style="color: red;"></div>
            </td>
        </tr>
        <tr>
            <th><b>새 비밀번호 확인</b></th>
            <td class="form-inline">
                <input type="password" id="newPwdCheck" name="newPwdCheck" class="form-control" />
                <!-- 비밀번호 일치 여부 메시지 -->
                <div id="passwordMatchMessage" style="color: red;"></div>
            </td>
        </tr>
    </table>
    <div style="display:flex;">
        <button type="button" class="btn-reg bur" id="passwordEditSubmit" style="position: relative; left: 85%; top: 10px;">수정</button>
    </div>
</form>
</div>
<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>
    $(document).ready(function () {
        
        if ('${param.firstLogin}') {
            console.log("hi");
            Swal.fire({
                html: "최초 로그인 시 비밀번호는 생년월일입니다.<br>사용하실 비밀번호로 변경해주세요.",
                icon: 'warning',
                confirmButtonColor: '#3085d6',
                confirmButtonText: "확인"
            })
        }
    	
        $("#passwordEditSubmit").click(function() {
            
            Swal.fire({
                title: '수정하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Yes'
            }).then((result) => {
                if (result.isConfirmed) {
                 
                 data = {
									"userReg1": $("#curPwd").val(),
                	"userPass":$('#newPwd').val(),
                	"userCd":$('#userCd').val(),
                	"userReg2":$('#newPwdCheck').val()
                 };
                 
                   $.ajax({
                      url : "/common/mypage/passEditPost?${_csrf.parameterName}=${_csrf.token}",
                      contentType:"application/json;charset=utf-8",
                      data : JSON.stringify(data),
                      type : "post",
                      dataType:"json",
											beforeSend : function(xhr) {
												xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
											},
                      success : function(result) {
												console.log(result);
												if (result == 1) {
													alertSuccess("비밀번호 수정이 완료되었습니다. <br>변경된 비밀번호로 로그인 해주세요.");
													setTimeout(() => {
														$("#logoutForm").submit();
													}, 1300);
												} else if (result == 0) {
													alertError("입력하신 현재 비밀번호가 일치하지 않습니다.");
													$("#curPwd").val("");
													$("#newPwd").val("");
													$("#newPwdCheck").val("");
												} else {
													alertError("이전과 같은 비밀번호입니다.")
													$("#curPwd").val("");
													$("#newPwd").val("");
													$("#newPwdCheck").val("");
												}
                      },
                   });
                }else{
                   alertError('수정을 취소하였습니다');
                }
            });
      });
        
          //새로운 비번
            $('#newPwd').on('keyup', function() {
            	//비밀번호 공백 확인
            	if($("#newPwd").val() === ""){
            		$('#newPwdMsg').html('<b>비밀번호는 필수 정보입니다.</b>');
            		chk2 = false;
            	}		         
            	//비밀번호 유효성검사
            	else if(!getPwCheck.test($("#newPwd").val()) || $("#newPwd").val().length < 8){
            		$('#newPwdMsg').html('<b>특수문자 포함 8자 이상 입력하세요</b>');
            		chk2 = false;
            	} else {
            		$('#newPwdMsg').html('');
            		chk2 = true;
            	}
            			
            }); //end of new password
            
          //비밀번호 확인
            $('#newPwdCheck').on('keyup', function() {
            	
            	if($("#newPwdCheck").val() === "") {
            		$('#newPwdMsg').html('<b">비밀번호 확인은 필수 정보입니다.</b>');
            		chk3 = false;
            	} else if( $("#newPwd").val() != $("#newPwdCheck").val() ) {
            		$('#newPwdMsg').html('<b>비밀번호가 일치하지 않습니다.</b>');
            		chk3 = false;
            	} else {
            		$('#newPwdMsg').html('');
            		chk3 = true;
            }
            	
            			});//end of passwordCheck
        
        
    });
            
            
        

//         $('#passwordEditSubmit').on('click', function () {
//             var currentPassword = $('#curPwd').val();
//             var newPassword = newPasswordInput.val();
//             var newPasswordCheck = newPasswordCheckInput.val();

//             // 서버에서 현재 비밀번호 유효성 검사
//             $.ajax({
//                 url: '/common/mypage/checkCurrentPassword',
//                 type: 'POST',
//                 data: { currentPassword: currentPassword },
//                 success: function (response) {
//                     if (response === 'true') {
//                         // 현재 비밀번호가 맞으면 양식 제출 진행
//                         $('#passwordEditForm').submit();
//                     } else {
//                         // 현재 비밀번호가 틀릴 경우 경고 표시
//                         alert('현재 비밀번호가 잘못되었습니다.');
//                     }
//                 },
//                 error: function () {
//                     // AJAX 호출이 실패할 경우 오류 처리
//                     alert('현재 비밀번호 확인 중 오류가 발생했습니다.');
//                 }
//             });
//         });

//         function validateAndDisplayMessage() {
//             // 입력받은 비밀번호들
//             var newPassword = newPasswordInput.val();
//             var newPasswordCheck = newPasswordCheckInput.val();

//             // 비밀번호 규칙 검증
//             var isValidPassword = validatePassword(newPassword);

//             // 입력 여부 확인
//             var isNewPasswordInputEmpty = newPassword.length === 0;
//             var isNewPasswordCheckInputEmpty = newPasswordCheck.length === 0;

//             // 비밀번호가 일치하지 않는 경우 메시지 표시 및 버튼 비활성화
//             if (!isNewPasswordCheckInputEmpty && newPassword !== newPasswordCheck) {
//                 passwordMatchMessage.text('새 비밀번호와 일치하지 않습니다.');
//                 editButton.prop('disabled', true);
//             } else {
//                 passwordMatchMessage.text('');
//                 editButton.prop('disabled', !isValidPassword);
//             }

//             // 비밀번호 규칙 메시지 업데이트
//             requirementsDiv.text(isValidPassword && !isNewPasswordInputEmpty ? '' : (isNewPasswordInputEmpty ? '' : '비밀번호는 특수문자와 대소문자를 혼합해서 8~16자로 입력해야 합니다.'));
//         }
//     });

//     function validatePassword(password) {
//         // 여기에 비밀번호 규칙을 정의
//         var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,16}$/;
//         return regex.test(password);
//     }
    
</script>

