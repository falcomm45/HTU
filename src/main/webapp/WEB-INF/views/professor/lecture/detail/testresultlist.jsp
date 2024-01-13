<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.test_box{width:100%; padding:40px; background-color:#ffffff;}
	.test_box .table_topic{font-size: 20px; padding-bottom:13px;}
	.test_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.test_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.test_box tr:first-child{background-color:#EEF1F6;}
	.test_box tr:hover{background-color:#f2f3f4;}
	.test_box tr:first-child:hover{background-color:#EEF1F6;}
	.test_box tr td:nth-child(1){width:10%;}
	.test_box tr td:nth-child(2){width:20%;}
	.test_box tr td:nth-child(3){width:20%;}
	.test_box tr td:nth-child(4){width:20%;}
	.test_box tr td:nth-child(5){width:15%;}
 	.test_box tr td:nth-child(6){width:15%;}
 	.testBtn:hover{color:#ffffff!important;}
 	.scoreAvg {margin-bottom: 10px; float: right; margin-right: 50px;}
</style>
<div class="test_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/list" style="font-size:12px; color:#888888;">강의실</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/detail?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">${lectureNm}</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/test/testList?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">시험</a></span>
	</div>
	<div class="table_topic">${testVO.testNm} 제출 현황</div>
	<div class="scoreAvg">
		<span>평균 : </span><span id="avg" style="color: #0000d9"></span><span>점</span>
	</div>
	<table id="testTbl">
		<tr class="table_title">
			<th>석차</th>
			<th>학과</th>
			<th>학번</th>
			<th>이름</th>
			<th>점수</th>
			<th>상세</th>
		</tr>
		<c:set var="sum" value="0" />
		<c:set var="cnt" value="0" />
		<c:forEach var="taVO" items="${testApplyVOList}" varStatus="stat">
			<tr>
				<td>${taVO.rank}</td>
				<td>${taVO.depNm}</td>
				<td>${taVO.stuCd}</td>
				<td>${taVO.stuNm}</td>
				<c:if test="${taVO.teaCd ne null}">
					<td>${taVO.teaScore}</td>
					<td>
						<a href="/professor/test/testResult?lecCd=${param.lecCd}&teaCd=${taVO.teaCd}" class="testBtn btn-two mini sky">보기</a>
					</td>
					<c:set var="sum" value="${sum + taVO.teaScore}" />
					<c:set var="cnt" value="${cnt + 1}" />
				</c:if>
				<c:if test="${taVO.teaCd eq null}">
					<td>미응시</td>
					<td>-</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</div>
<script>
$(function(){
	
	// 평균 점수 구하기
	const table = document.getElementById('testTbl');
	
	let sum = "${sum}";
	let cnt = "${cnt}";
	
	console.log("sum : ", sum);
	console.log("cnt : ", cnt);
	
	let avg = (sum / cnt).toPrecision(4);

	document.getElementById("avg").innerText = avg;
});

</script>