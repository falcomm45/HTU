<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="kr.or.ddit.vo.CounselVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	.counsel_box tr td:nth-child(3){width:12%;}
	.counsel_box tr td:nth-child(4){width:15%;}
	.counsel_box tr td:nth-child(5){width:15%;}
 	.counsel_box tr td:nth-child(6){width:15%;}
	.counsel_box tr td:nth-child(7){width:18%;}
	
	.counselmodifymodal .counsel_form{border:1px solid #d1d0d0; padding:30px; width:100%; border-radius:5px; position:relative;}
	.counselmodifymodal .counsel_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
	.counselmodifymodal .counsel_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
	.counselmodifymodal .counsel_form_title select, .counsel_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
	.counselmodifymodal .counsel_margin_left{margin-left:5px;}
	.counselmodifymodal .counsel_form a:hover{color:#ffffff!important;}
	
	.close_bt:hover {background-color: #333;}
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
	<span style="font-size:12px; color:#888888;"><a href="/student/counsel/counselList">상담신청내역</a></span>
	</div>
	<div class="table_topic">상담신청내역<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	<table>
		
		<tr class="table_title">
			<td>no</td>
			<td>상담신청일자</td>
			<td>희망일시</td>
			<td>상담종류</td>
			<td>교수명</td>
			<td>승인여부</td>
			<!-- 상담날짜 이후에 써짐 -->
<!-- 			<td>상담내역</td> -->
			<td>비고</td>
		</tr>
		<c:forEach var="counselVO" items="${data}" varStatus="stat">
		
			<!-- 단과대리스트출력  -->
			<input type="text" value='${jsonColeCommonList}' id="jsonColeCommonList" style="display: none;" />
			<!-- 학과리스트출력 -->
			<input type="text" value='${jsonDepartmentList}' id="jsonDepartmentList" style="display: none;" />
			<!-- 교수리스트출력 -->
			<input type="text" value='${jsonCounselProList}' id="jsonCounselProList" style="display: none;" />

			<input type="text" name="cnslCd"
			hidden="hidden" value="${counselVO.cnslCd}" class="cnslCd" id="cnslCd">
		
		<tr>
			<td>${stat.count}</td>
			<td> <fmt:formatDate value="${counselVO.cnslDt}" pattern="yyyy-MM-dd"/> </td>
			<td> <fmt:formatDate value="${counselVO.cnslDt}" pattern="HH:mm"/> </td>
<%-- 			<td>${counselVO.strcnslDt}</td> --%>
			<td>${counselVO.commonDetailVO.comdNm}</td>
			<td>${counselVO.professorVO.userVO.userNm}</td>
			<td id="appYn">
				<c:choose>
					<c:when test="${counselVO.approvalVO.appYn eq 0}"><p class="btn-two mini green">대기</p></c:when>
					<c:when test="${counselVO.approvalVO.appYn eq 1}"><p class="btn-two mini sky">승인</p></c:when>
					<c:when test="${counselVO.approvalVO.appYn eq 2}"><p class="btn-two mini orange">반려</p></c:when>
				</c:choose>
			</td>
			<td>
			  <c:choose>
			    <c:when test="${counselVO.approvalVO.appYn eq 0}">
				  <button class="btn-two dark mini modify-btn" data-app-yn="${counselVO.approvalVO.appYn}" data-cnsl-cd="${counselVO.cnslCd}" style="margin-right:2px;">수정</button>
				  <button class="btn-two dark mini cancle-btn" data-app-yn="${counselVO.approvalVO.appYn}" data-cnsl-cd="${counselVO.cnslCd}" style="margin-left:2px;">취소</button>
			    </c:when>
			    <c:when test="${counselVO.approvalVO.appYn eq 2}">
				  <button class="btn-two gray mini btnCompanion" data-app-yn="${counselVO.approvalVO.appYn}" data-cnsl-cd="${counselVO.cnslCd}" style="margin-left:2px;">반려사유</button>
			    </c:when>
			  </c:choose>
			</td>
		</tr>
		</c:forEach>
		
	</table>
</div>

<!-- 상담수정 모달 -->
<div class="counselmodifymodal modal-bg"  style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
<div class="counsel_box" style="position:absolute; z-index: 999; width: 600px; height: 520px; border-radius:10px; padding:30px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
<div class="table_topic">상담신청</div>
<button type="button" class="btn-two gray mini close_bt" onclick="closeModal()" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>

<form name="frm"
	action="/student/counsel/counselUpdatePost?${_csrf.parameterName}=${_csrf.token}"
	method="post" enctype="multipart/form-data" class="counsel_form" style="height: calc(100% - 50px);">
	<!-- 내학번 -->
	
	<span id="deptList" style="display: none;">${jsonDepartmentList}</span>
	<span id="proList" style="display: none;">${jsonCounselProList}</span>
	
	<sec:authentication property="principal.userVO" var="userVO" />
	<input type="text" name="stuCd" hidden="hidden" id="stuCd" value=""> 
	<input type="text" name="appCd" id="appCd" hidden="hidden" value="">
	<input type="text" name="cnslCd" hidden="hidden" id="cnslCd" value="">
		
	<div class="counsel_form_title">
		<p>상담종류</p>
		<select name="comdCd" id="comdCd">
			<option value="COUN01">취업상담</option>
			<option value="COUN02">성적상담</option>
			<option value="COUN03">기타상담</option>
		</select>
	</div>
	<div class="counsel_form_title">
		<p>상담교수선택 <span style="font-size:12px; color:#333333; text-wrap:nowrap;">* 단과대, 학과, 교수 순으로 선택해주세요.</span></p>
		
		<div style="display:flex;">
		
			<input value='' id="proCd" style="display:none;">
			
			<select id="colNm" style="flex:1;">
			</select> 
			
			<select id="depSelect" style="flex:1;">
			</select>
	
			<select id="proSelect" style="flex:1;">
			</select>
		</div>
	</div>
	
	<div style="display:flex;">
		<div class="counsel_form_title" style="flex:1;">
			<p>상담희망일자</p>
			<span> <!-- 상담희망일자는 다음날부터 한달이내로만 가능 --> 
				<input type="date" value="cnslDate" name="cnslDt" id="cnslDate" style="width:100%; height:33.2px;">
			</span>		
		</div>
		
		<div class="counsel_form_title" style="flex:1;">
			<p>상담희망시간</p>
			<select name="" id="cnslTime">
				<option value="none">==시간선택==</option>
				<option value="09:00">09:00 - 10:00</option>
				<option value="10:00">10:00 - 11:00</option>
				<option value="11:00">11:00 - 12:00</option>
				<option value="13:00">13:00 - 14:00</option>
				<option value="14:00">14:00 - 15:00</option>
				<option value="15:00">15:00 - 16:00</option>
				<option value="16:00">16:00 - 17:00</option>
				<option value="17:00">17:00 - 18:00</option>
			</select>
			<input type="text" value="cnslDt" name="cnslDt" id="cnslDt" style="display:none;"/>
		</div>
	</div>

	<div class="counsel_form_title" style="margin-bottom:10px; margin-top:25px;">
		<!-- btn-reg로 버튼을 두개이상만들때는 두개를 감싸는 div를 만들고 display:flex 꼭 해주세요 -->
		<div style="display:flex; justify-content:end;">
			<button class="btn-reg bur modifycheckbtn" type="button">수정완료</button>
			<a href="/student/counsel/counselList" class="cancel btn-reg back" style="margin-left:10px;">취소</a>
		</div>
	</div>
	<sec:csrfInput />
</form>
</div>
</div>

<script>

/* 상담신청완료 sweetalert */
$(function() {
	if ($("#checkCreate").val().length > 0) alertSuccess("상담신청이 완료되었습니다.");
})
/* 상담신청취소 sweetalert */
$(function() {
	if ($("#checkDelete").val().length > 0) alertSuccess("상담신청내역이 취소되었습니다.");
})

/* jsonCounselList값 받아옴 */
const jsonCounselList = JSON.parse('${counsel}');
console.log("jsonCounselList",jsonCounselList);

//단과대리스트 (input/textarea는 val)
const jsonColeCommonList = JSON.parse($("#jsonColeCommonList").val());
//학과리스트
const jsonDepartmentList = JSON.parse($("#jsonDepartmentList").val());
//교수리스트
const jsonCounselProList = JSON.parse($("#jsonCounselProList").val());

/* 수정모달창 열고 단과대바꿀때 */
$("#colNm").on("change", function() {
    const colCd = $(this).val();
    
    let txt = "";
    txt+=`<option value="">학과선택</option>`
    jsonDepartmentList.forEach(dep => {
      if (dep.colCd == colCd) {
        txt += `<option value="\${dep.depCd}">\${dep.depNm}</option>`
      }
    });
    $("#depSelect").html(txt);
    
    let txt2=`<option value="">교수선택</option>`
    $("#proSelect").html(txt2);
    
  });

/* 수정모달창 열고 학과바꿀때 */
$("#depSelect").on("change", function() {
    const depCd = $(this).val();
    
    let txt = "";
    txt+=`<option value="">교수선택</option>`
    jsonCounselProList.forEach(pro => {
      if (pro.depCd == depCd) {
        txt += `<option value="\${pro.proCd}"
        
        >\${pro.userVO.userNm}</option>`
      }
    });
    $("#proSelect").html(txt);
  });

/* 모달창열고닫기 */
$(document).on("click",".modify-btn",function(){
	$('.counselmodifymodal').show();
});
// $(document).on("click", ".modal-bg", function () {
//     closeModal();
// });
//모달 출력시 닫기버튼 또는 배경을 누르면 모달닫힘
function closeModal() {
    $(".counselmodifymodal").fadeOut();
//     $(".modal-bg").fadeOut();
}
// function modalBgClick() {
//     $(".counselmodifymodal").fadeOut();
//     $(".modal-bg").fadeOut();
// }

/* 수정버튼 눌러 모달창에 기존 정보 보여주기 */
$(document).on("click", ".modify-btn", function(){
	/* 상담번호가지고옴 */
	const cnslCd= $(this).data("cnslCd");
//   console.log("modify cnslCd =>{}",cnslCd); 
  
/* list에 있는 상담 하나씩빼오기 */
  jsonCounselList.forEach(counsel => {
	  
		if(counsel.cnslCd == cnslCd){
			
			/* 상담종류 */
			const comdCd = document.querySelector("#comdCd");
			/* 교수명받아온거 */
			const proCd = $("#proCd").val(counsel.professorVO.userVO.userNm);
			/* 교수 해당부서 받아온거 */
			const prodept = counsel.professorVO.depCd;
			/* 교수 해당단과대 받아온거 */
			const procol = counsel.professorVO.depCd.substring(0,6);
			
			/* 상담종류 select를 위함 */
			if (counsel.comdCd == 'COUN01') comdCd.value = 'COUN01';
			else if (counsel.comdCd == 'COUN02') comdCd.value = 'COUN02';
			else if (counsel.comdCd == 'COUN03') comdCd.value = 'COUN03';
			
			/* 교수에 넣을값 */
			let txt = "";
			jsonCounselProList.forEach(pro => {
				txt += `<option value="\${pro.proCd}"`
					if (pro.userVO.userNm == proCd.val()) {
		    	txt += `selected`
		      		}
		    	txt += `>\${pro.userVO.userNm}</option>`
		    });
			$("#proSelect").html(txt);
			
			/* 선택한 교수의 단과대  교수가 가지고 있는 학과가 jsonDepartmentList에 있는 학과와 같다면*/
			let txt2 = "";
			jsonDepartmentList.forEach(pro => {
				
				console.log("pro",pro);
				console.log("procol",procol);
				
				if(pro.colCd==procol){
					txt2 += `<option value="\${pro.depCd}"`
						if (pro.depCd == prodept) {
			    	txt2 += `selected`
			      		}
			    	txt2 += `>\${pro.depNm}</option>`
				}
			});
			$("#depSelect").html(txt2);
			
			/* 선택한 교수의 단과대  교수가 가지고 있는 학과의 단과대가 jsonColeCommonList에 있는 학과와 같다면*/
			let txt3 = "";
			jsonColeCommonList.forEach(college => {
				if (college.comdCd !== 'COLE09' && college.comdCd !== 'COLE99') {
					txt3 += `<option value="\${college.comdCd}"`
						if (college.comdCd == procol) {
			    	txt3 += `selected`
			      		}
			    	txt3 += `>\${college.comdNm}</option>`
				}
			});
			$("#colNm").html(txt3);
			
		/* 상담번호 받아온거 */
		$("#cnslCd").val(counsel.cnslCd);
		/* 상담날짜 받아온거 */
		$("#cnslDt").val(counsel.cnslDt);
		
		$("#cnslDate").val(getPattern(counsel.cnslDt));
		
		
		// $("#cnslTime").val(getPattern3(counsel.cnslDt));
		const cnslTime = getPattern3(counsel.cnslDt)
// 		console.log("cnslTime : ", cnslTime);

		const cnslTimeselect = document.querySelector("#cnslTime");

			/* 상담시간 select를 위함 */
			if (cnslTime == '09:00') cnslTimeselect.value = '09:00';
			else if (cnslTime == '10:00') cnslTimeselect.value = '10:00';
			else if (cnslTime == '11:00') cnslTimeselect.value = '11:00';
			else if (cnslTime == '13:00') cnslTimeselect.value = '13:00';
			else if (cnslTime == '14:00') cnslTimeselect.value = '14:00';
			else if (cnslTime == '15:00') cnslTimeselect.value = '15:00';
			else if (cnslTime == '16:00') cnslTimeselect.value = '16:00';
			else if (cnslTime == '17:00') cnslTimeselect.value = '17:00';

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

/* 상담수정버튼 */
$(".modify-btn").each(function() {
	const appYn= $(this).data("appYn");
	
	if (appYn > 0) {
	    $(this).hide();
	}else{
	}
	
});

/* 상담취소버튼 */
$(".cancle-btn").each(function() {
	const appYn= $(this).data("appYn");
	const cnslCd= $(this).data("cnslCd");
	console.log(cnslCd);
	if (appYn > 0) {
	    $(this).hide();
	}else{
		$(this).on("click", function() {
			Swal.fire({
			      /* title: '상담을 취소하시겠습니까?', */
			      /* toast: true, */
			      text: "상담을 취소하시겠습니까?",
			      icon: 'question',
			      /* warning,error,success,info,question */
			      width: 400,
			      /* padding: "4em", */
			      position:'top center',
			      showCancelButton: true,
			      confirmButtonColor: '#3085d6',
			      cancelButtonColor: '#d33',
			      confirmButtonText: '상담취소',
			      cancelButtonText:  '뒤로가기',
			      /* reverseButtons: true, */ // 버튼 순서 거꾸로
			      
			    }).then((result) => {
			    	console.log(result);
			    	if (result.isConfirmed) {
		                var PageUrl = "/student/counsel/counselDelete?cnslCd="+cnslCd;
		                window.location.href = PageUrl;
		                /* alert는 다른방법으로 가져옴 */
		            } else {
		                console.log("이동이 취소되었습니다.");
// 		                alertError("상담취소에 실패하였습니다.");
		            }
			    })
            
        });
	}
	
})

$(".btnCompanion").on("click", function() {
	const cnslCd = $(this).data("cnslCd");
	const message = jsonCounselList.find(counsel => {if (counsel.cnslCd == cnslCd) return true;}).approvalVO.appRet;
	alertInfo(message);
})

function alertInfo(message) {
	message = message.slice(0,30) + "<br>" + message.slice(30);
	Swal.fire({
		html: '<i class="fa-solid fa-circle-info" style="color: #333333;"></i>  반려사유 : ' + message,
		width: 600,
		padding: 30,
		position: "center",
		confirmButtonColor: "#333333",
		confirmButtonText: "확인",
	}).then((result) => {
		
	});
}

/* 수정하기 */
$(document).on("click",".modifycheckbtn",function(){
	const cnslDate = $("#cnslDate").val();
	const cnslTime = $("#cnslTime").val();
	const cnslDt = cnslDate+'T'+cnslTime;
	
	const data = {
			"cnslCd" : $("#cnslCd").val(),
			"comdCd" : $("#comdCd").val(),
			"cnslDt" : $("#cnslDt").val(),
			"proCd"  : $("#proSelect").val(),
			"cnslDt" : cnslDt,
	}
	$.ajax({
		url:"/student/counsel/counselUpdatePost",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success:function(res){
			console.log("res : ", res);
			if (res == 1) {
				$("#comdCd").val(data.comdCd);
				$("#cnslDt").val(data.cnslDt);
				$("#proSelect").val(data.proCd);
				$("#cnslDt").val(data.cnslDt);
				$("#cnslDate").val(getPattern(data.cnslDt));
				$("#cnslTime").val(getPattern3(data.cnslDt));
				
			alertSuccess("정보수정이 완료되었습니다.", "/student/counsel/counselList");
			}
		},
        error: function (xhr) {
            console.log(xhr);
            alertError("정보수정이 완료되지않았습니다.");
        },
	});
});

</script>






