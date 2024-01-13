<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<script src="/resources/js/jquery.min.js"></script>

<style>
	.crew_box{width:100%; padding:40px; background-color:#ffffff;height: 100%}
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
	
	.lecture_menu{height:30px; align-items:center;}
	.lecture_menu a{border:1px solid #ebebeb; box-sizing:border-bos; background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; box-sizing: border-box; border:1px solid #ffffff;}
	.btn-reg:hover{color:#ffffff;}
</style>
<div style="display:flex; margin-top: -16px;" class="lecture_menu">
	<a href="/professor/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a ">홈</a>
	<a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a ">공지사항</a>
    <a href="/professor/task/list?lecCd=${param.lecCd}" class="sub_menu_a effect">과제</a>
    <a href="/professor/test/testList?lecCd=${param.lecCd}" class="sub_menu_a">시험</a>
    <a href="/professor/lectureAttendance?lecCd=${param.lecCd}" class="sub_menu_a">출결관리</a>
    <a href="/professor/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
    <a href="/professor/objection/list?lecCd=${param.lecCd}" class="sub_menu_a">성적이의신청</a>
</div>
<div class="crew_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/list" style="font-size:12px; color:#888888;">강의실</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/detail?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;" id="lecNm"></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/task/list?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">과제</a></span>
	</div>
	<div class="table_topic" style="display: flex; align-items:center;">
		<div style="flex: 1;">과제&nbsp;<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	</div>
	
	<div class="crewList">
		<div class="appList">
			<p>현재 진행중인 과제</p>
		</div>
		<div class="crTb">
		<div style="position:relative;"><a href="/professor/task/create?lecCd=${param.lecCd}" class="btn-reg bur" style="position:absolute; top:-40px; right:0;">등록</a></div>
			<table>
				<tr class="table_title">
					<td>no</td>
					<td>제목</td>
					<td>작성자</td>
					<td>등록일</td>
					<td>마감일</td>
					<td>제출인원</td>
				</tr>
				<c:forEach var="taskVO" items="${taskVOList}" varStatus="stat">
				<c:if test="${taskVO.lecCd eq param.lecCd}">
<%-- 					<c:forEach var="taskSubmitVO" items="${taskVO.taskSubmitList}" varStatus="submitStat"> --%>
<%--           		   		<c:set var="tsubCd" value="${taskSubmitVO.tsubCd}" /> --%>
<%--        				</c:forEach> --%>
					<tr>
						<td>${stat.count}</td>
						<td style="text-align: left;"><a href="/professor/task/detail?taskCd=${taskVO.taskCd}&lecCd=${param.lecCd}">${taskVO.taskNm}</a></td>
						<td>${taskVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
						<td><fmt:formatDate value="${taskVO.taskReg}" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${taskVO.taskEddt}" pattern="yyyy-MM-dd" /></td>
						<td>${submitCounts[taskVO.taskCd]}</td>
					</tr>
				</c:if>
				</c:forEach>
			</table>
			<input type="hidden" id="lecCD" name="lecCd" value="${param.lecCd}" />
		</div>
	</div>
	<div class="newCrewList" style="margin-top:30px;">
		<div class="newCrewHeader">마감일 지난 과제</div>
		<div class="newCrewTableWrqp">
			<table>
				<tr class="table_title">
					<td>no</td>
					<td>제목</td>
					<td>작성자</td>
					<td>등록일</td>
					<td>마감일</td>
					<td>제출인원</td>
				</tr>
		<c:choose>
			<c:when test="${!empty edTaskVOList}">
						<c:forEach var="edTaskVO" items="${edTaskVOList}" varStatus="stat">
						<c:if test="${edTaskVO.lecCd eq param.lecCd}">
							<tr>
								<td>${stat.count}</td>
								<td style="text-align: left;"><a href="/professor/task/detail?taskCd=${edTaskVO.taskCd}&lecCd=${param.lecCd}">${edTaskVO.taskNm}</a></td>
								<td>${edTaskVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
								<td><fmt:formatDate value="${edTaskVO.taskReg}" pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${edTaskVO.taskEddt}" pattern="yyyy-MM-dd" /></td>
								<td>${endSubmitCounts[edTaskVO.taskCd]}</td>
				        	</tr>
				        </c:if>
						</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="7"><div style="color: #333333; font-size: 14px;">과제내역이 없습니다.</div></td>
				</tr>
			</c:otherwise>
		</c:choose>
		</table>
				</div>
	</div>
</div>
<!--  -->
			<div class="counsel_form_title" style="margin-bottom:0; margin-top:20px; position:absolute; right:30px; bottom:30px;">
			<div style="display:flex;">
				
			</div>
		</div>

<script type="text/javascript">
const taskUpdate = '${taskUpdate}';
const taskCreate = '${taskCreate}';
const taskDelete = '${taskDelete}';
$(function(){
	
	$("#lecNm").text($(".lectureName").text());
	
	if (taskUpdate == 1) {
		alertSuccess('과제 수정이 완료되었습니다.');
	}
	if (taskCreate == 1) {
		alertSuccess('과제 등록이 완료되었습니다.');
	}
	if (taskDelete == 1) {
		alertSuccess('과제 삭제가 완료되었습니다.');
	}
});
</script>