<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.crew_box{width:100%; height:calc(100% - 40px); overflow-y:hidden; padding:40px; background-color:#ffffff; z-index:999; position:relative; margin-top:5px;}
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
	.lecture_menu a{border:1px solid #eeeeee;background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; border:1px solid #ffffff;}
</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div class="lecture_menu" style="display:flex;">
	<a href="/student/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a" style="font-weight: bold;">홈</a>
	<a href="/student/lecture/syllabus?lecCd=${param.lecCd}" class="sub_menu_a">강의계획서</a>
	<a href="/student/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a" style="font-weight: bold;">공지사항</a>
	<a href="/student/task/list?lecCd=${param.lecCd}" class="sub_menu_a effect" style="font-weight: bold;">과제</a>
	<a href="/student/test/testList?lecCd=${param.lecCd}" class="sub_menu_a" style="font-weight: bold;">시험</a>
	<a href="/student/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a" style="font-weight: bold;">자료실</a>
	<a href="" class="sub_menu_a" style="color: transparent; pointer-events: none;">-</a>
</div>
<div class="crew_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/lecture/list">내 강의실</a></span>
<!-- 	<span style="font-size:12px; color:#888888;">></span> -->
<!-- 	<span style="font-size:12px; color:#888888;"><a href="">자바 스프링</a></span> -->
	<span style="font-size:12px; color:#888888;">></span>
	<span id="lecNm" style="font-size:12px; color:#888888;"></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="">과제</a></span>
	</div>
	<div class="table_topic">과제&nbsp;<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	<div class="crewList">
		<div class="appList">
			<p>&nbsp;&nbsp;과제</p>
		</div>
		<div class="crTb">
			<table>
				<tr class="table_title">
					<td>no</td>
					<td>제목</td>
					<td>작성자</td>
					<td>등록일</td>
					<td>마감일</td>
					<td>제출여부</td>
				</tr>
				<c:forEach var="taskVO" items="${taskVOList}" varStatus="stat">
				<c:if test="${taskVO.lecCd eq param.lecCd}">
					<tr>
						<td>${stat.count}</td>
						<td style="text-align: left;"><a href="/student/task/detail?taskCd=${taskVO.taskCd}&lecCd=${param.lecCd}">${taskVO.taskNm}</a></td>
						<td>${taskVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
						<td><fmt:formatDate value="${taskVO.taskReg}" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${taskVO.taskEddt}" pattern="yyyy-MM-dd" /></td>
						<c:if test="${submitCounts[taskVO.taskCd] == 0}"><td>미제출</td></c:if>
						<c:if test="${submitCounts[taskVO.taskCd] != 0}"><td>제출완료</td></c:if>
					</tr>
				</c:if>
				</c:forEach>
			</table>
			<input type="hidden" id="lecCD" name="lecCd" value="${param.lecCd}" />
		</div>
	</div>
	</br>
	</br>
	</br>
	<div class="newCrewList">
		<div class="newCrewHeader">&nbsp;&nbsp;마감일 지난 과제</div>
			<div class="newCrewTableWrqp">
				<table>
					<tr class="table_title">
							<td>no</td>
							<td>제목</td>
							<td>작성자</td>
							<td>등록일</td>
							<td>마감일</td>
							<td>제출여부</td>
							<td>점수</td>
					</tr>
		<c:choose>
			<c:when test="${!empty edTaskVOList}">
		
						<c:forEach var="edTaskVO" items="${edTaskVOList}" varStatus="stat">
						<c:if test="${edTaskVO.lecCd eq param.lecCd}">
							<tr>
								<td>${stat.count}</td>
								<td style="text-align: left;"><a href="/student/task/detail?taskCd=${edTaskVO.taskCd}&lecCd=${param.lecCd}">${edTaskVO.taskNm}</a></td>
								<td>${edTaskVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
								<td><fmt:formatDate value="${edTaskVO.taskReg}" pattern="yyyy-MM-dd" /></td>
								<td><fmt:formatDate value="${edTaskVO.taskEddt}" pattern="yyyy-MM-dd" /></td>
								<c:if test="${endSubmitCounts[edTaskVO.taskCd] == 0}"><td>미제출</td></c:if>
								<c:if test="${endSubmitCounts[edTaskVO.taskCd] != 0}"><td>제출완료</td></c:if>
								<c:if test="${endSubmitCounts[edTaskVO.taskCd] == 0}"><td>0&nbsp;/&nbsp;100</td></c:if>
								<c:if test="${endSubmitCounts[edTaskVO.taskCd] != 0 and endSubmitScores[edTaskVO.taskCd] == 0}"><td>채점미완료</td></c:if>
								<c:if test="${endSubmitCounts[edTaskVO.taskCd] != 0 and endSubmitScores[edTaskVO.taskCd] != 0}"><td>${endSubmitScores[edTaskVO.taskCd]}&nbsp;/&nbsp;100</td></c:if>
				        	</tr>
				        </c:if>
						</c:forEach>
				
			</c:when>
			<c:otherwise>
				<tr>
					<td colspan="7"><div style="color: #333333; font-size: 14px;">마감일이 지난 과제가 없습니다.</div></td>
				</tr>
			</c:otherwise>
		</c:choose>
			</table>
			</div>
	</div>
	
</div>

<script type="text/javascript">
$(function(){
	$("#lecNm").text($(".lectureName").text());
});
</script>