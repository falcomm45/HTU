<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.CounselVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
	/* 여기 스타일 전부 가져다가 복붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "counsel_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
	.record_box{width:100%; height:calc(100% - 40px); padding:40px; background-color:#ffffff;}
	/* 상단에 있는 제목 (여기서는 상담내역) css입니다
	 그대로 복붙하시고 해당div에  .table_topic값 주세요*/
	.record_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.record_box .table_topic i{margin-left:10px;}
	/* table입니다 */
	.record_box table{font-size:14px; width:100%; text-align:center;}
	/* 테이블의 시작부분 타이틀입니다 */
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	
	/* /////////////////여기가 수정시작!!  */
	.record_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.record_box tr:first-child{background-color:#EEF1F6;}
	.record_box tr:hover{background-color:#f2f3f4;}
	.record_box tr:first-child:hover{background-color:#EEF1F6;}
	/* /////////////////여기가 수정끝!!  */
	
	/* 각자 만든 td개수만큼만쓰고 총 합이 100이 되도록 잘 분배해서 쓰세요 이부분 제일 신경써서 해주세요*/
	.record_box tr td:nth-child(1){width:10%;}
	.record_box tr td:nth-child(2){width:20%;}
	.record_box tr td:nth-child(3){width:20%;}
	.record_box tr td:nth-child(4){width:20%;}
 	.record_box tr td:nth-child(5){width:15%;}
	.record_box tr td:nth-child(6){width:15%;}
/* 	.record_box tr td:nth-child(7){width:20%;} */
	
	.counselmodifymodal .counsel_form{border:1px solid #d1d0d0; padding:30px; width:100%; border-radius:5px; position:relative;}
	.counselmodifymodal .counsel_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
	.counselmodifymodal .counsel_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
	.counselmodifymodal .counsel_form_title select, .counsel_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
	.counselmodifymodal .counsel_margin_left{margin-left:5px;}
	.counselmodifymodal .counsel_form a:hover{color:#ffffff!important;}
	
	.close_bt:hover {background-color: #333;}
</style>

<!-- 상담신청이 취소되면 나오는 alert를 위함 -->
<input id="checkDelete" type="hidden" value="${delete}">

<div class="record_box">

<!-- 카테고리 표시 : 이거는 안에 스타일값 다 들어있으니까 통째로 복사하고 안에내용만 하드코딩하시면됩니다요 -->
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/academicAdmin/recordList">학사행정</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/academicAdmin/recordList">학적관리</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/academicAdmin/recordList">학적변경내역</a></span>
	</div>
	<div class="table_topic">학적변경내역<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
<%-- 	${data} --%>
	<table>
		<tr class="table_title">
			<td>no</td>
			<td>신청일자</td>
			<td>신청년도/학기</td>
			<td>신청종류</td>
			<td>승인여부</td>
			<td>취소</td>
		</tr>
<c:choose>
<c:when test="${!empty data}">	
		<c:forEach var="recordVO" items="${data}" varStatus="stat">
		<tr>
			<td>${stat.count}</td>
			<td><fmt:formatDate value="${recordVO.approvalVO.appReg}" pattern="yyyy-MM-dd"/></td>
			<td>${recordVO.recYear}년도&nbsp;/&nbsp;${recordVO.recSem}학기</td>
			<c:choose>
				<c:when test="${recordVO.commonDetailVO.comdNm=='재학'}">
					<td>복학</td>
				</c:when>
				<c:when test="${recordVO.commonDetailVO.comdNm=='휴학'}">
					<td>휴학</td>
				</c:when>
				<c:when test="${recordVO.commonDetailVO.comdNm=='자퇴'}">
					<td>자퇴</td>
				</c:when>
			</c:choose>
			<td>
				<c:choose>
					<c:when test="${recordVO.approvalVO.appYn eq 0}"><p class="btn-two mini green">대기</p></c:when>
					<c:when test="${recordVO.approvalVO.appYn eq 1}"><p class="btn-two mini sky">승인</p></c:when>
					<c:when test="${recordVO.approvalVO.appYn eq 2}"><p class="btn-two mini orange">반려</p></c:when>
				</c:choose>
			</td>
			<td>
			<c:if test="${recordVO.approvalVO.appYn eq 0}">
				<button class="btn-two dark mini cancle-btn" data-rec-cd="${recordVO.recCd}">취소</button>
			</c:if>
			</td>
		</tr>
		</c:forEach>
</c:when>
<c:otherwise>
		<tr>
		<td colspan="6"><div style="color: #333333; font-size: 14px;">학적변경 신청내역이 없습니다.</div></td>
		</tr>
</c:otherwise>
</c:choose>
	</table>

</div>
<!-- 페이지네이션 -->
<div style="background-color:#fff; position:relative; width:100%; height:40px;">
	${articlePage.getPagingArea()}
</div>

<script>

/* 취소 sweetalert */
$(function() {
	if ($("#checkDelete").val().length > 0) alertSuccess("학적변경신청내역이 취소되었습니다.");
})
/* 학적신청취소버튼 */
$(".cancle-btn").each(function() {
	const recCd= $(this).data("recCd");
	
		$(this).on("click", function() {
			Swal.fire({
			      /* title: '상담을 취소하시겠습니까?', */
			      /* toast: true, */
			      text: "신청을 취소하시겠습니까?",
			      icon: 'question',
			      /* warning,error,success,info,question */
			      width: 400,
			      /* padding: "4em", */
			      position:'top center',
			      showCancelButton: true,
			      confirmButtonColor: '#3085d6',
			      cancelButtonColor: '#d33',
			      confirmButtonText: '확인',
			      cancelButtonText:  '뒤로가기',
			      /* reverseButtons: true, */ // 버튼 순서 거꾸로
			      
			    }).then((result) => {
			    	console.log(result);
			    	if (result.isConfirmed) {
		                var PageUrl = "/student/academicAdmin/delete?recCd="+recCd;
		                window.location.href = PageUrl;
		                /* alert는 다른방법으로 가져옴 */
		            } else {
		                console.log("이동이 취소되었습니다.");
// 		                alertError("상담취소에 실패하였습니다.");
		            }
			    })
            
        });
});

</script>









