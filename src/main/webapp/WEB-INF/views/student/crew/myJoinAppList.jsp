<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.crew_box{width:100%; padding:40px; background-color:#ffffff; height:100%;}
	.crew_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.crew_box .table_topic i{margin-left:10px;}
	.crew_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.crew_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.crew_box tr:first-child{background-color:#EEF1F6;}
	.crew_box tr:hover{background-color:#f2f3f4;}
	.crew_box tr:first-child:hover{background-color:#EEF1F6;}
	.crew_box tr td:nth-child(1){width:10%;}
	.crew_box tr td:nth-child(2){width:25%;}
	.crew_box tr td:nth-child(3){width:25%;}
	.crew_box tr td:nth-child(4){width:20%;}
	.crew_box tr td:nth-child(5){width:20%;}
</style>
<div class="crew_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/crew/crewList">동아리</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/crew/myJoinAppList">가입신청내역</a></span>
	</div>
	<div class="table_topic">가입신청내역<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>

	<table>
		<tr class="table_title">
			<th>no</th>
			<th>동아리명</th>
			<th>신청 날짜</th>
			<th>승인 여부</th>
			<th>비고</th>
		</tr>
		<c:forEach var="crewVO" items="${crewVOList}" varStatus="stat">
			<tr>
				<td>${stat.count}</td>
				<td>${crewVO.crNm}</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd" value="${crewVO.approvalVO.appReg}"></fmt:formatDate></td>
				<c:choose>
					<c:when test="${crewVO.approvalVO.appYn eq 0}">
						<td>승인대기</td>
						<td></td>
					</c:when>
					<c:when test="${crewVO.approvalVO.appYn eq 1}">
						<td>승인</td>
						<td></td>
					</c:when>
					<c:when test="${crewVO.approvalVO.appYn eq 2}">
						<td>반려</td>
						<td>
							<button class="btn-two gray mini btnCompanion" data-app-ret="${crewVO.approvalVO.appRet}">반려사유</button>
						</td>
					</c:when>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
</div>
<script type="text/javascript">
$(".btnCompanion").on("click", function() {
	const appRet = $(this).data("appRet");
	console.log("appRet : ", appRet);
	alertInfo(appRet);
})

function alertInfo(appRet) {
	appRet = appRet.slice(0,30) + "<br>" + appRet.slice(30);
	Swal.fire({
		html: '<i class="fa-solid fa-circle-info" style="color: #333333;"></i>  반려사유 : ' + appRet,
		width: 600,
		padding: 30,
		position: "center",
		confirmButtonColor: "#333333",
		confirmButtonText: "확인",
	});
}
</script>