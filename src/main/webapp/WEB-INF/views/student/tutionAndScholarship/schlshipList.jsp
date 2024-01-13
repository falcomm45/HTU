<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.scholarship_box{width:100%; padding:40px; background-color:#ffffff;}
	.scholarship_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.scholarship_box .table_topic i{margin-left:10px;}
	.scholarship_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.scholarship_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.scholarship_box tr:first-child{background-color:#EEF1F6;}
	.scholarship_box tr:hover{background-color:#f2f3f4;}
	.scholarship_box tr td:nth-child(1){width:10%;}
	.scholarship_box tr td:nth-child(2){width:20%;}
	.scholarship_box tr td:nth-child(3){width:20%;}
	.scholarship_box tr td:nth-child(4){width:20%;}
	.scholarship_box tr td:nth-child(5){width:30%;}
	.schlsInfo {
		background-color: #fbfbfb;
		padding: 20px;
		height: 150px;
	    margin-bottom: 10px;
	    font-size: 14px;
	}
	.schlsInfo p {
		margin: 10px 0;
	}
</style>
<div class="scholarship_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/academicAdmin/recordList">학사행정</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/tuition/myTuition">등록/장학</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/schlship/mySchlship">장학금 조회</a></span>
	</div>
	<div class="table_topic">장학금 조회</div>
	<div class="schlsInfo">
		<p style="margin-bottom: 10px; margin-top:0; font-weight: bold; color: #0000d9;">※ 장학금 안내</p>
		<p>수석장학금 : 학과, 학년별 수석에게 수여되는 장학금으로 등록금의 100%를 지급</p>
		<p>성적우수장학금 : 학과, 학년별 석차 2, 3등에게 수여되는 장학금으로 등록금의 50%를 지급</p>
		<p>교수추천장학금 : 학과 교수에게 추천받은 학생에게 수여되는 장학금으로 등록금의 50%를 지급</p>
		<p style="font-weight: bold;">장학금 수여 시 등록금에서 자동 감면됩니다.</p>
	</div>
	<table id="schlTbl">
		<tr class="table_title">
			<th>no</th>
			<th>장학년도</th>
			<th>학기</th>
			<th>장학구분</th>
			<th>장학금(원)</th>
		</tr>
		<c:forEach var="schlVO" items="${schlshipVOList}" varStatus="stat">
			<tr>
				<td>${stat.count}</td>
				<td>${schlVO.sclYear}</td>
				<td>${schlVO.sclSem}학기</td>
				<td>${schlVO.sclNm}</td>
				<c:if test="${schlVO.siCd eq 'SCHL01'}">
					<td><fmt:formatNumber value="${schlVO.depFee}" type="number"></fmt:formatNumber></td>
				</c:if>
				<c:if test="${schlVO.siCd eq 'SCHL02'}">
					<td><fmt:formatNumber value="${schlVO.depFee * 0.5}" type="number"></fmt:formatNumber></td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</div>
