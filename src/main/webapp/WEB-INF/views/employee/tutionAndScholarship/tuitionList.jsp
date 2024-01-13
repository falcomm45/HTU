<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.tuition_box{width:100%; height:100%; overflow-y:scroll; padding:40px; background-color:#ffffff;}
	.tuition_box .table_topic{font-size: 20px;}
	.tuition_box .table_topic i{margin-left:10px;}
	.tuition_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.tuition_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.tuition_box tr:first-child{background-color:#EEF1F6;}
	.tuition_box tr:hover{background-color:#f2f3f4;}
	.tuition_box tr td:nth-child(1){width:5%;}
	.tuition_box tr td:nth-child(2){width:12.5%;}
	.tuition_box tr td:nth-child(3){width:12.5%;}
	.tuition_box tr td:nth-child(4){width:10%;}
	.tuition_box tr td:nth-child(5){width:10%;}
	.tuition_box tr td:nth-child(6){width:10%; text-align: right;}
	.tuition_box tr td:nth-child(7){width:10%; text-align: right;}
	.tuition_box tr td:nth-child(8){width:10%; text-align: right;}
	.tuition_box tr td:nth-child(9){width:10%;}
	.tuition_box tr td:nth-child(10){width:10%;}
	.tuit_box{
		display: flex; 
		justify-content: center;
	    padding: 20px;
	    background-color: #EEF5FF;
	    border-radius: 10px;
 	    margin-bottom: 20px;
	    align-items: center;
	    width: 100%;
	    height: 80px;
	}
	.tuit_box select{
		border: 1px solid #9EB8D9;
		border-radius: 6px;
		width: 200px; font-size:14px;
	}
	.tuit_box input:focus{outline:none;}
</style>
<div class="tuition_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/tuition/list">등록/장학</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/tuition/list">등록</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/tuition/list">등록금 관리</a></span>
	</div>
	<div class="table_topic">등록금 관리</div>
	<div>
		<button class="btn-two sky mini" id="tuitBtn" style="float: right;">고지서 발송</button> 
	</div>
	<div class="tuit_box">
		<div>등록년도
			<select id="sclYear">
				<option value="0">전체</option>
				<option value="2024" selected="selected">2024</option>
				<option value="2023">2023</option>
				<option value="2022">2022</option>
			</select>
		</div>
		<div style="margin: 0 20px 0 40px;">학기
			<select id="sclSem" name="sclSem">
				<option value="0">전체</option>
				<option value="1" selected="selected">1학기</option>
				<option value="2">2학기</option>
			</select>
		</div>
		<div>
			<input type="checkbox" checked="checked" />
			현재 학기 조회
		</div>
	</div>
	<table id="tuitTbl">
		<tr class="table_title">
			<th>no</th>
			<th>등록학기</th>
			<th>학과</th>
			<th>학번</th>
			<th>이름</th>
			<th>등록금(원)</th>
			<th>장학금(원)</th>
			<th>납부금액(원)</th>
			<th>납부일</th>
			<th>납부상태</th>
		</tr>
		<c:forEach var="tuitVO" items="${tuitionVOList}" varStatus="stat">
			<tr>
				<td>${stat.count}</td>
				<td>${tuitVO.tutYear}학년 ${tuitVO.tutSem}학기</td>
				<td>${tuitVO.depNm}</td>
				<td>${tuitVO.stuCd}</td>
				<td>${tuitVO.stuNm}</td>
				<td><fmt:formatNumber value="${tuitVO.tutTuition}" type="number"></fmt:formatNumber></td>
				<td><fmt:formatNumber value="${tuitVO.tutSchl}" type="number"></fmt:formatNumber></td>
				<td><fmt:formatNumber value="${tuitVO.tutPayment}" type="number"></fmt:formatNumber></td>
				<c:if test="${!empty tuitVO.tutDt}">
					<td><fmt:formatDate value="${tuitVO.tutDt}" pattern="yyyy-MM-dd"/></td>
					<td style="color: blue;">완납</td>
				</c:if>
				<c:if test="${empty tuitVO.tutDt}">
					<td>-</td>
					<td style="color: red;">미납</td>
				</c:if>
			</tr>
		</c:forEach>
	</table>
</div>
<script type="text/javascript">

	$("#tuitBtn").on("click", function(){
		
		Swal.fire({
		      text: "등록금 고지서를 발송하시겠습니까?",
		      icon: 'question',
		      width: 400,
		      position:'top',
		      showCancelButton: true,
		      confirmButtonColor: '#3085d6',
		      cancelButtonColor: '#d33',
		      confirmButtonText: '확인',
		      cancelButtonText:  '취소',
		    }).then((result) => {
		    	if (result.isConfirmed) {
					alertSuccess('발송되었습니다.');
				}
			});
	});
</script>