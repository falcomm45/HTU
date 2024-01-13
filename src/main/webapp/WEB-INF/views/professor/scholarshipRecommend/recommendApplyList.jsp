<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.scholarship_box{width:100%; height:100%; padding:40px; background-color:#ffffff;}
	.scholarship_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.scholarship_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.scholarship_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.scholarship_box tr:first-child{background-color:#EEF1F6;}
	.scholarship_box tr:hover{background-color:#f2f3f4;}
	.scholarship_box tr:first-child:hover{background-color:#EEF1F6;}
	.scholarship_box tr td:nth-child(1){width:5%;}
	.scholarship_box tr td:nth-child(2){width:15%;}
	.scholarship_box tr td:nth-child(3){width:20%;}
	.scholarship_box tr td:nth-child(4){width:15%;}
	.scholarship_box tr td:nth-child(5){width:15%;}
	.scholarship_box tr td:nth-child(6){width:10%;}
	.scholarship_box tr td:nth-child(7){width:20%;}
	.newScholarshipHeader, .appList{font-size: 16px; padding-bottom:10px;}
	
	.scholarship_form{border:1px solid #d1d0d0; padding:30px; width:80%; border-radius:5px; position:relative;}
	.scholarship_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
	.scholarship_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
	.scholarship_form_title select, .crew_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
	.scholarship_margin_left{margin-left:5px;}
	.scholarship_form a:hover{color:#ffffff!important;}

	.newScholarshipList {height: 50%; margin-bottom: 30px;}
	.scholarshipList {height: 50%;}
</style>
<sec:authentication property="principal.userVO" var="userVO"/>
<div class="scholarship_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/professor/scholarshipRecommend/list">장학관리</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/professor/scholarshipRecommend/recommendApplyList">추천내역</a></span>
	</div>
	<div class="table_topic">추천학생내역<i class="fa-solid fa-circle-info" style="color: #333333; position: absolute; left: 195px; top: 101px;" ></i></div>
	<div class="newCrewList">
	<div class="scholarshipList">
<%-- 		<p>${list}</p> --%>
		<div class="crTb">
			<table>
				<tr class="table_title">
					<th>no</th>
					<th>학생이름</th>
					<th>신청일</th>
					<th>신청연도</th>
					<th>신청학기</th>
					<th>처리일</th>
					<th>승인여부</th>
					<th>비고</th>
				</tr>
				<c:forEach var="scholarApplyVO" items="${list}" varStatus="stat">
					<input type="hidden" id="proCd" value="${userVO.userCd}" />
					<input type="hidden" class="scrCd" value="${scholarApplyVO.scrCd}" />
			        	<tr>
							<td style="width: 7%;">${stat.count}</td>
							<td style="width: 13%;">${scholarApplyVO.userVO.userNm}</td>
							<td style="width: 13%;"><fmt:formatDate pattern="yyyy-MM-dd" value="${scholarApplyVO.approvalVO.appReg}"></fmt:formatDate></td>
							<td style="width: 13%;">${scholarApplyVO.scrYear}</td>
							<td style="width: 13%;">${scholarApplyVO.scrSem}</td>
							<td style="width: 13%;"><fmt:formatDate pattern="yyyy-MM-dd" value="${scholarApplyVO.approvalVO.appProdt}"></fmt:formatDate></td>
					        <td style="width: 13%;">
					        	<c:if test="${scholarApplyVO.approvalVO.appYn eq 0}">
							 		대기
								</c:if>
								<c:if test="${scholarApplyVO.approvalVO.appYn eq 1}">
									승인
								</c:if>
								<c:if test="${scholarApplyVO.approvalVO.appYn eq 2}">
									반려
								</c:if>
							</td>
							<td style="width: 13%;">
							<c:if test="${scholarApplyVO.approvalVO.appYn eq 2}">
								<button class="btn-two gray mini btnCompanion" data-app-ret="${scholarApplyVO.approvalVO.appRet}">반려사유</button>
							</c:if>
							<c:if test="${scholarApplyVO.approvalVO.appYn eq 1 or scholarApplyVO.approvalVO.appYn eq 0}">
								-
							</c:if>
							</td>
			        	</tr>
				</c:forEach>
				
			</table>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	
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
});	
</script>	