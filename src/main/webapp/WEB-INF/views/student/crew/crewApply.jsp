<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
.crew_box{width:100%; padding:40px; background-color:#ffffff;}
.table_topic{font-size: 20px; padding-bottom:20px;}

.crew_form{border:1px solid #d1d0d0; padding:30px; width:80%; border-radius:5px; position:relative;}
.crew_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
.crew_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
.crew_form_title select, .crew_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
.crew_margin_left{margin-left:5px;}
.crew_form a:hover{color:#ffffff!important;}
.crew_box input:focus {outline: none;}
</style>
<sec:authentication property="principal.userVO" var="userVO"/>
<div class="crew_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/crew/crewList">동아리</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/crew/crewApply">동아리개설</a></span>
	</div>
	<div class="table_topic">동아리 개설</div>
	<div>
		<button type="button" id="autoBtn" class="btn-two mini gray">자동 입력</button>
	</div>
	<form class="crew_form" id="appFrm" action="/student/crew/crewApplyPost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<input type="text" name="crLeader" value="${userVO.userCd}" hidden="hidden" />
		<div class="crew_form_title">
			<p>동아리명</p>
			<input type="text" id="crNm" name="crNm" required="required"/>
		</div>
		<div class="crew_form_title">
			<p>동아리 목적</p>
			<input type="text" id="crCon" name="crCon" required="required"/>
		</div>
		<div class="crew_form_title">
			<p>동아리장</p>
			<input type="text" value="${userVO.userNm}" readonly="readonly"/>
		</div>
		<div class="crew_form_title">
			<p>희망 동아리실</p>
			<select name="roomCd" id="roomCd">
				<option value="none">==동아리실 선택==</option>
				<c:forEach var="roomList" items="${roomList}">
					<option value="${roomList.roomCd}">${roomList.roomNm}</option>
				</c:forEach>
			</select>
		</div>
		<div class="crew_form_title" style="margin-bottom:100px;">
			<p>파일첨부</p>
			<input type="file" name="uploadFiles" />
		</div>
		<div class="crew_form_title" style="margin-bottom:0; margin-top:20px; position:absolute; right:30px; bottom:30px;">
			<div style="display:flex;">
				<button type="button" id="btnApply" class="btn-reg bur">신청</button>
				<button type="button" id="btnCancle" class="btn-reg back" style="margin-left:10px;">취소</button>
			</div>
		</div>
		<sec:csrfInput />
	</form>
</div>
<script type="text/javascript">
$(function(){
	
	$("#autoBtn").on("click", function(){
		$("#crNm").val("무빙");
    	$("#crCon").val("영화 제작 동아리");
    	$("#roomCd option:eq(2)").prop("selected", true);
	});
	
	$("#btnApply").on("click", function(){
		
		Swal.fire({
			text: "동아리 개설 신청을 진행하시겠습니까?",
			icon: 'question',
			width: 400,
			position:'top',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText:  '취소',
		}).then((result) => {
		 	console.log(result);
		 	if (result.isConfirmed) {
		 		alertSuccess('신청되었습니다.');
		 		setTimeout(() => {
					$("#appFrm").submit();
				}, 1300);
		    }
		});
	});
	
	$("#btnCancle").on("click", function(){
		
		Swal.fire({
			text: "개설 신청을 취소하시겠습니까?",
			icon: 'question',
			width: 400,
			position:'top',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '확인',
			cancelButtonText:  '취소',
		}).then((result) => {
		 	console.log(result);
		 	if (result.isConfirmed) {
		 		history.back();
		    }
		});
	});
});
</script>