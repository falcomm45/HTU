<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- <style> -->
<!-- /*  .content{background-color:#ffffff;} */ -->
<!-- /*  .table_topic{font-size: 20px; padding-bottom:30px;} */ -->
<!-- /*  .prifile_wrap tr{display: table-row;} */ -->
<!-- /*  .profile_wrap th{width:170px; padding:20px; font-size:14px;} */ -->
<!-- /*  .profile_wrap td{padding:10px;} */ -->
<!-- /*  .profile_photo{width:100px!important; height:100px!important; border:1px solid #888888;} */ -->
<!-- </style> -->

<style>
	.crewDetail {width: 100%; height: 100%; background-color:#ffffff;  z-index:999; position:relative; margin-top:5px;}
	.crewIndex {width: 100%; height: 100%;}
	.crewIndex a{color:#333333!important; text-decoration:none!important;}
	.crewIndex a:hover{color:#333333!important; text-decoration:none!important;}
	.crewHeader {font-size: 20px; padding-bottom: 30px; position: relative;}
	#appBtn, #btnQuit, #btnApply {position: absolute; right: 10px; bottom: 10px;}
	#appBtn:hover{background-color: #003866;}
	#btnQuit:hover{background-color: #818181;}
	#btnApply:hover{background-color: #237e55;}
	.crewDivbox {width: 100%; display: inline-flex;height: 40%; margin-bottom: 10px;}
	.crewDiv1 {width: 40%; margin-right: 10px;}
	.crewDiv2 {width: 60%;}
	.crewInfo {border-radius : 5px; position: relative; height: 100%; padding: 40px; 
		margin-bottom: 10px; background-color: #ffffff;}
	.crewInfoTbl {width: 100%; height: 70%; font-size: 14px;}
	.crewInfoHeader {font-size: 18px; padding-bottom: 20px;}
	.crewInfoTbl-title {padding-right: 5px; font-weight: bold;}
	.crewInfoTbl a{border: 1px solid #eaeaea; border-radius: 5px; font-size: 14px; padding: 5px;}
	.crewInfoTbl tr:last-child{padding: 300px;}
	.crewModBtn {position: absolute; width: 20px; height: 20px; right: 13px; bottom: 13px;}
	.crewManage {border-radius : 5px; padding: 15px 13px; background-color: #ffffff; 
		overflow: auto;}
/* ---------------------------------------------------------------------------- */
	.crew_box{width:60%; padding:40px; background-color:#ffffff; border-radius: 5px;}
	.crew_box .table_topic{font-size: 18px; padding-bottom:20px;}
	.crew_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #d1d0d0; border-bottom:1px solid #d1d0d0; height:32px; line-height:32px;}
	.crew_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.crew_box tr:first-child{background-color:#EEF1F6;}
	.crew_box tr:hover{background-color:#f2f3f4;}
	.crew_box tr:first-child:hover{background-color:#EEF1F6;}
	.crew_box tr td:nth-child(1){width:10%;}
	.crew_box tr td:nth-child(2){width:30%;}
	.crew_box tr td:nth-child(3){width:40%;}
	.crew_box tr td:nth-child(4){width:20%;}
	
	.crew_form{border:1px solid #d1d0d0; padding:30px; width:80%; border-radius:5px; position:relative;}
	.crew_form_title{display:flex; flex-direction:column; margin-bottom:20px;}
	.crew_form_title p{width:120px; font-size:16px; margin-bottom:10px;}
	.crew_form_title select, .crew_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
	.crew_margin_left{margin-left:5px;}
	.crew_form a:hover{color:#ffffff!important;}
/* ---------------------------------------------------------------------------- */
	.crewPerson {border-radius : 5px; height: 100%; padding: 15px 25px; margin-bottom: 10px;
		background-color: #ffffff;}
	.crTb{height: 80%; overflow: auto;}
	.crewPersonTbl {width: 100%; text-align: center; border-spacing: 30px; line-height: 3rem;}
	.crewPerson-tr {border-bottom: 1px solid #eaeaea; padding: 30px 0;}
	.crewPersonTbl tr:last-child {border:none;}
	.crewPersonTbl th {position: sticky; top: 0px; background-color : #eaeaea;}
	.crewfiles {display: inline-flex; width: 400px; justify-content: center;}
	.crewfiles img {display: block; padding: 0 5px; width: 1000px; height: 700px;}
	#crewActBtn {font-size: 24px; padding-top: 30px; float: right;}
	.crewActivityHeader {font-size: 18px;  padding-top: 15px; padding-left: 10px;}
	.crewAct {width: 100%;  border-bottom: 1px solid #ebebeb; padding: 20px; overflow: auto;}
	.actStuNm {font-size: 18px; font-weight: bold;}
	.crewAct p {padding: 10px 0;}
	#craAddBtn {float: right; padding-right: 30px;}
	ul.tabs{margin: 0px; padding: 0px; list-style: none;}
	ul.tabs li{border-radius: 5px 5px 0 0; background: #eaeaea; color: #222;
		display: inline-block; padding: 10px 15px; cursor: pointer;}
	ul.tabs li.current{border-radius: 5px 5px 0 0; background: #ffffff; color: #222;}
	.tab-content{display: none; background: #ffffff; padding: 15px; border-radius: 5px;}
	.tab-content.current{display: inherit;}
	ul.tabs li:hover {background-color: #ced1d7;}
	.lecture_menu{height:30px; align-items:center;}
	.lecture_menu a{border:1px solid #eeeeee;background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; border:1px solid #ffffff;}
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div class="lecture_menu" style="display:flex;">
	<a href="/student/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a effect ">홈</a>
	<a href="/student/lecture/syllabus?lecCd=${param.lecCd}" class="sub_menu_a">강의계획서</a>
	<a href="/student/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a">공지사항</a>
	<a href="/student/task/list?lecCd=${param.lecCd}" class="sub_menu_a ">과제</a>
	<a href="/student/test/testList?lecCd=${param.lecCd}" class="sub_menu_a">시험</a>
	<a href="/student/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
	<a href="" class="sub_menu_a" style="color: transparent; pointer-events: none;">-</a>
</div>
<div class="crewDetail">
<input type="hidden" id="lecCd" name="lecCd" value="${lectureVO.lecCd}" />
	<div class="crewIndex">
		<div class="crewDivbox">
			<div class="crewDiv1" style="border:1px solid #ebebeb;">
				<div class="crewInfo">
					<div class="crewInfoHeader">
						<p style="font-size:25px; font-weight:600;">${lectureVO.lectureApplyVO.lecaNm}</p>
						<input type="hidden" id="lecNM" value="${lectureVO.lectureApplyVO.lecaNm}"/>
					</div>
					<table class="crewInfoTbl">
						<tr>
							<td class="crewInfoTbl-title">교수명</td>
							<td>${lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">강의구분</td>
							<c:if test="${lectureVO.lectureApplyVO.lecaType == 0}"><td>전공필수</td></c:if>
							<c:if test="${lectureVO.lectureApplyVO.lecaType == 1}"><td>전공선택</td></c:if>
							<c:if test="${lectureVO.lectureApplyVO.lecaType == 2}"><td>교양필수</td></c:if>
							<c:if test="${lectureVO.lectureApplyVO.lecaType == 3}"><td>교양선택</td></c:if>
							<td></td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">전공</td>
							<td>${lectureVO.lectureApplyVO.departmentVO.depNm}</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">년도&nbsp;/&nbsp;학기</td>
							<td>${lectureVO.lectureApplyVO.lecaYear}년&nbsp;${lectureVO.lectureApplyVO.lecaSem}학기</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">학년</td>
							<td>${lectureVO.lectureApplyVO.lecaTrg}</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">수강인원</td>
							<td>${lectureVO.lecHcnt}</td>
						</tr>
					</table>
<%-- 					<c:if test="${crewVO.crLeader eq userVO.userCd}"> --%>
<!-- 						<div> -->
<%-- 							<a href="/student/crew/crewUpdate?crCd=${crewVO.crCd}"> --%>
<!-- 								<img class="crewModBtn" src="/resources/images/gear.png" alt="crewManage" /> -->
<!-- 							</a> -->
<!-- 						</div> -->
<%-- 					</c:if> --%>
				</div>
			</div>
			<div class="crew_box" style="border:1px solid #ebebeb; border-radius:0px;">
				<div class="table_topic">수강중인학생</div>
				<div class="crTb">
					<table>
						<tr class="table_title">
							<th>no</th>
							<th>학번</th>
							<th>이름</th>
							<th>학과</th>
						</tr>
						<!-- 수강중인학생 구해서 넣어주기  -->
						<c:forEach var="enrolmentVo" items="${enrolmentList}" varStatus="stat">
							<tr>
								<td>${stat.count}</td>
								<td>${enrolmentVo.studentVO.stuCd}</td>
								<td>${enrolmentVo.studentVO.userVO.userNm}</td>
								<td>${enrolmentVo.studentVO.departmentVO.depNm}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
<%-- 			${weekplanVOList}@@@@@ --%>
		<div class="crewContent">
			<div class="crewContentTab">
				<ul class="tabs">
				</ul>
				<div id="tab-1" class="tab-content current" >
					<div class="crewActivity">
						<div class="crewActivityHeader">
							주차별 계획
						</div>
						<c:forEach var="weekplanVO" items="${weekplanVOList}"> 
							<div class="crewAct">
								<c:choose>
									<c:when test="${not empty weekplanVO}">
										<p style="font-weight: bold;"><a type="button" class="weekUpdate"><span>${weekplanVO.wpNo}</span>주차</a>
										</p>	
									</c:when>
									<c:otherwise>
										<p style="font-weight: bold;">등록된 주차별 계획이 없습니다</p>
									</c:otherwise>
								</c:choose>
								<p class="conP">${weekplanVO.wpCon}</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
logout = function() {
	$("#logoutForm").submit();
}
	

</script>







