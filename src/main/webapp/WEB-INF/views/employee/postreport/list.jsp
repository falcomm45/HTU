<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
.report_box {
	width: 100%; height:100%; overflow-y:scroll;
	padding: 40px;
	background-color: #ffffff;
}

.report_box .table_topic {
	font-size: 20px;
	padding-bottom: 30px;
}

.report_box .table_topic i {
	margin-left: 10px;
}

.report_box table {
	font-size: 14px;
	width: 100%;
	text-align: center;
}

.table_title {
	font-size: 13px;
	border-top: 1px solid #d1d0d0;
	border-bottom: 1px solid #d1d0d0;
	height: 32px;
	line-height: 32px;
}
/* /////////////////여기가 수정시작!!  */
.report_box tr {
	height: 40px;
	border-bottom: 1px solid #ebebeb;
}

.report_box tr:first-child {
	background-color: #EEF1F6;
}

.report_box tr:hover {
	background-color: #f2f3f4;
}

.report_box tr:first-child:hover {
	background-color: #EEF1F6;
}
/* /////////////////여기가 수정끝!!  */
.report_box tr {
	height: 40px;
}

.report_box tr td:nths-child(1) {
	width: 5%;
}

.report_box tr td:nth-child(2) {
	width: 25%;
}

.report_box tr td:nth-child(3) {
	width: 25%;
}

.report_box tr td:nth-child(4) {
	width: 20%;
}

.report_box tr td:nth-child(5) {
	width: 25%;
}

#bdTitle {
	width: 400px;
}

#postReportModal .table {
    border-collapse: collapse;
    width: 100%;
}

#postReportModal .table tr {
    border: none; /* Removing horizontal lines */
}

#postReportModal .table th, #postReportModal .table td {
    padding: 8px;
    text-align: left;
}

#postReportModal .table th {
    background-color: #f2f2f2;
    font-weight: bold;
    width: 4%;
    font-size: 13px;
}

#postReportModal .table td {
    width: 30%; /* You can adjust the width */
}
.custom-close-btn {
            background-color: gainsboro;
            color: #ffffff;
            border: none;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            font-size: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }
</style>
<div class="report_box" style="background-color: white;">
	<div style="font-size: 12px; color: #888888; margin-bottom: 20px;">
		<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13"
				width="13" viewBox="0 0 576 512" style="margin-right: 5px;">
				<path fill="#888888"
					d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z" /></svg></a></span>
			<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/lectureapproval/list">결재</a></span>
			<span style="font-size: 12px; color: #888888;">></span> 
			<span
			style="font-size: 12px; color: #888888;"><a href="/employee/postreport/list">커뮤니티관리</a></span> <span
			style="font-size: 12px; color: #888888;">></span> <span
			style="font-size: 12px; color: #888888;"><a href="/employee/postreport/list">게시글 신고 내역</a></span>
	</div>
	<div class="table_topic">
		게시글 신고 내역
	</div>

	<!-- 대기만 출력하는 테이블 시작 -->
<table>
    <tr class="table_title" style="border-top:1px solid #333333!important; border-bottom:1px solid #333333!important;">
        <td>no</td>
        <td>게시글번호</td>
        <td>신고사유</td>
        <td>신고일</td>
        <td>비 고</td>
    </tr>
    <c:forEach items="${data.content}" var="postReportVO" varStatus="stat1">
        <c:if test="${postReportVO.approvalVO.appYn eq 0}">
            <tr>
                <td><span id="no_waiting_${stat1.count}">${stat1.count}</span></td>
                <td><a class="detail" href="/common/board/<c:if test="${postReportVO.boardVO.comdCd eq 'BORD01'}">free</c:if><c:if test="${postReportVO.boardVO.comdCd eq 'BORD02'}">publicize</c:if><c:if test="${postReportVO.boardVO.comdCd eq 'BORD03'}">anonymous</c:if>/detail?bdCd=${postReportVO.bdCd}" data-lecapp-code="${postReportVO.bdCd}">${postReportVO.bdCd}</a></td>
                <td><c:choose>
                        <c:when test="${postReportVO.prRsn eq 0}">불건전한 내용</c:when>
                        <c:when test="${postReportVO.prRsn eq 1}">주제에 맞지 않음</c:when>
                        <c:when test="${postReportVO.prRsn eq 2}">욕설 및 혐오표현</c:when>
                        <c:when test="${postReportVO.prRsn eq 3}">기타</c:when>
                    </c:choose></td>
                <td><fmt:formatDate value="${postReportVO.approvalVO.appReg}" pattern="yyyy-MM-dd" /></td>
                <td><button type="button" class="btn-two mini green" onclick="openReportModal('${postReportVO.bdCd}','${postReportVO.boardVO.bdTitle}', '${postReportVO.userVO.userNm}', '${postReportVO.userCd}', '${postReportVO.prDetail}', '${postReportVO.appCd}', '${postReportVO.prCd}')">대기</button></td>
            </tr>
        </c:if>
    </c:forEach>
</table>
<!-- 대기만 출력하는 테이블 끝 -->

</br> </br> </br>

<!-- 승인, 반려만 출력하는 테이블 시작 -->
<table>
    <tr class="table_title">
        <td>no</td>
        <td>게시글번호</td>
        <td>신고사유</td>
        <td>처리일</td>
        <td>비 고</td>
    </tr>
    <c:forEach items="${data.content}" var="postReportVO" varStatus="stat2">
        <c:if test="${postReportVO.approvalVO.appYn ne 0}">
            <tr>
                <td><span id="no_approved_${stat2.count}">${stat2.count}</span></td>
                <td><a class="detail" href="/common/board/<c:if test="${postReportVO.boardVO.comdCd eq 'BORD01'}">free</c:if><c:if test="${postReportVO.boardVO.comdCd eq 'BORD02'}">publicize</c:if><c:if test="${postReportVO.boardVO.comdCd eq 'BORD03'}">anonymous</c:if>/detail?bdCd=${postReportVO.bdCd}" data-lecapp-code="${postReportVO.bdCd}">${postReportVO.bdCd}</a></td>
                <td><c:choose>
                        <c:when test="${postReportVO.prRsn eq 0}">불건전한 내용</c:when>
                        <c:when test="${postReportVO.prRsn eq 1}">주제에 맞지 않음</c:when>
                        <c:when test="${postReportVO.prRsn eq 2}">욕설 및 혐오표현</c:when>
                        <c:when test="${postReportVO.prRsn eq 3}">기타</c:when>
                    </c:choose></td>
                <td><fmt:formatDate value="${postReportVO.approvalVO.appProdt}" pattern="yyyy-MM-dd" /></td>
                <td>
                    <c:if test="${postReportVO.approvalVO.appYn eq 1}">
                        <p>삭제</p>
                    </c:if>
                    <c:if test="${postReportVO.approvalVO.appYn eq 2}">
                        <p>반려</p>
                    </c:if>
                </td>
            </tr>
        </c:if>
    </c:forEach>
</table>
<!-- 승인, 반려만 출력하는 테이블 끝 -->

<script>
    function updateNoValues() {
        var noWaitingElements = document.querySelectorAll('[id^="no_waiting_"]');
        for (var i = 0; i < noWaitingElements.length; i++) {
            noWaitingElements[i].textContent = i + 1;
        }

        var noApprovedElements = document.querySelectorAll('[id^="no_approved_"]');
        for (var j = 0; j < noApprovedElements.length; j++) {
            noApprovedElements[j].textContent = j + 1;
        }
    }

    window.onload = updateNoValues;
</script>
</div>
<%--    <div>${data.getPagingArea()}</div> --%>
<!-- 모달 창 -->
<div class="modal fade" id="postReportModal" tabindex="-1" role="dialog"
	aria-labelledby="postReportModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content" style="width: 57%; position: absolute; top: 155px; right: 12%; height: 363px;">
			<div class="modal-header">
				</br>
				</br>
				<div class="modal-title" id="postReportModalLabel" style="position: absolute; left: 23px; font-weight: bold; font-size: 18px;">신고 게시글 정보</div>
				<button class="custom-close-btn" onclick="closeModal()">
      			  <i class="fas fa-times"></i>
   				 </button>
			</div>
			<div class="modal-body" style="height:223px;">
				<!-- 입력 폼 -->
				<div class="form-group">
					<!-- 										<label for="reportReason">상세 정보</label> -->
					<div class="modal-body" style="position: relative; left: -10px;">
						<input type="hidden" id="appCd" name="appCd" /> <input
							type="hidden" id="bdCd" name="bdCd" />



						<!-- 승인, 반려만 출력하는 테이블 시작 -->
						<table class="table" style="width: 700px;">
							<tbody class="reportbody">
								<tr>
									<th style="width: 80px;">제목</th>
									<td id="bdTitle" class="form-inline-sec" style="width: 400px; font-size: 13px;"></td>
								</tr>
								<tr>
									<th style="width: 80px;">신고자</th>
									<td id="userNm" class="form-inline-sec" style="font-size: 13px;"></td>
								</tr>
								<tr>
									<th style="width: 80px;">ID</th>
									<td id="userCd" class="form-inline-sec" style="font-size: 13px;"></td>
								</tr>
								<tr>
									<th>상세내역</th>
									<td id="prDetail" class="form-inline-thr" style="font-size: 13px;"></td>
								</tr>
								<tr>
									<th style="height: 64px;">해당게시글</th>
									<td class="form-inline-thr" id="btnTd" style="position: relative; left: -9px;"></td>
								</tr>
							</tbody>

						</table>
						<!-- 승인, 반려만 출력하는 테이블 끝 -->
					</div>
				</div>
				<div class="modal-footer">
					<div style="margin-left: 1px;">
						<button class="btn-two mini orange"
							<c:if test="${postReportVO.approvalVO.appYn == 1 or postReportVO.approvalVO.appYn == 2}">disabled</c:if>
							style="position: relative; bottom: 0px; right: -44px;"
							id="realSubmitForm">삭제</button>
						<button class="btn-two mini gray"
							style="position: relative; bottom: 0px; right: -25px;"
							<c:if test="${postReportVO.approvalVO.appYn == 1 or postReportVO.approvalVO.appYn == 2}">disabled</c:if>
							id="notSubmitForm">반려</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 모달 종료 -->
<form id="frm" action="/employee/approval/postReport" method="post">
	<input type="hidden" name="appCd" /> 
	<input type="hidden" name="bdCd" />
	<input type="hidden" name="userNm" /> 
	<input type="hidden" name="userCd" /> 
	<input type="hidden" name="approvalVO.appYn" />
	<sec:csrfInput />
</form>
<script type="text/javascript">

var jsonPostReportList = ${jsonPostReportList};
//str = str.replace(/\r\n/gi, "\\r\\n");
//var jsonPostReportList = JSON.parse(str);


function openDetailView(bdCd, comdCd) {
	
	var bdCd = button.getAttribute('data-bd-cd');
	var comdCd = button.getAttribute('data-comd-cd');

	var url = "/common/board/";
	
	if (comdCd === 'BORD01') {
			url += 'free';
	} else if (comdCd === 'BORD02') {
			url += 'publicize';
	} else if (comdCd === 'BORD03') {
			url += 'anonymous';
	}
	
	url += "/detail?bdCd=" + bdCd;
	
	// 창의 속성을 지정하는 문자열
	var windowFeatures = 'width=1200,height=1200';
	
	// 새 창 열기
	window.open(url, '_blank', windowFeatures);
}

function openReportModal(bdCd, bdTitle, userNm, userCd, prDetail, appCd, prCd){
	
	//console.log('str:', str);
	console.log('jsonPostReportList:', jsonPostReportList);
	
	$("#appCd").val(appCd);
	$("#bdCd").val(bdCd);
 	$("#bdTitle").text(bdTitle);
 	$("#userNm").text(userNm);
 	$("#userCd").text(userCd);
	//$("#bdCon").html(bdCon);
	$("#prDetail").text(prDetail);
	
	let txt = "";
	jsonPostReportList.forEach(report => {
		
		if (prCd == report.prCd) {
			txt = `
				<button class="btn-two mini gray"
	                onclick="openDetailView('\${report.bdCd}', '\${report.boardVO.comdCd}')">상세
	            </button>
			`
		}
	});
	
	$("#btnTd").html(txt);
	
	$('#postReportModal').modal('show');
}

function closeModal(){
	
	$('#postReportModal').modal('hide');
}   

function openDetailView(bdCd, comdCd) {
    var url = "/common/board/";
    
    if (comdCd === 'BORD01') {
        url += 'free';
    } else if (comdCd === 'BORD02') {
        url += 'publicize';
    } else if (comdCd === 'BORD03') {
        url += 'anonymous';
    }
    
    url += "/detail?bdCd=" + bdCd;
    
    // 창의 속성을 지정하는 문자열
   var windowFeatures = 'width=1200,height=1200';
    
    // 새 창 열기
    window.open(url, '_blank', windowFeatures);
}

$(function(){
	
	const postApply = '${postApply}';
	if(postApply == 1){
		alertSuccess('삭제를 완료하였습니다.')
	}
	
    $("#realSubmitForm").on("click", function(){
        console.log("dhktek", '${postReportVO.bdCd}');
        
        $("input[name='approvalVO.appYn']").val("1");
        $("input[name='bdCd']").val($("#bdCd").val());
        $("input[name='appCd']").val($("#appCd").val());
        $("input[name='userCd']").val($("#userCd").val());
        
        sweetAlert();
        
    });
    function  sweetAlert(){   
        Swal.fire({
	        text: "게시물을 삭제하시겠습니까?",
	        icon: "question",
	        width: 350,
	        showCancelButton: true,
	        confirmButtonColor: "#3085d6",
	        cancelButtonColor: "#d33",
	        confirmButtonText: "확인",
	        cancelButtonText: "취소"
	    }).then((result) => {
	        console.log(result);
	        if (result.isConfirmed) {
	            // "네"를 클릭했을 때의 동작
	        	//alertSuccess('삭제를 완료하였습니다.', "/employee/postreport/list");
	        	// deletePost("${boardVO.bdCd}", "${_csrf.token}");
	        	$("#frm").attr("action","/employee/approval/postReport");
	        	$("#frm").submit();
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('삭제를 취소하였습니다.');
	        }
	    });
	}
});
// function deletePost(bdCd, csrfToken) {
//     $.ajax({
//         type: "POST",
//         url: "/employee/postreport/delete", 
//         data: JSON.stringify({bdCd: bdCd}),
//         contentType: "application/json;charset=utf-8",
//         dataType: "json",
//         headers: {
//             "X-CSRF-TOKEN": csrfToken
//         },
//         success: function (data) {
//             if (data.result === "success") {
//             	$("#frm").submit();
//             } else {
//                 alertError("Delete failed.");
//             }
//         },
//         error: function (jqXHR, textStatus, errorThrown) {
//             console.error("AJAX Error:", textStatus, errorThrown);
//             alertError("에러가 발생하였습니다.");
//         }
//     });
// }
$(function(){
	
	const postApply = '${postApply}';
	if(postApply == 2){
		alertSuccess('반려하였습니다.')
	}
	
     $("#notSubmitForm").on("click", function(){
    	console.log("@1");
    	
    	$("input[name='approvalVO.appYn']").val("2"); // value를 1로 설정
    	$("input[name='bldCd']").val($("#bldCd2").val());
    	$("input[name='appCd']").val($("#appCd").val());
    	
    	
    	RetAlert();
    	// $("#frm").submit();
    	//alertSuccess('반려완료', "/employee/dormitory/list");
    	});
     function  RetAlert(){   
         Swal.fire({
 	        text: "삭제 신청을 반려하시겠습니까?",
 	        icon: "question",
 	        width: 350,
 	        showCancelButton: true,
 	        confirmButtonColor: "#3085d6",
 	        cancelButtonColor: "#d33",
 	        confirmButtonText: "네",
 	        cancelButtonText: "아니오"
 	    }).then((str) => {
 	        console.log(str);
 	        if (str.isConfirmed) {
 	            // "네"를 클릭했을 때의 동작
 	        	$("#frm").submit();
 	        } else {
 	            // "아니오"를 클릭했을 때의 동작
 	            alertError('반려를 취소하였습니다');
 	        }
 	    });
 	}
     
	});  
</script>

