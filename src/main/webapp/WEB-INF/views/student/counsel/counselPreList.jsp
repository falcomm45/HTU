<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.CounselVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- style.css -->
<style>
	/* 여기 스타일 전부 가져다가 복붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "counsel_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
	.counsel_box{width:100%; height:100%; padding:40px; background-color:#ffffff;}
	/* 상단에 있는 제목 (여기서는 상담내역) css입니다
	 그대로 복붙하시고 해당div에  .table_topic값 주세요*/
	.counsel_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.counsel_box .table_topic i{margin-left:10px;}
	/* table입니다 */
	.counsel_box table{font-size:14px; width:100%; text-align:center;}
	/* 테이블의 시작부분 타이틀입니다 */
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	
	/* /////////////////여기가 수정시작!!  */
	.counsel_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.counsel_box tr:first-child{background-color:#EEF1F6;}
	.counsel_box tr:hover{background-color:#f2f3f4;}
	.counsel_box tr:first-child:hover{background-color:#EEF1F6;}
	/* /////////////////여기가 수정끝!!  */
	
	/* 각자 만든 td개수만큼만쓰고 총 합이 100이 되도록 잘 분배해서 쓰세요 이부분 제일 신경써서 해주세요*/
	.counsel_box tr td:nth-child(1){width:10%;}
	.counsel_box tr td:nth-child(2){width:15%;}
	.counsel_box tr td:nth-child(3){width:15%;}
	.counsel_box tr td:nth-child(4){width:15%;}
	.counsel_box tr td:nth-child(5){width:15%;}
	.counsel_box tr td:nth-child(6){width:15%;}
	.counsel_box tr td:nth-child(7){width:15%;}
	
	.counselmodifymodal .counsel_form{border:1px solid #d1d0d0; padding:30px; width:100%; border-radius:5px; position:relative;}
	.counselmodifymodal .counsel_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
	.counselmodifymodal .counsel_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
	.counselmodifymodal .counsel_form_title select, .counsel_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
	.counselmodifymodal .counsel_margin_left{margin-left:5px;}
	.counselmodifymodal .counsel_form a:hover{color:#ffffff!important;}
	
	.close_bt:hover {background-color: #333;}
	
	.counsel_reportform .counsel_form_title input{text-align:center;}
	.counsel_reportform .counsel_form_title input:focus{outline:none;}
	.counsel_reportform textarea:focus{outline:none;}
</style>

<!-- 값받아오기 -->
<%
	List<CounselVO> counselList = (List<CounselVO>) request.getAttribute("data");
	ObjectMapper objectMapper = new ObjectMapper();
	String counsel = objectMapper.writeValueAsString(counselList);
	session.setAttribute("counsel", counsel);
%>
<!-- 상담신청이 완료되면 나오는 alert를 위함 -->
<input id="checkCreate" type="hidden" value="${update}">
<!-- 상담신청이 취소되면 나오는 alert를 위함 -->
<input id="checkDelete" type="hidden" value="${delete}">

<div class="counsel_box">
	<!-- 카테고리 표시 : 이거는 안에 스타일값 다 들어있으니까 통째로 복사하고 안에내용만 하드코딩하시면됩니다요 -->
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/counsel/counselList">상담</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/counsel/counselPreList">이전상담내역</a></span>
	</div>
	<div class="table_topic">이전상담내역<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	<table>
		
		<tr class="table_title">
			<td>no</td>
			<td>상담진행일자</td>
			<td>진행일시</td>
			<td>상담종류</td>
			<td>교수명</td>
			<td>승인여부</td>
			<td>상담내역</td>
			
		</tr>
		
			<!-- 컨트롤러에서 받아온 오늘날짜 -->
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
		
			<!-- 카운트함수 -->
			<c:set var="cnt" value="0"></c:set>
		
		<c:forEach var="counselVO" items="${data}">
			<!-- 카운트함수 -->
			<!-- 해당날짜 -->
			<fmt:formatDate value="${counselVO.cnslDt}" pattern="yyyy-MM-dd" var="cnslDate" />
			
			<!-- 단과대리스트출력  -->
			<input type="text" value='${jsonColeCommonList}' id="jsonColeCommonList" style="display: none;" />
			<!-- 학과리스트출력 -->
			<input type="text" value='${jsonDepartmentList}' id="jsonDepartmentList" style="display: none;" />
			<!-- 교수리스트출력 -->
			<input type="text" value='${jsonCounselProList}' id="jsonCounselProList" style="display: none;" />
			<input type="text" name="cnslCd"
			hidden="hidden" value="${counselVO.cnslCd} id="cnslCd">
			
		<!-- 지난 상담만 출력하기위함 -->
		<c:if test="${today > cnslDate && counselVO.approvalVO.appYn eq 1}">	
		
			<c:set var="cnt" value="${cnt+1}" />
		
			<tr>
				<td>${cnt}</td>
				<td> <fmt:formatDate value="${counselVO.cnslDt}" pattern="yyyy-MM-dd"/> </td>
				<td> <fmt:formatDate value="${counselVO.cnslDt}" pattern="HH:mm"/> </td>
				<td>${counselVO.commonDetailVO.comdNm}</td>
				<td>${counselVO.professorVO.userVO.userNm}</td>
				<td id="appYn">
					<c:choose>
						<c:when test="${counselVO.approvalVO.appYn eq 0}"><p class="btn-two mini green">대기</p></c:when>
						<c:when test="${counselVO.approvalVO.appYn eq 1}"><p class="btn-two mini sky">승인</p></c:when>
						<c:when test="${counselVO.approvalVO.appYn eq 2}"><p class="btn-two mini orange">반려</p></c:when>
					</c:choose>
				</td>
				<c:choose>
					<c:when test="${counselVO.cnslCon != null}">
						<td><button class="detail-btn btn-two gray mini" data-cnsl-Cd="${counselVO.cnslCd}">상세</button></td>
					</c:when>
					<c:when test="${counselVO.cnslCon == null && counselVO.approvalVO.appYn == 2}">
						<td><button class="detail-btn btn-two gray mini" style="display:none;"></button></td>
					</c:when>
				</c:choose>
			</tr>
		</c:if>
		</c:forEach>
	</table>
</div>


<!-- 상담내역올리기 모달 -->
<div class="counseldetailmodal modal-bg"  style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
<div class="counsel_box" style="position:absolute; z-index: 999; width: 600px; height: 520px; border-radius:10px; padding:30px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
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
		 value="${counselVO.cnslCd}">
	
	<div style="display:flex; width:100%;">
		<div class="counsel_form_title" style="flex:1;">
			<p style="font-size:14px; margin-bottom:5px;">상담교수</p>
			<input style="width: 100%; font-size:15px; padding:2px 5px; border:1px solid #d0d0d1; border-radius:3px; margin-bottom:20px;" value="" id="userNm" readonly/>	
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
		<p style="font-size:14px; margin-bottom:5px; border-radius:3px;">상담내용</p>
		<textarea id="cnslCon" style="font-size:15px; line-height:20px; padding:7px 5px; width:100%; resize:none; height:300px; border:1px solid #d0d0d1; overflow-y:scroll; border-radius:3px;" readonly></textarea>
	</div>

	<sec:csrfInput />
</form>
</div>
</div>

<script>

/* jsonCounselList값 받아옴 */
const jsonCounselList = JSON.parse('${counsel}'.replaceAll("\n", "ddd"));
console.log("jsonCounselList",jsonCounselList);

/* 모달창닫기 */
$(document).on("click",".detail-btn",function(){
	$('.counseldetailmodal').show();
});
// $(document).on("click", ".modal-bg", function () {
//     closeModal();
// });
//모달 출력시 닫기버튼 또는 배경을 누르면 모달닫힘
function closeModal() {
    $(".counseldetailmodal").fadeOut();
//     $(".modal-bg").fadeOut();
}
// function modalBgClick() {
//     $(".counselmodifymodal").fadeOut();
//     $(".modal-bg").fadeOut();
// }

/* 상담내용상세 눌러 모달창에 기존 정보 보여주기 */
$(document).on("click", ".detail-btn", function(){
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
			/* 상담교수 받아온거 */
 			$("#userNm").val(counsel.professorVO.userVO.userNm);
			/* 상담일시 */
			$("#cnslDate").val(getPattern(counsel.cnslDt));
			$("#cnslTime").val(getPattern3(counsel.cnslDt));
			/* 상담내용받아온거 */
			$("#cnslCon").val(counsel.cnslCon.replaceAll("ddd", "\n"));
		}
	});
});
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

</script>






