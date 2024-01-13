<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
	.counsel_box{width:100%; padding:40px; background-color:#ffffff;}
	.counsel_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.counsel_box .table_topic i{margin-left:10px;}
	.counsel_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.counsel_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.counsel_box tr:first-child{background-color:#EEF1F6;}
	.counsel_box tr:hover{background-color:#f2f3f4;}
	.counsel_box tr:first-child:hover{background-color:#EEF1F6;}
/* 	.counsel_box tr td:nth-child(1){width:10%;} */
/* 	.counsel_box tr td:nth-child(2){width:10%;} */
/* 	.counsel_box tr td:nth-child(3){width:20%;} */
/* 	.counsel_box tr td:nth-child(4){width:10%;} */
/* 	.counsel_box tr td:nth-child(5){width:15%;} */
/* 	.counsel_box tr td:nth-child(6){width:15%;} */
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div class="counsel_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/professor/lecture/list">강의</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<c:if test="${param.appYn == 0}">
	<span style="font-size:12px; color:#888888;"><a href="/professor/lectureapply/list?appYn=0">대기목록</a></span>
	<div class="table_topic" style="margin-top:20px; margin-bottom:-20px;">대기목록<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	</c:if>
	<c:if test="${param.appYn == 1}">
	<span style="font-size:12px; color:#888888;"><a href=/professor/lectureapply/list?appYn=1>승인목록</a></span>
	<div class="table_topic" style="margin-top:20px; margin-bottom:-20px;">승인목록<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	</c:if>
	<c:if test="${param.appYn == 2}">
	<span style="font-size:12px; color:#888888;"><a href="/professor/lectureapply/list?appYn=2">반려목록</a></span>
	<div class="table_topic" style="margin-top:20px; margin-bottom:-20px;">반려목록<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	</c:if>
	</div>
	
	<table style="margin-top:0px;">
		<tr class="table_title">
			<c:if test="${param.appYn == 0}">
				<td style="width:10%;">no</td>
				<td style="width:62%;">강의명</td>
				<td style="width:13%;">신청일</td>
				<td style="width:15%;">결재상태</td>
			</c:if>
			<c:if test="${param.appYn == 1}">
				<td style="width:10%;">no</td>
				<td style="width:49%;">강의명</td>
				<td style="width:13%;">신청일</td>
				<td style="width:13%;">처리일</td>
				<td style="width:15%;">개강상태</td>
			</c:if>
			<c:if test="${param.appYn == 2}">
				<td style="width:10%;">no</td>
				<td style="width:49%;">강의명</td>
				<td style="width:13%;">신청일</td>
				<td style="width:13%;">처리일</td>
				<td style="width:15%;">반려사유</td>
			</c:if>
		</tr>
		<c:if test="${param.appYn == 0}">
		<c:forEach var="standbyLecAppVO" items="${standbyLectureApplyVOList}" varStatus="stat">
			<tr>
				<td>${stat.count}</td>
				<td style="text-align: left;"><a href="/professor/lectureapply/detail?lecaCd=${standbyLecAppVO.lecaCd}&lecaNm=${standbyLecAppVO.lecaNm}">${standbyLecAppVO.lecaNm}</a></td>
				<td><fmt:formatDate value="${standbyLecAppVO.approvalVO.appReg}" pattern="yyyy-MM-dd" /></td>
				<td>대기</td>
				
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${param.appYn == 1}">
		<c:forEach var="approveLecAppVO" items="${approveLectureApplyVOList}" varStatus="stat">
			<tr>
				<td>${stat.count}</td>
				<td style="text-align: left;"><a href="/professor/lectureapply/detail?lecaCd=${approveLecAppVO.lectureApplyVO.lecaCd}&lecaNm=${approveLecAppVO.lectureApplyVO.lecaNm}" style="text-align: left;">${approveLecAppVO.lectureApplyVO.lecaNm}</a></td>
				<td><fmt:formatDate value="${approveLecAppVO.lectureApplyVO.approvalVO.appReg}" pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatDate value="${approveLecAppVO.lectureApplyVO.approvalVO.appProdt}" pattern="yyyy-MM-dd" /></td>
				<c:if test="${approveLecAppVO.lecStat == 0}"><td>개강</td></c:if>
				<c:if test="${approveLecAppVO.lecStat == 1}"><td>종강</td></c:if>
				<c:if test="${approveLecAppVO.lecStat == 2}"><td>폐강</td></c:if>
			</tr>
		</c:forEach>
		</c:if>
		<c:if test="${param.appYn == 2}">
		<c:forEach var="returnLecAppVO" items="${returnLectureApplyVOList}" varStatus="stat">
			<tr>
				<td>${stat.count}</td>
				<td style="text-align: left;"><a href="/professor/lectureapply/detail?lecaCd=${returnLecAppVO.lecaCd}&lecaNm=${returnLecAppVO.lecaNm}">${returnLecAppVO.lecaNm}</a></td>
				<td><fmt:formatDate value="${returnLecAppVO.approvalVO.appReg}" pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatDate value="${returnLecAppVO.approvalVO.appProdt}" pattern="yyyy-MM-dd" /></td>
				<td><button class="btn-two gray mini btnCompanion"  data-app-ret="${returnLecAppVO.approvalVO.appRet}" style="margin-left:2px;">반려사유</button></td>
			</tr>
		</c:forEach>
		</c:if>
<%-- data-app-yn="${counselVO.approvalVO.appYn}" --%>
	</table>
</div>

<script>
const applyCreate = '${applyCreate}';
$(function(){
	
	if (applyCreate == 1) {
		alertSuccess('강의계획 신청완료');
	}
	$(".btnCompanion").on("click", function() {
		const message = $(this).data("appRet");
		alertInfo(message);
	});
	function alertInfo(message) {
		Swal.fire({
			html: '<i class="fa-solid fa-circle-info" style="color: #333333;"></i>  반려사유 : ' + message,
			width: 600,
			padding: 30,
			position: "center",
			confirmButtonColor: "#333333",
			confirmButtonText: "확인",
		}).then((result) => {
			
		});
	}
});
</script>

