<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.crew_box{width:100%; padding:40px; background-color:#ffffff;}
	.crew_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.crew_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.crew_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.crew_box tr:first-child{background-color:#EEF1F6;}
	.crew_box tr:hover{background-color:#f2f3f4;}
	.crew_box tr:first-child:hover{background-color:#EEF1F6;}
	.crew_box tr td:nth-child(1){width:20%;}
	.crew_box tr td:nth-child(2){width:25%;}
	.crew_box tr td:nth-child(3){width:20%;}
	.crew_box tr td:nth-child(4){width:20%;}
	.crew_box tr td:nth-child(5){width:15%;}
	
	.tbl2 td:nth-child(1){width:5%;}
	.tbl2 td:nth-child(2){width:25%;}
	.tbl2 td:nth-child(3){width:40%;}
	.tbl2 td:nth-child(4){width:30%;}
	
	#deleteBtn {
	  float: right;
	}
	.crewInfo {
	  margin-bottom: 30px;
	}
	.crewInfoHeader, .crewPersonHeader {
	  font-size: 16px; 
	  padding-bottom:10px;
	}
</style>
<sec:authentication property="principal.userVO" var="userVO"/>
<div class="crew_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">결재</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/crew/crewList">동아리 관리</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/crew/crewAppList">동아리 관리</a></span>
	</div>
	<input id="crCd" value="${crewVO.crCd}" hidden />
	<div class="table_topic">
			<p>${crewVO.crNm}
				<c:if test="${crewVO.crYn eq 0}">
					(운영)
				</c:if>
				<c:if test="${crewVO.crYn eq 1}">
					(폐쇄)
				</c:if>
			</p>
			<button type="button" id="deleteBtn" class="btn-two mini sky">동아리 폐쇄</button>
	</div>
		<div class="crewInfo">
			<div class="crewInfoHeader">동아리 정보</div>
			<table>
				<tr class="table_title">
					<th>개설날짜</th>
					<th>동아리 목적</th>
					<th>회장</th>
					<th>동아리실</th>
					<th>인원</th>
				</tr>
				<tr>
					<td><fmt:formatDate value="${crewVO.approvalVO.appProdt}" pattern="yyyy-MM-dd"/></td>
					<td>${crewVO.crCon}</td>
					<td>${crewVO.ldrNm}</td>
					<td>학생회관 ${crewVO.roomNm}</td>
					<td>${crewVO.crPs}</td>
				</tr>
			</table>
		</div>
		<div>
			<div class="crewPersonHeader">동아리원</div>
			<table>
				<tr class="table_title">
					<th style="width: 5%">번호</th>
					<th style="width: 30%">이름</th>
					<th style="width: 35%">학과</th>
					<th style="width: 30%">학번</th>
				</tr>
				<c:if test="${crewVO.crYn eq 1}">
					<tr style="text-align: center;"><td colspan="4">동아리원이 없습니다.</td></tr>
				</c:if>
				<c:forEach var="crewPerson" items="${crewPersonnelList}" varStatus="stat">
					<tr>
						<td style="width: 5%">${stat.count}</td>
						<td style="width: 30%">${crewPerson.stuNm}</td>
						<td style="width: 35%">${crewPerson.depNm}</td>
						<td style="width: 30%">${crewPerson.stuCd}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
</div>
<script>
$(function(){
	
	$("#deleteBtn").on("click", function(){
		let crCd = $("#crCd").val();
		
		console.log("crCd : " + crCd);
		
		Swal.fire({
	      text: "동아리를 폐쇄하시겠습니까?",
	      icon: 'question',
	      width: 400,
	      position:'top',
	      showCancelButton: true,
	      confirmButtonColor: '#3085d6',
	      cancelButtonColor: '#d33',
	      confirmButtonText: '폐쇄',
	      cancelButtonText:  '취소',
	    }).then((result) => {
	    	console.log(result);
	    	if (result.isConfirmed) {
	    		
	    		if("${crewVO.crPs}" > 1){
					alertError('활동 중인 동아리원이 존재하므로 폐쇄할 수 없습니다.');
				}else {
					$.ajax({
						url:"/employee/crew/deleteCrew",
						contentType:"application/json;charset=utf-8",
			 			data:crCd,
						type:"post",
						beforeSend:function(xhr){
							xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
						},
						success:function(res){
							alertSuccess('동아리가 폐쇄되었습니다.', '/employee/crew/crewList');
						}
					});
				}
            }
	    });
	});
});
</script>