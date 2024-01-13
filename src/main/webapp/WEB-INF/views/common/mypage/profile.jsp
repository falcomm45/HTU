<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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

.free_topic {
	font-size: 30px;
	padding-bottom: 30px;
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
.table_topic{font-size: 20px; padding-bottom:30px;}
.table_topic i{margin-left:10px;}
.profile_wrap td {
    padding: 15px;
    font-weight: bold;
}

.logo {
    width: 19%;
    height: 28%;
    position: absolute;
    left: 37%;
    top: 3%;
}


</style>

<sec:authentication property="principal.userVO" var="userVO" />

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
		<span style="font-size:12px; color:#888888;"><a href="/common/mypage/profile">내정보</a></span>
	</div>
	<div class="table_topic" style="font-weight: 400;">내 정보<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>

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
			<td>${userProfileVO.userTel}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>(${userProfileVO.userZip})</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${userProfileVO.userAddr1}</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td>${userProfileVO.userAddr2}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${userProfileVO.userMail}</td>
		</tr>
		<tr>
			<th>은행명</th>
			<td>${userProfileVO.userBank}</td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td>${userProfileVO.userAcc}</td>
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
			<td>${userProfileVO.userTel}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>(${userProfileVO.userZip})</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${userProfileVO.userAddr1}</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td>${userProfileVO.userAddr2}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${userProfileVO.userMail}</td>
		</tr>
		<tr>
			<th>은행명</th>
			<td>${userProfileVO.userBank}</td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td>${userProfileVO.userAcc}</td>
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
			<td>${userProfileVO.userTel}</td>
		</tr>
		<tr>
			<th>우편번호</th>
			<td>(${userProfileVO.userZip})</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${userProfileVO.userAddr1}</td>
		</tr>
		<tr>
			<th>상세주소</th>
			<td>${userProfileVO.userAddr2}</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${userProfileVO.userMail}</td>
		</tr>
		<tr>
			<th>은행명</th>
			<td>${userProfileVO.userBank}</td>
		</tr>
		<tr>
			<th>계좌번호</th>
			<td>${userProfileVO.userAcc}</td>
		</tr>
		<tr>
			<th>입사일</th>
			<td><fmt:formatDate value="${userProfileVO.employeeVO.empJoin}" pattern="yyyy-MM-dd" /></td>
		</tr>
	</table>
</c:if>
</div>