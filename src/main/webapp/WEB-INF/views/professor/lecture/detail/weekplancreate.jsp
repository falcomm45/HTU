<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/jquery.min.js"></script>

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

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>

<div class="record_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/list" style="font-size:12px; color:#888888;">강의실</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/detail?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">${lectureNm}</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/weekplan/create?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">주차별계획등록</a></span>
	</div>
<form role="form" id="weekplanFrm" action="/professor/weekplan/create?${_csrf.parameterName}=${_csrf.token}" method="post" class="record_form">
	<div class="table_topic" style="margin-bottom:40px; padding-bottom:15px; border-bottom:1px solid #d1d0d0;"></div>
	
	<div class="record_form_title">
		<table style="margin-bottom:40px;">
			<tr>
				<th>1주차<input id="wpNo" type="hidden" name="weekplanVOList[0].wpNo" value="1" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[0].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[0].wpCon"  style="width:100%; font-size:15px; border:0;" required="required"/></td>
			</tr>
			<tr>
				<th>2주차<input id="wpNo" type="hidden" name="weekplanVOList[1].wpNo" value="2" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[1].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[1].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>3주차<input id="wpNo" type="hidden" name="weekplanVOList[2].wpNo" value="3" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[2].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[2].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>4주차<input id="wpNo" type="hidden" name="weekplanVOList[3].wpNo" value="4" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[3].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[3].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>5주차<input id="wpNo" type="hidden" name="weekplanVOList[4].wpNo" value="5" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[4].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[4].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>6주차<input id="wpNo" type="hidden" name="weekplanVOList[5].wpNo" value="6" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[5].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[5].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>7주차<input id="wpNo" type="hidden" name="weekplanVOList[6].wpNo" value="7" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[6].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[6].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>8주차<input id="wpNo" type="hidden" name="weekplanVOList[7].wpNo" value="8" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[7].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[7].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>9주차<input id="wpNo" type="hidden" name="weekplanVOList[8].wpNo" value="9" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[8].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[8].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>10주차<input id="wpNo" type="hidden" name="weekplanVOList[9].wpNo" value="10" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[9].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[9].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>11주차<input id="wpNo" type="hidden" name="weekplanVOList[10].wpNo" value="11" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[10].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[10].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>12주차<input id="wpNo" type="hidden" name="weekplanVOList[11].wpNo" value="12" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[11].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[11].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>13주차<input id="wpNo" type="hidden" name="weekplanVOList[12].wpNo" value="13" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[12].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[12].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>14주차<input id="wpNo" type="hidden" name="weekplanVOList[13].wpNo" value="14" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[13].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[13].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>15주차<input id="wpNo" type="hidden" name="weekplanVOList[14].wpNo" value="15" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[14].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[14].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
			<tr>
				<th>16주차<input id="wpNo" type="hidden" name="weekplanVOList[15].wpNo" value="16" style="width:100px; font-size:15px; border:0;"/><input type="hidden" name="weekplanVOList[15].lecCd" value="${param.lecCd}"/></th>
				<td colspan="5"><input id="wpCon" type="text" name="weekplanVOList[15].wpCon"  style="width:100%; font-size:15px; border:0;"required="required"/></td>
			</tr>
		</table>
	</div>
	
	<div style="display:flex; justify-content:end; margin-top:40px; position:absolute; bottom:40px; right:30px;">
<%-- 		<button class="btn-reg bur" id="capBtn" data-rec-Cd="${recordVO.recCd}">신청</button> --%>
			<button class="btn-reg bur" id="weekplanSub" type="button">등록</button>
		<button type="button" id="btnCancle" class="cancel btn-reg back" style="margin-left:10px;">취소</button>
	</div>
	<sec:csrfInput />
</form>	
</div>


<script type="text/javascript">
let cntWeekplan = 0;
$(function(){  
	$("#lecNm").text($(".sub_title").text());
	$(".table_topic").text($(".sub_title").text());
	
	
	$("#weekplanSub").on("click", function(){
		
		sweetConfirmCreate();
	});
	document.getElementById("btnCancle").addEventListener('click', historyBack);
	function historyBack(){
		history.back();
	}
	
	
	function sweetConfirmCreate() {
	    Swal.fire({
	        text: "주차별일정을 등록 하시겠습니까?",
	        icon: "question",
	        width: 300,
	        showCancelButton: true,
	        confirmButtonColor: "#3085d6",
	        cancelButtonColor: "#d33",
	        confirmButtonText: "네",
	        cancelButtonText: "아니오"
	    }).then((result) => {
	        console.log(result);
	        if (result.isConfirmed) {
	        	$("#weekplanFrm").submit();
	        } else {
	            alertError('등록을 취소하였습니다.');
	        }
	    });
	}
	
	
}); 
</script> 


