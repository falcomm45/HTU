<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.CounselVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- style.css -->
<!-- <link href="/resources/css/counsel.css" rel="stylesheet" type="text/css"> -->
<style>
	.counsel_box{width:100%; height:100%; padding:40px; background-color:#ffffff;}
	.counsel_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.counsel_box .table_topic i{margin-left:10px;}
	.counsel_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.counsel_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.counsel_box tr:first-child{background-color:#EEF1F6;}
	.counsel_box tr:hover{background-color:#f2f3f4;}
	.counsel_box tr:first-child:hover{background-color:#EEF1F6;}
	.counsel_box tr td:nth-child(1){width:10%;}
	.counsel_box tr td:nth-child(2){width:15%;}
	.counsel_box tr td:nth-child(3){width:15%;}
	.counsel_box tr td:nth-child(4){width:15%;}
	.counsel_box tr td:nth-child(5){width:15%;}
	.counsel_box tr td:nth-child(6){width:15%;}
	.counsel_box tr td:nth-child(7){width:15%;}
	
	.counselcon:hover{color:#ffffff;}
	.back_back:hover{color:#ffffff;}
	
	.counsel_reportform .counsel_form_title input{text-align:center;}
	.counsel_reportform .counsel_form_title input:focus{outline:none;}

</style>

<!-- 값받아오기 -->
<%
	List<CounselVO> counselProList = (List<CounselVO>) request.getAttribute("data");
	ObjectMapper objectMapper = new ObjectMapper();
	String counsel = objectMapper.writeValueAsString(counselProList);
	session.setAttribute("counsel", counsel);
%>

<%-- <p>${data}</p> --%>
<div class="counsel_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/professor/counsel/counselProList">상담관리</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/professor/counsel/counselReportList">상담기록</a></span>
	</div>
	<div class="table_topic">상담기록<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	<table>
		<tr class="table_title">
			<td>no</td>
			<td>상담진행일자</td>
			<td>진행일시</td>
			<td>신청인</td>
			<td>소속학과</td>
			<td>상담종류</td>
			<td>상담내역</td>
			<!-- 상담날짜 이후에 써짐 -->
		</tr>
		
			<!-- 컨트롤러에서 받아온 오늘날짜 -->
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
		
			<!-- 카운트함수 -->
			<c:set var="cnt" value="0"></c:set>
			
		<c:forEach var="counselVO" items="${data}">
			<!-- 카운트함수 -->
			<!-- 해당날짜 -->
			<fmt:formatDate value="${counselVO.cnslDt}" pattern="yyyy-MM-dd" var="cnslDate" />
			
			<!-- 지난 상담만 출력하기위함 -->
			<c:if test="${today > cnslDate && counselVO.approvalVO.appYn eq 1}">	
		
			<c:set var="cnt" value="${cnt+1}" />
			
			<tr>
				<td>${cnt}</td>
				<td> <fmt:formatDate value="${counselVO.cnslDt}" pattern="yyyy-MM-dd"/> </td>
				<td> <fmt:formatDate value="${counselVO.cnslDt}" pattern="HH:mm"/> </td>
				<td>${counselVO.userVO.userNm}</td>
				<td>${counselVO.departmentVO.depNm}</td> 
				<td>${counselVO.commonDetailVO.comdNm}</td>
<!-- 				<td> -->
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${counselVO.approvalVO.appYn eq 0}"><button class="btn-two mini green app-btn" type="submit" data-app-cd="${counselVO.approvalVO.appCd}" data-stu-cd="${counselVO.stuCd}" data-cnsl-cd="${counselVO.cnslCd}">대기</button></c:when> --%>
<%-- 						<c:when test="${counselVO.approvalVO.appYn eq 1}"><p class="btn-two mini sky">승인</p></c:when> --%>
<%-- 						<c:when test="${counselVO.approvalVO.appYn eq 2}"><button class="btn-two mini orange">반려</button></c:when> --%>
<%-- 					</c:choose> --%>
<!-- 				</td> -->
			<td>
				<c:choose>
					<c:when test="${counselVO.cnslCon == null}">
						<a href="#none" class="report-btn btn-two mini gray counselcon" data-cnsl-cd="${counselVO.cnslCd}">작성</a>
					</c:when>
					<c:when test="${counselVO.cnslCon != null}">
						<a href="#none" class="btn-two mini dark counselcon">완료</a>
					</c:when>
				</c:choose>
			</td>
			</tr>
			</c:if>
		</c:forEach>

	</table>
</div>

<!-- 상담내역올리기 모달 -->
<div class="counselreportmodal modal-bg"  style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
<div class="counsel_box" style="position:absolute; z-index: 999; width: 600px; height: 570px; border-radius:10px; padding:30px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
<div class="table_topic">상담내역</div>
<button type="button" class="btn-two gray mini close_bt" onclick="closeModal()" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>

<form name="frm"
	action="/student/counsel/counselUpdatePost?${_csrf.parameterName}=${_csrf.token}"
	method="post" enctype="multipart/form-data" class="counsel_form counsel_reportform" style="height: calc(100% - 50px);">
	<!-- 내학번 -->
	
	<span id="deptList" style="display: none;">${jsonDepartmentList}</span>
	<span id="proList" style="display: none;">${jsonCounselProList}</span>
	
	<sec:authentication property="principal.userVO" var="userVO" />
	<input type="text" name="stuCd" hidden="hidden"
		value="stuCd"> 
	<input type="text" name="appCd" id="appCd"
		hidden="hidden" value="">
	<input type="text" name="cnslCd" hidden="hidden" id="cnslCd"
		 value="">
	
	<div style="display:flex; width:100%;">
		<div class="counsel_form_title" style="flex:1;">
			<p style="font-size:14px; margin-bottom:5px;">상담학생</p>
			<div style="display:flex;">
				<input style="width:50%; font-size:15px; padding:2px 5px; border:1px solid #d0d0d1; border-right:none; border-radius:3px 0 0 3px; margin-bottom:20px;" value="" id="depNm" readonly/>	
				<input style="width:50%; font-size:15px; padding:2px 5px; border:1px solid #d0d0d1; border-left:none; border-radius:0 3px 3px 0; margin-bottom:20px;" value="" id="userNm" readonly/>	
			</div>
		</div>
		
		<div class="counsel_form_title" style="flex:1;">
			<p style="font-size:14px; margin-bottom:5px;">상담진행일시</p>
			<div style="display:flex;">
				<input style="width:50%; font-size:15px; padding:2px 5px; border:1px solid #d0d0d1; border-right:none; border-radius:3px 0 0 3px; margin-bottom:20px;" value="" id="cnslDate" readonly/>	
				<input style="width:50%; font-size:15px; padding:2px 5px; border:1px solid #d0d0d1; border-left:none; border-radius:0 3px 3px 0; margin-bottom:20px;" value="" id="cnslTime" readonly/>	
			</div>
		</div>
		
		<div class="counsel_form_title" style="flex:1;">
			<p style="font-size:14px; margin-bottom:5px;">상담종류</p>
			<input style="width: 100%; font-size:15px; padding:2px 5px; border:1px solid #d0d0d1; border-radius:3px; margin-bottom:20px;" value="" id="comdCd" readonly/>
		</div>
	</div>
	
	
	<div class="counsel_form_title">
		<div style="margin-bottom: -23px; margin-left: 460px;">
			<input type="checkbox" class="btn-two mini gray counsel" id="counsel-report" />
		    <label for="counsel-report">
		    <span style="font-size: 11px; font-weight: 400; margin-left: -10px; position: relative; top: -4px">자동완성</span>
	    	</label>
	    </div>
		<p style="font-size:14px; margin-bottom:5px; border-radius:3px;">상담내용</p>
		<textarea id="cnslCon" style="font-size:15px; line-height:20px; padding:7px 5px; width:100%; resize:none; height:300px; border:1px solid #d0d0d1; overflow-y:scroll; border-radius:3px;"></textarea>
	</div>
	
	<div class="counsel_form_title" style="margin-top:30px;">
		<!-- btn-reg로 버튼을 두개이상만들때는 두개를 감싸는 div를 만들고 display:flex 꼭 해주세요 -->
		<div style="display:flex; justify-content:end;">
			<button class="btn-reg bur regist-btn" type="button">등록</button>
			<a href="/professor/counsel/counselReportList" class="cancel btn-reg back back_back" style="margin-left:10px;">취소</a>
		</div>
	</div>
	<sec:csrfInput />
</form>
</div>
</div>

<script>
/* 상담내역 상세보기 자동완성 */
$("#counsel-report").on("click", function (){
    $("#cnslCon").val("성적 상담 사유 : 학생이 최근 시험에서 낮은 성적을 받아 원인을 파악하고 개선하기 위한 조언 받고자 함.\n대화 내용 : 기말고사에서 이해가 안갔던 부분 및 시험 준비시 시간 분배에 여려움을 겪고 있음.\n상담 내용 : 수업 자료나 교재를 다시 확인하면서 궁금한 부분은 즉시 질문할 것.\n시간 분배와 계획에 대한 필요성이 있으며, 수업과 과제의 병행으로 인해 부족한 시간을 배분할 필요가 있음.\n학습 일정 계획을 비롯하여 더 중요한 과목 및 과제보다는 시험에 더 많은 시간을 할당해야 함.\n스트레스 관리 및 적절한 휴식과 스트레스 관리 방법에 대한 조언\n결론 및 조치 계획 : 학생은 조언을 기반으로 추가 학습의 필요성 및 효율적인 시간 관리 계획을 세우기로 함.\n학생과 지속적인 상담 예정이며 진행 상황에 대한 보고를 기록 할 계획.");
});

/* jsonCounselList값 받아옴 */
const jsonCounselList = JSON.parse('${counsel}');
console.log("jsonCounselList",jsonCounselList);

/* 날짜바꿔주는함수 */
function getPattern(dateNo) {
	const date = new Date(dateNo);
	return `\${date.getFullYear()}-\${(date.getMonth() + 1).toString().padStart(2, '0')}-\${date.getDate().toString().padStart(2, '0')}`;
}
/* 시간바꿔주는함수 */
function getPattern3(dateNo){
	const date = new Date(dateNo);
	return `\${date.getHours().toString().padStart(2, '0')}:\${date.getMinutes().toString().padStart(2, '0')}`;
}

/* 모달창열고닫기 */
$(document).on("click",".report-btn",function(){
	$('.counselreportmodal').show();
});
// $(document).on("click", ".modal-bg", function () {
//     closeModal();
// });
//모달 출력시 닫기버튼 또는 배경을 누르면 모달닫힘
function closeModal() {
    $(".counselreportmodal").fadeOut();
//     $(".modal-bg").fadeOut();
}

/* 상담내역올리기버튼 눌러 모달창에 기존 정보 보여주기 */
$(document).on("click", ".report-btn", function(){
	/* 상담번호가지고옴 */
	const cnslCd= $(this).data("cnslCd");
//   console.log("modify cnslCd =>{}",cnslCd); 
  
/* list에 있는 상담 하나씩빼오기 */
  jsonCounselList.forEach(counsel => {
	  
		if(counsel.cnslCd == cnslCd){

		/* 상담번호 받아온거 */
		$("#cnslCd").val(counsel.cnslCd);
		/* 상담종류 */
		$("#comdCd").val(counsel.commonDetailVO.comdNm);
		/* 상담날짜 받아온거 */
		$("#cnslDt").val(counsel.cnslDt);
		/* 상담신청자 받아온거 */
		$("#depNm").val(counsel.departmentVO.depNm);
		$("#userNm").val(counsel.userVO.userNm);
		/* 상담일시 */
		$("#cnslDate").val(getPattern(counsel.cnslDt));
		$("#cnslTime").val(getPattern3(counsel.cnslDt));

		}
	});
});
/* 상담내용 등록하기 */
$(document).on("click",".regist-btn",function(){
	
	const cnslCd=$("#cnslCd").val();
	console.log(cnslCd);
	
	const data = {
			"cnslCd" : $("#cnslCd").val(),
			"cnslCon" : $("#cnslCon").val(),
	}
	$.ajax({
		url:"/professor/counsel/counselConInsert",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success:function(res){
			console.log("res : ", res);
			    if(res == 1){
				$("#cnslCon").val(data.cnslCon);
				
				alertSuccess("상담내역이 등록되었습니다.", "/professor/counsel/counselReportList");
			}
		},
        error: function (xhr) {
            console.log(xhr);
            alertError("정보수정이 완료되지않았습니다.");
        },
	});
});

</script>