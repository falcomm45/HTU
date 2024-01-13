<%@page import="kr.or.ddit.vo.RecordVO"%>
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
	.record_box{width:100%; height:100%; padding:40px; background-color:#ffffff;}
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
	.record_box tr td:nth-child(1){width:5%;}
	.record_box tr td:nth-child(2){width:15%;}
	.record_box tr td:nth-child(3){width:10%;}
	.record_box tr td:nth-child(4){width:20%;}
 	.record_box tr td:nth-child(5){width:15%;}
	.record_box tr td:nth-child(6){width:15%;}
 	.record_box tr td:nth-child(7){width:10%;} 
 	.record_box tr td:nth-child(8){width:10%;} 
	
	.close_bt:hover {background-color: #333;}
	
	.recordappmodal input:focus, .recordappmodal textarea:focus{outline:none;}
	.recordappmodal input{font-size:15px!important; width:140px; }
	.recordappmodal textarea{font-size:15px!important; resize:none;}
	.record_form table th, .record_form table td{border:1px solid #888888; padding:7px; font-size:15px!important;}
	.record_form table th{text-align:center; text-wrap:nowrap; background-color:#ebebeb;}
	.recordappmodal tr{height:35px;border-bottom:1px solid #ebebeb;}
	.recordappmodal tr:first-child{background-color:#ffffff;}
	.recordappmodal tr:hover{background-color:#ffffff;}
	.recordappmodal tr:first-child:hover{background-color:#ffffff;}
</style>

<%
	List<RecordVO> recordAdminList = (List<RecordVO>) request.getAttribute("data");
	ObjectMapper objectMapper = new ObjectMapper();
	String record = objectMapper.writeValueAsString(recordAdminList);
	session.setAttribute("record", record);
%>

<!-- 상담신청이 완료되면 나오는 alert를 위함 -->
<input id="checkCreate" type="hidden" value="${update}">

<div class="record_box">

<!-- 카테고리 표시 : 이거는 안에 스타일값 다 들어있으니까 통째로 복사하고 안에내용만 하드코딩하시면됩니다요 -->
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/employee/lectureapproval/list">결재</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/employee/lectureapproval/list">학적관리</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/employee/stuadmin/recordApprovalList">학적변경신청내역</a></span>
	</div>
	<div class="table_topic">학적변경내역</div>
<%-- 	${data} --%>
	<table>
		<tr class="table_title">
			<td>no</td>
			<td>신청일자</td>
			<td>신청종류</td>
			<td>신청년도/학기</td>
			<td>소속</td>
			<td>신청인</td>
			<td>승인여부</td>
		</tr>
		<c:forEach var="recordVO" items="${data}" varStatus="stat">
		<tr>
			<td>${stat.count}</td>
			<td><fmt:formatDate value="${recordVO.approvalVO.appReg}" pattern="yyyy-MM-dd"/></td>
			<c:choose>
				<c:when test="${recordVO.comdCd=='RECD02'}">
					<td>휴학</td>
				</c:when>
				<c:when test="${recordVO.comdCd=='RECD01'}">
					<td>복학</td>
				</c:when>
				<c:when test="${recordVO.comdCd=='RECD03'}">
					<td>자퇴</td>
				</c:when>
			</c:choose>		
			<td>${recordVO.recYear}년도&nbsp;/&nbsp;${recordVO.recSem}학기</td>
			<td>${recordVO.departmentVO.colNm} ${recordVO.departmentVO.depNm}</td>
			<td>${recordVO.userVO.userNm}</td>
			<td>
				<c:choose>
					<c:when test="${recordVO.approvalVO.appYn eq 0}"><p class="app_btn btn-two mini green" data-rec-cd="${recordVO.recCd}" data-app-cd="${recordVO.approvalVO.appCd}" data-stu-cd="${recordVO.stuCd}" style="cursor:pointer;">대기</p></c:when>
					<c:when test="${recordVO.approvalVO.appYn eq 1}"><p class="btn-two mini sky">승인</p></c:when>
					<c:when test="${recordVO.approvalVO.appYn eq 2}"><p class="btn-two mini orange">반려</p></c:when>
				</c:choose>
			</td>
		</tr>
		</c:forEach>
	</table>

</div>

<!-- 학적상태 신청 모달 -->
<div class="recordappmodal modal-bg" style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
<div class="modal_back" style="position:relative; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);"></div>
<div class="record_box" style="position:absolute; width:560px; height:700px; z-index: 999; padding:10px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
<form name="frm"
	action="/student/academicAdmin/recordAppPost?${_csrf.parameterName}=${_csrf.token}"
	method="post" enctype="multipart/form-data" class="record_form" id="capture" style="border:1px solid #ebebeb; padding:10px; width:100%; height:100%;">

	<sec:authentication property="principal.userVO" var="userVO" />

	<!-- 학적번호코드 -->
	<input type="text" name="recCd" id="recCd" hidden="hidden" value=""> 
	<!-- 학생코드 -->
	<input type="text" name="stuCd" id="stuCd" hidden="hidden" value="${userVO.studentVO.stuCd}"> 
	<!-- 학적상태 :  -->
	<input type="text" name="comdCd" id="comdCd" hidden="hidden" value="RECD02"> 
	
	<div class="table_topic" style="margin-bottom:30px; padding-bottom:15px; border-bottom:1px solid #d1d0d0; display:flex; align-items:center;">
		<input id="comdNmApply" style="font-size:20px!important; width:40px;" readonly/>
		<span>신청서</span>
	</div>
	<div class="record_form_title">
		<div style="margin-bottom:20px;">
			<span>신청일자 &nbsp;:&nbsp;</span><input id="appReg" readonly/>
		</div>
		<div style="margin-bottom:20px;">
			<span>학적상태 &nbsp;:&nbsp;</span><input id="comdNm" readonly/>
		</div>
		<div style="margin-bottom:8px;">학생정보</div>
		<table style="margin-bottom:20px; width:100%;">
			<tr>
				<th>소속</th>
				<td><input id="colNm" readonly/></td>
				<th>주민등록번호</th>
				<td>
					<div style="display:flex; align-items:center;">
						<input style="width:65px;" id="userReg1" readonly/>
						<span style="width:10px;">&nbsp;-&nbsp;</span>
						<input style="width:65px;" id="userReg2" readonly/>
					</div>
				</td>
			</tr>
			<tr>
				<th>학번</th>
				<td><input id="userCd" readonly/></td>
				<th>전화번호</th>
				<td><input id="userTel" readonly/></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input id="userNm" readonly/></td>
				<th>입학일</th>
				<td><input id="stuAddt" readonly/></td>
			</tr>
		</table>
	  <div style="display:flex; margin-bottom:20px; align-items: center;">
	 	<div style="flex:1; display:flex; align-items: center;">
		 	<span style="text-wrap:nowrap; margin-right:5px;">신청년도</span>
			<input id="recYear" name="recYear" value="" style="width:100%; font-size:15px; border:1px solid #888888;" readonly/>
		</div>
		<div style="flex:1; display:flex; align-items: center;">
			<span style="text-wrap:nowrap; margin-right:5px; margin-left:10px;">학기</span>
			<input id="recSem" name="recYear" value="" style="width:100%; font-size:15px; border:1px solid #888888;" readonly/>
			</select>
		</div>
	  </div>	
		
	  <div style="display:flex; flex-direction:column; margin-bottom:20px;  margin-top:10px;">
	  	<p style="margin-bottom:10px; display:flex; align-items:center;">
	  		<input id="recRsnTitle" style="font-size:16px!important; width:32px; line-height:16px; height:16px; margin-top:-2px;" readonly/>
	  		<span>사유</span>
	  	</p>
	  	<textarea id="recRsn" name="recRsn" style="height:150px; padding:10px; line-height:20px; font-size:14px;" readonly></textarea>
	  </div>
	</div>
	<!-- 컨트롤러에서 받아온 오늘날짜 -->
	<fmt:formatDate value="${now}" pattern="yyyy" var="year" />
	<fmt:formatDate value="${now}" pattern="MM" var="month" />
	<fmt:formatDate value="${now}" pattern="dd" var="day" />
	<div style="margin-top:40px;">
		<span style="position:absolute; left:50%; transform: translateX(-50%);">${year}년 ${month}월 ${day}일</span>
	</div>
	<div style="">
		<div style="position:absolute; bottom:40px; right:30px; display:flex;">
			<span>결재자 : &nbsp; ${userVO.userNm}&nbsp;&nbsp;</span>
			<div class="apply_sign" data-rec-cd="${recCd}" style="cursor:pointer;">( 인  )</div>
			<div class="apply_signdo" style="position:absolute; display:none; width:30px; right:5px; top:50%; transform:translate(-50%,-50%);"><img style="width:65px;" src="/resources/images/sign_do.png"></div>
		</div>
	</div>
	<sec:csrfInput />
</form>	
</div>
</div>

<script>

/* (인)클릭시 도장찍히기 */
$(document).on("click",".apply_sign",function(){
	const appCd = $(".app_btn").data("appCd");
	const recCd = $(".app_btn").data("recCd");
	const stuCd = $(".app_btn").data("stuCd");
	console.log("appCd",appCd);
	console.log("recCd",recCd);
	console.log("stuCd",stuCd);
	
	Swal.fire({
	      /* title: '상담을 취소하시겠습니까?', */
	      /* toast: true, */
	      text: "신청을 승인하시겠습니까?",
	      icon: 'question',
	      /* warning,error,success,info,question */
	      width: 400,
	      /* padding: "4em", */
	      position:'top center',
	      showCancelButton: true,
	      confirmButtonColor: '#3085d6',
	      cancelButtonColor: '#d33',
	      confirmButtonText: '승인',
	      cancelButtonText:  '취소',
	      /* reverseButtons: true, */ // 버튼 순서 거꾸로
	      
	    }).then((result) => {
	    	console.log(result);
	    	if (result.isConfirmed) {
	    	  $(".apply_signdo").show();
	    	  setTimeout(function () {
              var PageUrl = "/employee/stuadmin/recordApprovalUpdate?appCd="+appCd+"&stuCd="+stuCd+"&recCd="+recCd;
              window.location.href = PageUrl;
	    	  }, 1500);
          } else {
              console.log("학적변경 승인이 완료되지않았습니다.");
          }
	    })
	
});
/* 상담신청완료 sweetalert */
$(function() {
	if ($("#checkCreate").val().length > 0) alertSuccess("학적변경 승인이 완료되었습니다.");
})

/* jsonCounselList값 받아옴 */
const jsonRecordList = JSON.parse('${record}');
console.log("jsonRecordList",jsonRecordList);

/* 모달창열고닫기 */
$(document).on("click",".app_btn",function(){
	$('.recordappmodal').show();
});
$(document).on("click", ".modal_back", function () {
    closeModal();
});
//모달 출력시 닫기버튼 또는 배경을 누르면 모달닫힘
function closeModal() {
    $(".recordappmodal").fadeOut();
//     $(".modal-bg").fadeOut();
}
/* app_btn버튼 눌러 모달창에 기존 정보 보여주기 */
$(document).on("click", ".app_btn", function(){
	/* 신청번호가지고옴 */
	const recCd= $(this).data("recCd");
  
/* list에 있는 학적변경신청 하나씩빼오기 */
  jsonRecordList.forEach(record => {
	  
		if(record.recCd == recCd){

		/* 상담번호 받아온거 */
		$("#recCd").val(record.recCd);

		/* 학적신청*/
		if(record.comdCd=='RECD02'){
			$("#comdNmApply").val('휴학');
		}else if(record.comdCd=='RECD01'){
			$("#comdNmApply").val('복학');
		}else if(record.comdCd=='RECD03'){
			$("#comdNmApply").val('자퇴');
		}
		
		/* 학적상태 */
		$("#comdNm").val(record.studentVO.commonDetailVO.comdNm);
		/* 이름 */
		$("#userNm").val(record.userVO.userNm);
		/* 학번 */
		$("#userCd").val(record.userVO.userCd);
		/* 주민등록번호 */
		$("#userReg1").val(record.userVO.userReg1);
		$("#userReg2").val(record.userVO.userReg2);
		/* 전화번호 */
		$("#userTel").val(record.userVO.userTel);
		/* 단과대학과 */
		$("#colNm").val(record.departmentVO.colNm);
		$("#depNm").val(record.departmentVO.depNm);
		/* 신청일*/
		$("#appReg").val(getPattern(record.approvalVO.appReg));
		/* 입학일자 */
		$("#stuAddt").val(getPattern(record.studentVO.stuAddt));
		/* 신청년도/학기 */
		$("#recYear").val(record.recYear);
		$("#recSem").val(record.recSem);
		
		/* 사유제목*/
		if(record.comdCd=='RECD02'){
			$("#recRsnTitle").val('휴학');
		}else if(record.comdCd=='RECD01'){
			$("#recRsnTitle").val('복학');
		}else if(record.comdCd=='RECD03'){
			$("#recRsnTitle").val('자퇴');
		}
		/* 사유 */
		$("#recRsn").val(record.recRsn);

		}
	});
});
/* 날짜바꿔주는함수 */
function getPattern(dateNo) {
	const date = new Date(dateNo);
	return `\${date.getFullYear()}-\${(date.getMonth() + 1).toString().padStart(2, '0')}-\${date.getDate().toString().padStart(2, '0')}`;
}
</script>









