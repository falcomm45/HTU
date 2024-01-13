<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
	.crew_box{width:100%; height:100%; overflow-y:scroll; padding:40px; background-color:#ffffff;}
	.crew_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.crew_box .table_topic i{margin-left:10px;}
	.crew_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.crew_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.crew_box tr:first-child{background-color:#EEF1F6;}
	.crew_box tr:hover{background-color:#f2f3f4;}
	.crew_box tr td:nth-child(1){width:5%;}
	.crew_box tr td:nth-child(2){width:20%;}
	.crew_box tr td:nth-child(3){width:20%;}
	.crew_box tr td:nth-child(4){width:20%;}
	.crew_box tr td:nth-child(5){width:5%;}
	.crew_box tr td:nth-child(6){width:20%;}
	.crew_box tr td:nth-child(7){width:10%;}
/* ------------------------------------------------------------------ */
	.crewSearchForm {
      background-color: #ffffff;
      border: 1px solid #ddd;
      border-radius: 100px;
      position: absolute;
      top: 130px;
      right: 80px;
      padding: 5px 15px 5px 15px;
	}
	.crewSearch {
      outline: none;
      font-size: 15px;
	}
	.crewSearchBtn {
      width: 15px;
      height: 15px;
      border: 0;
	}
	.crewTotal {font-size: 14px; margin-bottom: 10px;}
</style>
<div class="crew_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></a></svg></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/lectureapproval/list">결재</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/crew/crewList">동아리관리</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/crew/crewList">동아리목록</a></span>
	</div>
	<div class="table_topic">동아리목록</div>
	<div class="crewSearchForm">
		<form>
			<input class="crewSearch" type="text" placeholder="검색" name="keyword"
				value="${keyword}" />
			<input type="image" src="/resources/images/free-icon-search-149852.png" name="submit" class="crewSearchBtn" value="검색" />
		</form>
	</div>
	
	<div class="crewTotal">
		<span>총 </span><span style="color: #0000d9">${total}</span><span>개 중 </span><span style="color: #0000d9">${totalAct}</span><span>개 운영</span>
	</div>	
	<table id="crewTbl">
		<tr class="table_title">
			<td>no</td>
			<th>동아리명</th>
			<th>동아리소개</th>
			<th>동아리장</th>
			<th>인원</th>
			<th>동아리실</th>
			<th>운영상태</th>
		</tr>
		<c:forEach var="crewVO" items="${crewVOList}" varStatus="stat">
			<tr>
				<td>${stat.count}</td>
				<td>
					<a href="/employee/crew/crewDetail?crCd=${crewVO.crCd}">${crewVO.crNm}</a>
				</td>
				<td>${crewVO.crCon}</td>
				<td>${crewVO.ldrNm}</td>
				<td>${crewVO.crPs}</td>
				<td>학생회관 ${crewVO.roomNm}</td>
				<c:if test="${crewVO.crYn eq 0}">
					<td>운영</td>
				</c:if>
				<c:if test="${crewVO.crYn eq 1}">
					<td>폐쇄</td>
				</c:if>
			</tr>
		</c:forEach>
		
	</table>
</div>
