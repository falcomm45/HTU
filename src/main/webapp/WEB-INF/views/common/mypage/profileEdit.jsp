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
	border: 2px solid #888888;
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
	width: 19%;
	height: 28%;
	position: absolute;
	left: 37%;
	top: 3%;
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
.table_topic{font-size: 20px; padding-bottom:30px;}
.table_topic i{margin-left:10px;}
#profileForm img {
  width: 100%;
  height: 200px;
  border-radius: 5px;
}
    
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<sec:authentication property="principal.userVO" var="userVO" />

<!-- 프로필 사진 등록폼 시작 -->
<div class="profile_wrap">
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
		<span style="font-size:12px; color:#888888;"><a href="/common/mypage/profileEdit">정보수정</a></span>
	</div>
	<div class="table_topic" style="font-weight: 400;">정보수정<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>

	<div class="profile_photo_wrap">
		<div class="profile_photo">		
			<c:choose>
				<c:when test="${userProfileVO.filesDetailVO ne null and not empty userProfileVO.filesDetailVO}">
					<img src="/resources/upload/${userProfileVO.filesDetailVO.fileSvnm}" alt="Profile Photo" id="profileImage">
				</c:when>
				<c:otherwise>
					<img src="/resources/images/unknownperson.jpg" alt="Profile Photo" id="profileImage">
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	
	<form id="profileEditForm" action="/common/mypage/profileEditPost" method="post">
		<input type="text" id="userCd" name="userCd" value="${userProfileVO.userCd}" style="display: none;">
			<c:if test="${userProfileVO.comdCd eq 'USER01'}">
				<table>
					<tr>
						<th>학번</th>
						<td>${userProfileVO.userCd}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${userProfileVO.userNm}</td>
					</tr>
					<tr>
						<th>이름(영문)</th>
						<td>${userProfileVO.userNme}</td>
					</tr>
					<tr>
						<th>주민등록번호</th>
						<td>${userProfileVO.userReg1}-*******</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userTelDisplay">${userProfileVO.userTel}</span>
								<input type="text" id="userTel" name="userTel" class="editable-input" style="display: none;" value="${userProfileVO.userTel}"> 
								<i class="fas fa-pencil-alt edit-icon" data-target="userTel"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>
								<span class="editable" id="userZipDisplay">(${userProfileVO.userZip})</span>
								<button class="btn-two mini green" type="button" id="addressBtn">주소검색</button>
								<input type="text" id="userZip" name="userZip" value="${userProfileVO.userZip}" style="display: none;">
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userAddr1Display">${userProfileVO.userAddr1}</span>
<%-- 								<span id="addr1Span">${userProfileVO.userAddr1}</span> --%>
								<input type="text" id="userAddr1" name="userAddr1" value="" style="display: none;" /> 
							</div>
						</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userAddr2Display">${userProfileVO.userAddr2}</span>
								<input type="text" id="userAddr2" name="userAddr2" class="editable-input" value="${userProfileVO.userAddr2}" style="display: none;"> 
								<i  class="fas fa-pencil-alt edit-icon" data-target="userAddr2"></i>
							</div>
							<input type="hidden" id="userAddr3" name="userAddr3" class="editable-input" style="display: none;"> 
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userMailDisplay">${userProfileVO.userMail}</span>
								<input type="text" id="userMail" name="userMail" class="editable-input" style="display: none;" value="${userProfileVO.userMail}"> 
								<i class="fas fa-pencil-alt edit-icon" data-target="userMail"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>은행명</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userBankDisplay">${userProfileVO.userBank}</span>
								<input type="text" id="userBank" name="userBank" class="editable-input" value="${userProfileVO.userBank}" style="display: none;">
								<i class="fas fa-pencil-alt edit-icon" data-target="userBank"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>계좌번호</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userAccDisplay">${userProfileVO.userAcc}</span>
								<input type="text" id="userAcc" name="userAcc" class="editable-input" value="${userProfileVO.userAcc}"	style="display: none;"> 
								<i class="fas fa-pencil-alt edit-icon" data-target="userAcc"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>학년</th>
						<td>${userProfileVO.studentVO.stuYear}학년</td>
					</tr>
					<tr>
						<th>학기</th>
						<td>${userProfileVO.studentVO.stuSem}학기</td>
					</tr>
					<tr>
						<th>입학일자</th>
						<td><fmt:formatDate value="${userProfileVO.studentVO.stuAddt}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</table>
			</c:if>
			
			<c:if test="${userProfileVO.comdCd eq 'USER02'}">
				<table>
					<tr>
						<th>교번</th>
						<td>${userProfileVO.userCd}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${userProfileVO.userNm}</td>
					</tr>
					<tr>
						<th>이름(영문)</th>
						<td>${userProfileVO.userNme}</td>
					</tr>
					<tr>
						<th>직함</th>
						<td>${userProfileVO.professorVO.proPos}</td>
					</tr>
					<tr>
						<th>주민등록번호</th>
						<td>${userProfileVO.userReg1}-*******</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userTelDisplay">${userProfileVO.userTel}</span>
								<input type="text" id="userTel" name="userTel" class="editable-input" style="display: none;" value="${userProfileVO.userTel}"> 
								<i class="fas fa-pencil-alt edit-icon" data-target="userTel"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>
								<span class="editable" id="userZipDisplay">(${userProfileVO.userZip})</span>
								<button class="btn-two mini green" type="button" id="addressBtn">주소검색</button>
								<input type="text" id="userZip" name="userZip" value="${userProfileVO.userZip}" style="display: none;">
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userAddr1Display">${userProfileVO.userAddr1}</span>
<%-- 								<span id="addr1Span">${userProfileVO.userAddr1}</span> --%>
								<input type="text" id="userAddr1" name="userAddr1" value="" style="display: none;" /> 
							</div>
						</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userAddr2Display">${userProfileVO.userAddr2}</span>
								<input type="text" id="userAddr2" name="userAddr2" class="editable-input" value="${userProfileVO.userAddr2}" style="display: none;"> 
								<i  class="fas fa-pencil-alt edit-icon" data-target="userAddr2"></i>
							</div>
							<input type="hidden" id="userAddr3" name="userAddr3" class="editable-input" style="display: none;"> 
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userMailDisplay">${userProfileVO.userMail}</span>
								<input type="text" id="userMail" name="userMail" class="editable-input" style="display: none;" value="${userProfileVO.userMail}"> 
								<i class="fas fa-pencil-alt edit-icon" data-target="userMail"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>은행명</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userBankDisplay">${userProfileVO.userBank}</span>
								<input type="text" id="userBank" name="userBank" class="editable-input" value="${userProfileVO.userBank}" style="display: none;">
								<i class="fas fa-pencil-alt edit-icon" data-target="userBank"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>계좌번호</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userAccDisplay">${userProfileVO.userAcc}</span>
								<input type="text" id="userAcc" name="userAcc" class="editable-input" value="${userProfileVO.userAcc}"	style="display: none;"> 
								<i class="fas fa-pencil-alt edit-icon" data-target="userAcc"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>학과코드</th>
						<td>${userProfileVO.professorVO.depCd}</td>
					</tr>
					<tr>
						<th>연구실</th>
						<td>${userProfileVO.professorVO.roomCd}</td>
					</tr>
					<tr>
						<th>입사일</th>
						<td><fmt:formatDate value="${userProfileVO.professorVO.proJoin}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</table>
			</c:if>
			
			<c:if test="${userProfileVO.comdCd eq 'USER03'}">
				<table>
					<tr>
						<th>사번</th>
						<td>${userProfileVO.userCd}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${userProfileVO.userNm}</td>
					</tr>
					<tr>
						<th>이름(영문)</th>
						<td>${userProfileVO.userNme}</td>
					</tr>
					<tr>
						<th>부서</th>
						<td>${userProfileVO.employeeVO.empDept}</td>
					</tr>
					<tr>
						<th>직책</th>
						<td>${userProfileVO.employeeVO.empPos}</td>
					</tr>
					<tr>
						<th>주민등록번호</th>
						<td>${userProfileVO.userReg1}-*******</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userTelDisplay">${userProfileVO.userTel}</span>
								<input type="text" id="userTel" name="userTel" class="editable-input" style="display: none;" value="${userProfileVO.userTel}"> 
								<i class="fas fa-pencil-alt edit-icon" data-target="userTel"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td>
								<span class="editable" id="userZipDisplay">(${userProfileVO.userZip})</span>
								<button class="btn-two mini green" type="button" id="addressBtn">주소검색</button>
								<input type="text" id="userZip" name="userZip" value="${userProfileVO.userZip}" style="display: none;">
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userAddr1Display">${userProfileVO.userAddr1}</span>
<%-- 								<span id="addr1Span">${userProfileVO.userAddr1}</span> --%>
								<input type="text" id="userAddr1" name="userAddr1" value="" style="display: none;" /> 
							</div>
						</td>
					</tr>
					<tr>
						<th>상세주소</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userAddr2Display">${userProfileVO.userAddr2}</span>
								<input type="text" id="userAddr2" name="userAddr2" class="editable-input" value="${userProfileVO.userAddr2}" style="display: none;"> 
								<i  class="fas fa-pencil-alt edit-icon" data-target="userAddr2"></i>
							</div>
							<input type="hidden" id="userAddr3" name="userAddr3" class="editable-input" style="display: none;"> 
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userMailDisplay">${userProfileVO.userMail}</span>
								<input type="text" id="userMail" name="userMail" class="editable-input" style="display: none;" value="${userProfileVO.userMail}"> 
								<i class="fas fa-pencil-alt edit-icon" data-target="userMail"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>은행명</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userBankDisplay">${userProfileVO.userBank}</span>
								<input type="text" id="userBank" name="userBank" class="editable-input" value="${userProfileVO.userBank}" style="display: none;">
								<i class="fas fa-pencil-alt edit-icon" data-target="userBank"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>계좌번호</th>
						<td>
							<div class="edit_form">
								<span class="editable" id="userAccDisplay">${userProfileVO.userAcc}</span>
								<input type="text" id="userAcc" name="userAcc" class="editable-input" value="${userProfileVO.userAcc}"	style="display: none;"> 
								<i class="fas fa-pencil-alt edit-icon" data-target="userAcc"></i>
							</div>
						</td>
					</tr>
					<tr>
						<th>입사일</th>
						<td><fmt:formatDate value="${userProfileVO.employeeVO.empJoin}" pattern="yyyy-MM-dd" /></td>
					</tr>
				</table>
			</c:if>
<!-- 		<button type="button" id="profileEditSubmit" class="btn-two mini blue" -->
<!-- 			style="position: relative; left: 92%; top: 9px;">수정</button> -->
<!-- 		<div class="counsel_form_title" style="margin-bottom:0; margin-top:20px; position:absolute; right:30px; bottom:30px;"> -->
		<div style="display:flex;">
			<button type="button" class="btn-reg bur" id="profileEditSubmit" style="position: relative; left: 85%; top: 10px;" >수정</button>
		</div>
	</form>
	</div>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
<script>

$(document).ready(function() {
	
	
	
	
    $(".edit-icon").click(function() {
       var targetId = $(this).data("target");
		
       $("#" + targetId + "Display").toggle();
       $("#" + targetId).toggle().focus();
       

       
    });

    $("#profileEditSubmit").click(function() {
       
          Swal.fire({
              title: '수정하시겠습니까?',
              icon: 'question',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: '네',
              cancelButtonText:"아니오"
          }).then((result) => {
              if (result.isConfirmed) {
               var csrfToken = $("meta[name='_csrf']").attr("content");
               var csrfHeader = $("meta[name='_csrf_header']").attr("content");
               var userCd = $("#userCd").val();
               
                 $.ajax({
                    type : "POST",
                    url : "/common/mypage/profileEditPost",
                    data : $("#profileEditForm").serialize(),
                    beforeSend : function(xhr) {
                       xhr.setRequestHeader(csrfHeader, csrfToken);
                    },
                    success : function(data) {
                       alertSuccess("수정이 완료되었습니다.", "/common/mypage/profile");
                    },
                 });
              }else{
                 alertError('수정을 취소하였습니다');
              }
          });
    
    });
    
    $("#addressBtn").click(function(){
    	stuinfo_execDaumPostcode();
    });

 });
 
function stuinfo_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ""; // 주소 변수
            var extraAddr = ""; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === "R") {
                // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else {
                // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
                 
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === "R") {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== "" && data.apartment === "Y") {
                    extraAddr +=
                        extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== "") {
                    extraAddr = " (" + extraAddr + ")";
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                //<input type="text" id="address3" style="display: none;"> --> 이 내용 jsp에 붙여넣기
                document.getElementById("userAddr3").value = extraAddr;
            } else {
                document.getElementById("userAddr3").value = "";
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("userZipDisplay").innerText = data.zonecode;
            document.getElementById("userAddr1Display").innerText = addr;
            document.getElementById("userAddr1").value = addr;
            document.getElementById("userAddr2").value = "";
            // 기존의 상세주소를 지우고 커서를 상세주소 필드로 이동한다.
            document.getElementById("userAddr2Display").innerText = '';
            document.getElementById("userAddr2Display").focus();
        },
    }).open();
}
	
</script>

