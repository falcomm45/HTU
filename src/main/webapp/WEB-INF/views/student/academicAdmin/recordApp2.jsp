<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.record_box{width:800px; height:1000px; padding:40px; background-color:#ffffff;}
.table_topic{font-size: 20px; padding-bottom:30px;}

.record_form{border:1px solid #d1d0d0; padding:30px; width:100%; height:calc(100% - 35px); border-radius:5px; position:relative;}
.record_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
/* .record_form_title p{width:120px; font-size:16px; margin-bottom:15px;} */
/* .record_form_title select, .counsel_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;} */
.record_form a:hover{color:#ffffff!important;}
.record_form input:focus{outline:none;}
.record_form textarea{resize:none;}
.record_form table th, .record_form table td{border:1px solid #888888; padding:7px; font-size:15px;}
.record_form table th{text-align:center; background-color:#ebebeb;}
</style>

<div class="record_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/academicAdmin/recordList">학사행정</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/academicAdmin/recordList">학적관리</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/academicAdmin/recordApp">학적변경신청</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/academicAdmin/recordApp2">복학신청</a></span>
	</div>
<form name="frm"
	action="/student/academicAdmin/recordAppPost?${_csrf.parameterName}=${_csrf.token}"
	method="post" enctype="multipart/form-data" class="record_form" id="record_form">
	<div class="table_topic" style="margin-bottom:40px; padding-bottom:15px; border-bottom:1px solid #d1d0d0;">복학신청서</div>
	<!-- 내학번 -->
	<sec:authentication property="principal.userVO" var="userVO" />
	<!-- 컨트롤러에서 받아온 오늘날짜 -->
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
<%-- 	<input type="text" name="stuCd" hidden="hidden" value="${userVO.userCd}">  --%>
    <!-- 학생코드 -->
	<input type="text" name="stuCd" id="stuCd" hidden="hidden" value="${userVO.studentVO.stuCd}"> 
	<!-- 학적상태 :  -->
	<input type="text" name="comdCd" id="comdCd" hidden="hidden" value="RECD01">
	
	<div class="record_form_title">
		<div style="margin-bottom:40px;">
			<span>신청일자 &nbsp;:&nbsp;</span><span>${today}</span>
		</div>
		<div style="margin-bottom:40px;">
			<span>학적상태 &nbsp;:&nbsp;</span><span>${data.commonDetailVO.comdNm}</span>
		</div>
		<div style="margin-bottom:10px;">학생정보</div>
		<table style="margin-bottom:40px;">
			<tr>
				<th>소속</th>
				<td>${userVO.studentVO.departmentVO.depNm}</td>
				<th>주민등록번호</th>
				<td>${userVO.userReg1}<span>&nbsp;-&nbsp;</span>${userVO.userReg2}</td>
			</tr>
			<tr>
				<th>학번</th>
				<td>${userVO.userCd}</td>
				<th>전화번호</th>
				<td>${userVO.userTel}</td>
			</tr>
			<tr>
				<th>성명</th>
				<td>${userVO.userNm}</td>
				<th>입학일</th>
				<td><fmt:formatDate value="${userVO.studentVO.stuAddt}" pattern="yyyy-MM-dd"/></td>
			</tr>
		</table>
	
	 <div style="display:flex; margin-bottom:40px; align-items: center;">
	 	<div style="flex:1; display:flex; align-items: center;">
		 	<span style="text-wrap:nowrap; margin-right:5px;">신청년도</span>
		 	<!-- 컨트롤러에서 받아온 오늘날짜 -->
			<fmt:formatDate value="${now}" pattern="yyyy" var="year" />
			<input id="recYear" name="recYear" value="${year+1}" style="width:100%; font-size:15px; border:1px solid #888888;" readonly/>
		</div>
		<div style="flex:1; display:flex; align-items: center;">
			<span style="text-wrap:nowrap; margin-right:5px; margin-left:10px;">학기</span>
			<select id="recSem" name="recSem" style="width:100%; border:1px solid #888888;">
				<option value="1">1</option>
				<option value="2">2</option>
			</select>
		</div>
	  </div>	
		
<!-- 	  <div style="display:flex; flex-direction:column; margin-bottom:20px;  margin-top:10px;"> -->
<!-- 	  	<p style="margin-bottom:10px;">복학사유</p> -->
<!-- 	  	<textarea id="recRsn" name="recRsn" style="height:150px; padding:10px; line-height:20px; font-size:14px;"></textarea> -->
<!-- 	  </div> -->
	
	<div style="display:flex; justify-content:end; margin-top:40px; position:absolute; bottom:40px; right:30px;">
<%-- 		<button class="btn-reg bur" id="capBtn" data-rec-Cd="${recordVO.recCd}">신청</button> --%>
			<button class="btn-reg bur" id="form-btn" type="submit">신청</button>
		<a href="/student/academicAdmin/recordList" class="cancel btn-reg back" style="margin-left:10px;">취소</a>
	</div>
	<sec:csrfInput />
</form>	
</div>
<script>
//     console.log('${userVO}');
</script>