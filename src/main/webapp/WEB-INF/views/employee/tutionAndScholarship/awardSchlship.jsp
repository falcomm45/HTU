<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.scholarship_box{width:100%; height:100%; overflow-y:scroll; padding:40px; background-color:#ffffff;}
	.scholarship_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.scholarship_box .table_topic i{margin-left:10px;}
	.scholarship_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.scholarship_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.scholarship_box tr:first-child{background-color:#EEF1F6;}
	.scholarship_box tr:hover{background-color:#f2f3f4;}
	.scholarship_box tr td:nth-child(1){width:5%;}
	.scholarship_box tr td:nth-child(2){width:10%;}
	.scholarship_box tr td:nth-child(3){width:15%;}
	.scholarship_box tr td:nth-child(4){width:10%;}
	.scholarship_box tr td:nth-child(5){width:10%;}
	.scholarship_box tr td:nth-child(6){width:10%;}
	.scholarship_box tr td:nth-child(7){width:10%;}
	.scholarship_box tr td:nth-child(8){width:10%;}
	.scholarship_box tr td:nth-child(9){width:10%;}
	.scholarship_box tr td:nth-child(10){width:10%;}
	.schlsInfo {
		background-color: #fbfbfb;
		padding: 20px;
		height: 105px;
	    margin-bottom: 10px;
	    font-size: 14px;
	}
	.schlsInfo p {
		margin: 10px 0;
	}
</style>
<div class="scholarship_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">등록/장학</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">장학</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/schlship/awardSchlship">장학금 수여</a></span>
	</div>
	<div class="table_topic">장학금 수여</div>
	<div class="schlsInfo">
		<p style="margin-bottom: 10px; margin-top:0; font-weight: bold; color: #0000d9;">※ 성적 장학금은 학과, 학년별 1등 - 3등에게 수여함</p>
		<p>1등 : 등록금의 100%</p>
		<p>2등 - 3등 : 등록금의 50%</p>
	</div>
	
	<div style="font-size: 14px; padding: 10px; font-weight: bold;">장학금 수여 대상 학생</div>
	<table>
		<tr class="table_title">
			<th>no</th>
			<th>단과대학</th>
			<th>학과</th>
			<th>학번</th>
			<th>학년</th>
			<th>이름</th>
			<th>성적</th>
			<th>석차</th>
			<th>장학금(원)</th>
			<th>수여상태</th>
		</tr>
		<c:forEach var="stuVO" items="${studentVOList}" varStatus="stat">
			<tr>
				<td>${stat.count}</td>
				<td>${stuVO.colNm}</td>
				<td>${stuVO.depNm}</td>
				<td>${stuVO.stuCd}</td>
				<td>${stuVO.stuYear}학년</td>
				<td>${stuVO.stuNm}</td>
				<td>${stuVO.score}</td>
				<td>${stuVO.rank}</td>
				<c:choose>
					<c:when test="${stuVO.rank eq 1}">
						<td><fmt:formatNumber value="${stuVO.depFee}" type="number"></fmt:formatNumber></td>
						<c:if test="${empty stuVO.schlshipVO}">
							<td>
								<button type="button" class="scBtn btn-two mini sky" data-stu-cd="${stuVO.stuCd}" data-si-cd="SCHL01"  data-scl-year="${stuVO.lecaYear}" data-scl-sem="${stuVO.lecaSem}">수여</button>
							</td>
						</c:if>
						<c:if test="${!empty stuVO.schlshipVO}">
							<td>완료</td>
						</c:if>
					</c:when>
					<c:otherwise>
						<td><fmt:formatNumber value="${stuVO.depFee * 0.5}" type="number"></fmt:formatNumber></td>
						<c:if test="${empty stuVO.schlshipVO}">
							<td>
								<button type="button" class="scBtn btn-two mini sky" data-stu-cd="${stuVO.stuCd}" data-si-cd="SCHL02"  data-scl-year="${stuVO.lecaYear}" data-scl-sem="${stuVO.lecaSem}">수여</button>
							</td>
						</c:if>
						<c:if test="${!empty stuVO.schlshipVO}">
							<td>완료</td>
						</c:if>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</table>
</div>
<script>
$(function() {
	
	$(".scBtn").on("click", function(){
		let siCd = $(this).data("siCd");
		let stuCd = $(this).data("stuCd");
		let sclYear = $(this).data("sclYear");
		let sclSem = $(this).data("sclSem");
		
		let data = {
   			"siCd" : siCd,
   			"stuCd" : stuCd,
   			"sclYear" : sclYear,
   			"sclSem" : sclSem
   		}
		console.log("data : ", data);
		
		$.ajax({
 			url:"/employee/schlship/award",
 			contentType:"application/json;charset=utf-8",
 			data:JSON.stringify(data),
 			type:"post",
 			beforeSend:function(xhr){
 				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
 			},
 			success:function(res){
 				alertSuccess('장학금 수여가 완료되었습니다.', '/employee/schlship/awardSchlship');
 			}
 		});
		
	});
})
</script>