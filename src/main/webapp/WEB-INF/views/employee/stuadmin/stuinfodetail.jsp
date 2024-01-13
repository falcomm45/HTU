<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- <sec:authentication property="principal.userVO" var="userVO" /> --%>
<%-- <sec:authentication property="principal.userVO" var="userVO" /> --%>
<style>
 .content{background-color:#ffffff;}
 .table_topic{font-size: 20px; padding-bottom:30px;}
 .prifile_wrap tr{display: table-row;}
 .profile_wrap th{width:170px; padding:20px; font-size:14px;}
 .profile_wrap td{padding:10px;}
 .profile_photo{width:100px!important; height:100px!important; border:1px solid #888888;}
</style>


<div class="profile_wrap" id="profileDetail" style="display: none;">
<div class="table_topic">기본정보</div>
<table>
<tr>
	<th>사진</th> 
	<td class="profile_photo"><td>
</tr>
<tr>
	<th>학적상태</th> 
	<c:choose>
			<c:when test="${studentVO.commonDetailVO.comdNm eq '재학'}"><td class="btn-two mini green">${studentVO.commonDetailVO.comdNm}</td></c:when>
			<c:when test="${studentVO.commonDetailVO.comdNm eq '휴학'}"><td class="btn-two mini gray">${studentVO.commonDetailVO.comdNm}</td></c:when>
			<c:when test="${studentVO.commonDetailVO.comdNm eq '자퇴'}"><td class="btn-two mini red">${studentVO.commonDetailVO.comdNm}</td></c:when>
			<c:when test="${studentVO.commonDetailVO.comdNm eq '재적'}"><td class="btn-two mini orange">${studentVO.commonDetailVO.comdNm}</td></c:when>
			<c:when test="${studentVO.commonDetailVO.comdNm eq '졸업'}">
				<td class="btn-two mini blue">${studentVO.commonDetailVO.comdNm}
					<tr>
						<th>졸업일자</th> 
						<td><fmt:formatDate value="${studentVO.stuAddt}" pattern="yyyy-MM-dd"/><td>
					</tr>
				</td>
			</c:when>
	</c:choose>
</tr>
<tr>
	<th>입학일자</th> 
	<td><fmt:formatDate value="${studentVO.stuAddt}" pattern="yyyy-MM-dd"/><td>
</tr>
<tr>
	<th>학과</th> 
	<td>${studentVO.departmentVO.colNm} ${studentVO.departmentVO.depNm}</td>
</tr>
<tr>
	<th>학번</th> 
	<td>${studentVO.stuCd}</td>
</tr>
<tr>
	<th>학년/학기</th> 
	<td>${studentVO.stuYear} / ${studentVO.stuSem}</td>
</tr>
<tr>
	<th>이름(영문)</th> 
	<td>${studentVO.userVO.userNm}(${studentVO.userVO.userNme})</td>
</tr>
<tr>
	<th>생년월일</th> 
	<td>
	${fn:substring(studentVO.userVO.userReg1,0,2)}년
	${fn:substring(studentVO.userVO.userReg1,2,4)}월
	${fn:substring(studentVO.userVO.userReg1,4,6)}일
	</td>
</tr>
<tr>
	<th>주민등록번호</th> 
	<td>${studentVO.userVO.userReg1} <span style="display:inline-block;">-</span> ${studentVO.userVO.userReg2}</td>
</tr>
<tr> 
	<th>전화번호</th> 
	<td>${studentVO.userVO.userTel}</td>
</tr>
<tr>
	<th>우편번호</th> 
	<td>${studentVO.userVO.userZip}</td>
</tr>
<tr>
	<th>주소</th> 
	<td>${studentVO.userVO.userReg1}${studentVO.userVO.userReg2}</td>
</tr>
<tr>
	<th>이메일</th> 
	<td>${studentVO.userVO.userMail}</td>
</tr>
<tr>
	<th>계좌</th> 
	<td>${studentVO.userVO.userBank} ${studentVO.userVO.userAcc}</td>
</tr>
<tr>
	<th>비밀번호변경</th>
</tr>
</table>
<button type="button" onclick="location.href='/employee/stuadmin/stuinfo'">목록</button>
</div>


<button type="button" onclick="closeModal()">Close</button>

<script>

$(document).ready(function(){
	$(".detail-btn").on("click",function(){
		$(".profile_wrap").show();
	})
});

    function closeModal() {
        // Close the modal by removing the modal container from the body
        $("#customModal").remove();
    }
</script>