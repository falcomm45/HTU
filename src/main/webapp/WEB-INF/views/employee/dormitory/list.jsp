<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
.dormi_box {
	width: 100%; height:100%; overflow-y:scroll;
	padding: 40px;
	background-color: #ffffff;
}

.dormi_box .table_topic {
	font-size: 20px;
	padding-bottom: 30px;
}

.dormi_box .table_topic i {
	margin-left: 10px;
}

.dormi_box table {
	font-size: 14px;
	width: 100%;
	text-align: center;
}

.table_title-1 {
	font-size: 13px;
	border-top: 1px solid #d1d0d0;
	border-bottom: 1px solid #d1d0d0;
	height: 32px;
	line-height: 32px;
}

/* /////////////////여기가 수정시작!!  */
.dormi_box tr {
	height: 40px;
	border-bottom: 1px solid #ebebeb;
}

.dormi_box tr:first-child {
	background-color: #EEF1F6;
}

.dormi_box tr:hover {
	background-color: #f2f3f4;
}

.dormi_box tr:first-child:hover {
	background-color: #EEF1F6;
}
/* /////////////////여기가 수정끝!!  */
.dormi_box tr {
	height: 40px;
}

.dormi_box tr td:nths-child(1) {
	width: 6%;
}

.dormi_box tr td:nth-child(2) {
	width: 16%;
}

.dormi_box tr td:nth-child(3) {
	width: 15%;
}

.dormi_box tr td:nth-child(4) {
	width: 15%;
}

.dormi_box tr td:nth-child(5) {
	width: 15%;
}

.dormi_box tr td:nth-child(6) {
	width: 15%;
}

.dormi_box tr td:nth-child(7) {
	width: 18%;
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
        
.modalTable {
        border-collapse: collapse;
        width: 100%;
    }

    .modalTable tr {
        border: 1px solid #dddddd;
    }

    .modalTable th, .modalTable td {
/*         border: 1px solid #dddddd; */
        padding: 8px;
        text-align: left;
    }

    .modalTable th {
        background-color: #f2f2f2;
/*         border-radius: 10px; */
        width: 4%;
        font-weight: bold;
    }

    .modalTable td {
        width: 30%; /* 조절 가능한 너비 */
    }

    .modalTable tr {
        border: none; /* 가로 선 제거 */
    }
</style>
<%-- <p>${data.content}</p> --%>
<div class="dormi_box" style="background-color: white;">
	<div style="font-size: 12px; color: #888888; margin-bottom: 20px;">
		<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13"
				width="13" viewBox="0 0 576 512" style="margin-right: 5px;">
				<path fill="#888888"
					d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z" /></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/employee/lectureapproval/list">결재</a></span>
		<span style="font-size: 12px; color: #888888;">></span> <span
			style="font-size: 12px; color: #888888;"><a href="/employee/dormitory/list">기숙사관리</a></span> <span
			style="font-size: 12px; color: #888888;">></span> <span
			style="font-size: 12px; color: #888888;"><a href="/employee/dormitory/list">기숙사 신청 내역</a></span>
	</div>
	<div class="table_topic">
		기숙사 신청 내역
	</div>

	<!-- 상세만 출력하는 테이블 시작 -->
	<table>
		<tr class="table_title"
			style="border-top: 1px solid #333333 !important; border-bottom: 1px solid #333333 !important;">
			<td>no</td>
			<td style="text-align: center;">등록번호</td>
			<td>학번</td>
			<td>이름</td>
			<td>신청일</td>
			<td>승인여부</td>
			<td>비 고</td>
		</tr>
		<c:forEach var="dormitoryVO" items="${data.content}" varStatus="stat1">
			<c:if test="${dormitoryVO.approvalVO.appYn eq 0}">
				<tr>
					<td><span id="no1"></span></td>
					<td style="text-align: center;">${dormitoryVO.domCd}</td>
					<td>${dormitoryVO.stuCd}</td>
					<td>${dormitoryVO.userVO.userNm}</td>
					<td><fmt:formatDate value="${dormitoryVO.approvalVO.appReg}"
							pattern="yyyy-MM-dd" /></td>
					<td>
						<button class="btn-two mini gray" id="btnStandby"
							style="text-align: center;"
							onclick="openModal( '${dormitoryVO.domCd}', '${dormitoryVO.userVO.userNm}'
                        , '${dormitoryVO.stuCd}', '${dormitoryVO.studentVO.stuYear}', '${dormitoryVO.userVO.userTel}'
                        , '${dormitoryVO.userVO.userMail}', '${dormitoryVO.userVO.userAddr1}'
                        , '${dormitoryVO.domYear}', '${dormitoryVO.domSem}','${dormitoryVO.bldCd}','${dormitoryVO.appCd}')">상세
						</button>
					</td>
					<td>${dormitoryVO.approvalVO.appRet}</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<!-- 상세만 출력하는 테이블 끝 -->
	</br> </br> </br>

	<!-- 승인,반려만 출력하는 테이블 시작 -->
	<table>
		<tr class="table_title"
			style="border-top: 1px solid #333333 !important; border-bottom: 1px solid #333333 !important;">
			<td>no</td>
			<td style="text-align: center;">등록번호</td>
			<td>학번</td>
			<td>이름</td>
			<td>신청일</td>
			<td>승인여부</td>
			<td>비 고</td>
		</tr>
		<c:forEach var="dormitoryVO" items="${data.content}" varStatus="stat2">
			<c:if test="${dormitoryVO.approvalVO.appYn ne 0}">
				<tr>
					<td><span id="no2"></span></td>
					<td style="text-align: center;">${dormitoryVO.domCd}</td>
					<td>${dormitoryVO.stuCd}</td>
					<td>${dormitoryVO.userVO.userNm}</td>
					<td><fmt:formatDate value="${dormitoryVO.approvalVO.appReg}"
							pattern="yyyy-MM-dd" /></td>
					<td><c:if test="${dormitoryVO.approvalVO.appYn eq 1}">
							<p>승인</p>
						</c:if> <c:if test="${dormitoryVO.approvalVO.appYn eq 2}">
							<p>반려</p>
						</c:if></td>
					<td>
						<c:if test="${dormitoryVO.approvalVO.appYn eq 2}">
							<button class="btn-two gray mini btnCompanion" data-app-ret="${dormitoryVO.approvalVO.appRet}">반려사유</button>
						</c:if>
					</td>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<!-- 승인,반려만 출력하는 테이블 끝 -->

	<script>
    // JavaScript 함수를 사용하여 각 테이블의 no 값 처리
    function updateNoValues() {
        var no1Elements = document.querySelectorAll('#no1');
        for (var i = 0; i < no1Elements.length; i++) {
            no1Elements[i].textContent = i + 1;
        }

        var no2Elements = document.querySelectorAll('#no2');
        for (var j = 0; j < no2Elements.length; j++) {
            no2Elements[j].textContent = j + 1;
        }
    }

    // 페이지 로드 후 no 값 업데이트
    window.onload = updateNoValues;
</script>


</div>
<%-- 					<div>${data.getPagingArea()}</div> --%>
<input id="domCd" name="domCd" type="hidden"
	value='${dormitoryVO.domCd}' />
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
	
<!-- 기숙사 신청정보 모달 시작 -->
<div class="modal fade" id="domiModal" tabindex="-1" role="dialog" aria-labelledby="domiModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content" style="position: absolute; top: 155px; right: 12%; width: 65%;">
            <div class="modal-header">
                </br>
                </br>
                <div class="modal-title" id="domiModalLabel" style="position: absolute; left: 23px; font-weight: bold; font-size: 18px;">기숙사 신청 정보</div>
                <button class="custom-close-btn" onclick="closeModal()">
      			  <i class="fas fa-times"></i>
   				 </button>
            </div>
            <div class="modal-body">
                <!-- 입력 폼 -->
                <div class="form-group">
                    <div class="modal-body">
                        <input type="hidden" id="appCd" name="appCd" />
                        <input type="hidden" id="bldCd2" name="bldCd" />
                        <table class="modalTable" style="width: 700px;">
                            <tbody class="domibody" style="position: relative; left: -16px; top: -10px;">
								<tr>
									<th class="mdaol-th">학번</th>
									<td id="stuCd" class="form-inline-sec"></td>
								</tr>
								<tr>
									<th class="mdaol-th">이름</th>
									<td id="userNm" class="form-inline-sec" style="width: 270px;"></td>
								</tr>
								<tr>
									<th>학년</th>
									<td id="stuYear" class="form-inline-thr"></td>
								</tr>
								<tr>
									<th>전화번호</th>
									<td id="userTel" class="form-inline"></td>
								</tr>
								<tr>
									<th>이메일</th>
									<td id="userMail" class="form-inline-sec"></td>
								</tr>
								<tr>
									<th>주소</th>
									<td id="userAddr1" class="form-inline-thr"></td>
								</tr>
								<tr>
									<th>희망년도</th>
									<td id="domYear" class="form-inline"></td>
								</tr>
								<tr>
									<th>희망학기</th>
									<td id="domSem" class="form-inline-sec"></td>
								</tr>
								<tr>
									<th class="active">희망동</th>
									<td id="bldCd" class="form-inline-thr">기숙사A동</td>
								</tr>
							</tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <div style="margin-left: 1px;">
                        <button class="btn-two mini blue"
                        style="position: relative ; right: -45px; bottom: 0px;"
                         <c:if test="${dormitoryVO.approvalVO.appYn == 1 or dormitoryVO.approvalVO.appYn == 2}">disabled</c:if> id="realSubmitForm">승인</button>
                        <button class="btn-two mini orange" 
                        style="position: relative ; right: -26px; bottom: 0px;"
                        <c:if test="${dormitoryVO.approvalVO.appYn == 1 or dormitoryVO.approvalVO.appYn == 2}">disabled</c:if> id="notSubmitForm">반려</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 기숙사 신청정보 모달 종료 -->


<form id="frm" action="/employee/approval/dormitory" method="post">
	<input type="hidden" name="appCd" /> <input type="hidden" name="bldCd" />
	<input type="hidden" name="stuCd" /> <input type="hidden"
		name="approvalVO.appYn" />
	<sec:csrfInput />
</form>
<script type="text/javascript">
function openModal(domCd, userNm, stuCd, stuYear, userTel, userMail, userAddr1, domYear, domSem, bldCd, appCd) {
	   console.log("domCd : " + domCd + ", bldCd : " + bldCd + ", appCd : " + appCd + ", stuCd : " + stuCd + ", stuYear : " + stuYear);
	
	   $("#userNm").text(userNm);
	   $("#stuCd").text(stuCd);
	   $("#stuYear").text(stuYear);
	   $("#userTel").text(userTel);
	   $("#userMail").text(userMail);
	   $("#userAddr1").text(userAddr1);
	   $("#domYear").text(domYear);
	   $("#domSem").text(domSem);
	   $("#appCd").val(appCd);
	   $("#bldCd2").val(bldCd);
	   
	   if(bldCd=="BULD10"){
		   bldCd = "기숙사A동";
	   }else{
		   bldCd = "기숙사B동";
	   }
	   
	   $("#bldCd").text(bldCd);
	   $("#stuCd").val(stuCd);
	   
	   // 모달 열기
       $('#domiModal').modal('show');
}//end openModal

function closeModal(){
	
	$('#domiModal').modal('hide');
}    

$(function(){
	
	const domiApply = '${domiApply}';
	if (domiApply == 1){
		alertSuccess('승인이 완료되었습니다.');
		
		$("#confirmRecommend, #nonRecommend").hide();
	}
	
    $("#realSubmitForm").on("click", function(){
        console.log("dhktek", '${dormitoryVO.stuCd}');
        
        $("input[name='approvalVO.appYn']").val("1");
        $("input[name='bldCd']").val($("#bldCd2").val());
        $("input[name='appCd']").val($("#appCd").val());
        $("input[name='stuCd']").val($("#stuCd").val());
        
        sweetAlert();
        
    });
    function  sweetAlert(){   
        Swal.fire({
	        text: "기숙사 신청을 승인하시겠습니까?",
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
	        	$("#frm").submit();
	        	//alertSuccess('승인을 완료하였습니다.', "/employee/dormitory/list");
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('승인을 취소하였습니다.');
	        }
	    });
	}
});
$(function(){
	
	const domiApply = '${domiApply}';
	if (domiApply == 2){
		alertSuccess('반려를 완료하였습니다.');
		
		$("#confirmRecommend, #nonRecommend").hide();
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
 	        text: "기숙사 신청을 반려하시겠습니까?",
 	        icon: "question",
 	        width: 350,
 	        showCancelButton: true,
 	        confirmButtonColor: "#3085d6",
 	        cancelButtonColor: "#d33",
 	        confirmButtonText: "확인",
 	        cancelButtonText: "취소"
 	    }).then((str) => {
 	        console.log(str);
 	        if (str.isConfirmed) {
 	            // "네"를 클릭했을 때의 동작
 	        	$("#frm").submit();
 	        } else {
 	            // "아니오"를 클릭했을 때의 동작
 	            alertError('반려를 취소하였습니다.');
 	        }
 	    });
 	}
     
	});  

// 모달 창의 닫기 버튼을 클릭했을 때 모달 창을 숨김
//     $(".close").on("click", function(){
//         $("#myModal").css("display", "none");
//     });

//     // 취소 버튼을 클릭했을 때 모달 창을 숨김
//     $("#cancelReject").on("click", function(){
//         $("#myModal").modal("hide");
//     });

    // 확인 버튼을 클릭했을 때 폼을 서버로 제출
//     $("#confirmReject").on("click", function(){
//         // 반려 사유 가져오기
//         var appRetValue = $("#appRet").val();
        
        // 로깅을 통해 값 확인
//        console.log("appRet : " + appRetValue);

        // 숨겨진 input 요소에 반려 사유를 설정
 //       $("#lecFrm input[name='approvalVO.appRet']").val(appRetValue);
    	
       // $("input[name='appCd']").val($("#appCd").val(2)); // value를 1로 설정
        // 폼을 서버로 제출
//    	setTimeout(() =>  $("#domFrm").submit(), 500);

//});

</script>