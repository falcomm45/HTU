<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<script src="/resources/js/jquery.min.js"></script>
<style>
	.crew_box{width:100%; height:100%; overflow-y:scroll; padding:40px; background-color:#ffffff;}
	.crew_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.crew_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.crew_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.crew_box tr:first-child{background-color:#EEF1F6;}
	.crew_box tr:hover{background-color:#f2f3f4;}
	.crew_box tr:first-child:hover{background-color:#EEF1F6;}
	.crew_box tr td:nth-child(1){width:5%;}
	.crew_box tr td:nth-child(2){width:15%;}
	.crew_box tr td:nth-child(3){width:20%;}
	.crew_box tr td:nth-child(4){width:15%;}
	.crew_box tr td:nth-child(5){width:15%;}
	.crew_box tr td:nth-child(6){width:10%;}
	.crew_box tr td:nth-child(7){width:20%;}
	.newCrewHeader, .appList{font-size: 16px; padding-bottom:10px;}
	
	.crew_form{border:1px solid #d1d0d0; padding:30px; width:80%; border-radius:5px; position:relative;}
	.crew_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
	.crew_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
	.crew_form_title select, .crew_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
	.crew_margin_left{margin-left:5px;}
	.crew_form a:hover{color:#ffffff!important;}

	.newCrewList {height: 50%; margin-bottom: 30px;}
	.crewList {height: 50%;}
</style>
<div class="crew_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
			<span><a href="/employee/mypage">
			<svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg>
			</a></span>
			<span style="font-size:12px; color:#888888;">></span>
			<span style="font-size:12px; color:#888888;"><a href="/employee/lectureapproval/list">결재</a></span>
			<span style="font-size:12px; color:#888888;">></span>
			<span style="font-size:12px; color:#888888;"><a href="/employee/lectureapproval/list">강의결재</a></span>
			<span style="font-size:12px; color:#888888;">></span>
			<span style="font-size:12px; color:#888888;"><a href="/employee/lectureapproval/list">강의계획서 제출목록</a></span>
	</div>
	<div class="table_topic">강의계획서 제출목록
	</div>
	<div class="newCrewList">
		<div class="newCrewHeader">미확인 신청</div>
			<div class="newCrewTableWrqp">
			<table>
				<tr class="table_title">
						<td>no</td>
						<td>강의명</td>
						<td>신청인</td>
						<td>신청일</td>
				</tr>
		<c:choose>
			<c:when test="${!empty lectureApplyVOStandbyList}">
						<c:forEach var="lectureAppVO" items="${lectureApplyVOStandbyList}" varStatus="stat">
							<tr>
							<td>${stat.count}</td>
							<td style="text-align: left;text-overflow: ellipsis;"><a href="/employee/lectureapprovla/detail?lecaCd=${lectureAppVO.lecaCd}">${lectureAppVO.lecaNm}</a></td>
							<td>${lectureAppVO.professorVO.userVO.userNm}</td>
							<td><fmt:formatDate value="${lectureAppVO.approvalVO.appReg}"  pattern="yyyy-MM-dd" /></td>
				        	</tr>
						</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="7"><div style="color: #333333; font-size: 14px;">미확인 신청내역이 없습니다.</div></td>
				</tr>
			</c:otherwise>
		</c:choose>
					</table>
				</div>
	</div>
	<div class="crewList">
		<div class="appList">
			<p>결재 내역</p>
		</div>
		<div class="crTb">
			<table>
				<tr class="table_title">
					<td>no</td>
					<td>강의명</td>
					<td>신청인</td>
					<td>신청일</td>
					<td>처리일</td>
					<td>승인여부</td>
					<td>비고</td>
				</tr>
				<c:forEach var="lectureApplyVO" items="${lectureApplyVOList}" varStatus="stat">
					<c:if test="${lectureApplyVO.approvalVO.appYn eq 1}">
						<tr>
							<td>${stat.count}</td>
							<td style="text-align: left;text-overflow: ellipsis;"><a href="/employee/lectureapprovla/detail?lecaCd=${lectureApplyVO.lecaCd}">${lectureApplyVO.lecaNm}</a></td>
							<td>${lectureApplyVO.professorVO.userVO.userNm}</td>
							<td><fmt:formatDate value="${lectureApplyVO.approvalVO.appReg}" pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${lectureApplyVO.approvalVO.appProdt}" pattern="yyyy-MM-dd" /></td>
							<td><button class="btn-two mini sky" id="btnStandby" style="text-align: center;">승인</button></td>
							<td></td>
			        	</tr>
			        </c:if>
					<c:if test="${lectureApplyVO.approvalVO.appYn eq 2}">
						<tr class="crewTable-tr">
							<td>${stat.count}</td>
							<td style="text-align: left;text-overflow: ellipsis;"><a href="/employee/lectureapprovla/detail?lecaCd=${lectureApplyVO.lecaCd}">${lectureApplyVO.lecaNm}</a></td>
							<td>${lectureApplyVO.professorVO.userVO.userNm}</td>
							<td><fmt:formatDate value="${lectureApplyVO.approvalVO.appReg}" pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${lectureApplyVO.approvalVO.appProdt}" pattern="yyyy-MM-dd" /></td>
							<td><button class="btn-two mini orange" id="btnStandby" style="text-align: center;">반려</button></td>
							<td><button class="btn-two gray mini btnCompanion"  data-app-ret="${lectureApplyVO.approvalVO.appRet}" style="margin-left:2px;">반려사유</button></td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<input type="hidden" id="lecCD" name="lecCd" value="${param.lecCd}" />
		</div>
	</div>
</div>

<!-- <div class="crew_box"> -->
<!-- 	<div style="font-size:12px; color:#888888; margin-bottom: 20px;"> -->
<!-- 			<span><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></span> -->
<!-- 			<span style="font-size:12px; color:#888888;">></span> -->
<!-- 			<span style="font-size:12px; color:#888888;">결재</span> -->
<!-- 			<span style="font-size:12px; color:#888888;">></span> -->
<!-- 			<span style="font-size:12px; color:#888888;">강의 개설 승인</span> -->
<!-- 		</div> -->
<!-- 	<div class="table_topic">강의 개설 승인</div> -->
<!-- 	<div class="newCrewList"> -->
<!-- 		<div class="newCrewHeader">미확인 신청</div> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${!empty lectureApplyVOStandbyList}"> --%>
<!-- 				<div class="newCrewTableWrqp"> -->
<!-- 					<table> -->
<!-- 						<tr class="table_title"> -->
<!-- 							<th style="width: 5%;">NO</th> -->
<!-- 							<th style="width: 15%;">강의명</th> -->
<!-- 							<th style="width: 20%;">신청인</th> -->
<!-- 							<th style="width: 20%;">신청일</th> -->
<!-- 							<th style="width: 15%;">승인여부</th> -->
<!-- 						</tr> -->
<%-- 						<c:forEach var="lectureAppVO" items="${lectureApplyVOStandbyList}" varStatus="stat"> --%>
<!-- 							<tr> -->
<%-- 								<td>${stat.count}</td> --%>
<%-- 								<td style="text-align: left;"><a href="/employee/lectureapprovla/detail?lecaCd= ${lectureAppVO.lecaCd}">${lectureAppVO.lecaNm}</a></td> --%>
<%-- 								<td>${lectureAppVO.professorVO.userVO.userNm}</td> --%>
<%-- 								<td><fmt:formatDate value="${lectureAppVO.approvalVO.appReg}"  pattern="yyyy-MM-dd" /></td> --%>
<!-- 								<td>결재대기</td> -->
<!-- 				        	</tr> -->
<%-- 						</c:forEach> --%>
<!-- 					</table> -->
<!-- 				</div> -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<!-- 				<div style="text-align: center; padding-top: 75px; color: #333333; font-size: 14px;">미승인 신청 내역이 없습니다.</div> -->
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
<!-- 	</div> -->
<!-- 	<div class="crewList"> -->
<!-- 		<div class="appList"> -->
<!-- 			<p>승인 내역</p> -->
<!-- 		</div> -->
<!-- 		<div class="crTb"> -->
<!-- 			<table> -->
<!-- 				<tr class="table_title"> -->
<!-- 					<th>NO</th> -->
<!-- 					<th>강의명</th> -->
<!-- 					<th>신청인</th> -->
<!-- 					<th>신청일</th> -->
<!-- 					<th>처리일</th> -->
<!-- 					<th>승인여부</th> -->
<!-- 					<th>비고</th> -->
<!-- 				</tr> -->
<%-- 				<c:forEach var="lectureApplyVO" items="${lectureApplyVOList}" varStatus="stat"> --%>
<%-- 					<c:if test="${lectureApplyVO.approvalVO.appYn eq 1}"> --%>
<!-- 						<tr> -->
<%-- 							<td>${stat.count}</td> --%>
<%-- 							<td style="text-align: left;"><a href="/employee/lectureapprovla/detail?lecaCd=${lectureApplyVO.lecaCd}">${lectureApplyVO.lecaNm}</a></td> --%>
<%-- 							<td>${lectureApplyVO.professorVO.userVO.userNm}</td> --%>
<%-- 							<td><fmt:formatDate value="${lectureApplyVO.approvalVO.appReg}" pattern="yyyy-MM-dd" /></td> --%>
<%-- 							<td><fmt:formatDate value="${lectureApplyVO.approvalVO.appProdt}" pattern="yyyy-MM-dd" /></td> --%>
<!-- 							<td>승인</td> -->
<!-- 							<td></td> -->
<!-- 			        	</tr> -->
<%-- 			        </c:if> --%>
<%-- 					<c:if test="${lectureApplyVO.approvalVO.appYn eq 2}"> --%>
<!-- 						<tr class="crewTable-tr"> -->
<%-- 							<td>${stat.count}</td> --%>
<%-- 							<td style="text-align: left;"><a href="/employee/lectureapprovla/detail?lecaCd=${lectureApplyVO.lecaCd}">${lectureApplyVO.lecaNm}</a></td> --%>
<%-- 							<td>${lectureApplyVO.professorVO.userVO.userNm}</td> --%>
<%-- 							<td><fmt:formatDate value="${lectureApplyVO.approvalVO.appReg}" pattern="yyyy-MM-dd" /></td> --%>
<%-- 							<td><fmt:formatDate value="${lectureApplyVO.approvalVO.appProdt}" pattern="yyyy-MM-dd" /></td> --%>
<!-- 							<td>반려</td> -->
<%-- 							<td>${lectureApplyVO.approvalVO.appRet}</td> --%>
<!-- 						</tr> -->
<%-- 					</c:if> --%>
<%-- 				</c:forEach> --%>
				
<!-- 			</table> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->


<script type="text/javascript">
const appLec = '${appLec}';
$(function(){
	if (appLec == 1) {
		alertSuccess('결재완료');
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

