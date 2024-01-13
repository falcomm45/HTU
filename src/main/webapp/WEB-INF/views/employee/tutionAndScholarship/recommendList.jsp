<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.scholarship_box{width:100%;height:100%; padding:40px; background-color:#ffffff;}
	.scholarship_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.scholarship_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.scholarship_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.scholarship_box tr:first-child{background-color:#EEF1F6;}
	.scholarship_box tr:hover{background-color:#f2f3f4;}
	.scholarship_box tr:first-child:hover{background-color:#EEF1F6;}
	.scholarship_box tr td:nth-child(1){width:5%;}
	.scholarship_box tr td:nth-child(2){width:20%;}
	.scholarship_box tr td:nth-child(3){width:10%;}
	.scholarship_box tr td:nth-child(4){width:15%;}
	.scholarship_box tr td:nth-child(5){width:15%;}
	.scholarship_box tr td:nth-child(6){width:15%;}
	.scholarship_box tr td:nth-child(6){width:10%;}
	.scholarship_box tr td:nth-child(7){width:10%;}
	.newScholarshipHeader, .appList{font-size: 16px; padding-bottom:10px;}
	
	.scholarship_form{border:1px solid #d1d0d0; padding:30px; width:80%; border-radius:5px; position:relative;}
	.scholarship_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
	.scholarship_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
	.scholarship_form_title select, .crew_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
	.scholarship_margin_left{margin-left:5px;}
	.scholarship_form a:hover{color:#ffffff!important;}

	.newScholarshipList {height: 50%; margin-bottom: 30px;}
	.scholarshipList {height: 50%;}
	.modal-content {
    width: 700px;
    margin: 20px;
    padding: 20px;
    border: 1px solid #dddddd;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin: 20px;
    
}

.free_topic {
	font-size: 30px;
	padding-bottom: 30px;
}

.table_topic {
    font-size: 24px;
/*     font-weight: bold; */
    padding-bottom: 45px;
    display: flex;
    margin-left: 10px;
    position: relative;
}

.info-icon {
    font-size: 24px;
    position: absolute;
    left: 9.5%;
}

.profile_photo_wrap {
    display: flex;
    align-items: center;
    margin-top: -10px;
    margin-bottom: -18px;
    align-items: flex-end;
}

.profile_photo {
    width: 200px;
    height: 165px;
    overflow: hidden;
/*     margin-right: 20px; */
    border: 1px solid #000000;
}

.profile_photo img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.upload_form {
    display: flex;
    flex-direction: column;
    margin-top: 20px;
}

.upload_form input {
    margin-bottom: 10px;
    width: 100%;
}

.upload_form button {
    padding: 10px;
    background-color: #4caf50;
    color: #ffffff;
    border: none;
    cursor: pointer;
}

.modal-content table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
/*     border-radius: 10px; /* 모서리를 곡선으로 만듭니다. */ */
    overflow: hidden;
}

.modal-content th, .profile_wrap td {
    border: 1px solid #dddddd;
    padding: 5px;
    text-align: left;
}

.modal-content th {
    width: 147px;
    font-size: 14px;
    font-weight: bold;
/*     background-color: #f2f2f2; /* th 배경색 추가 */ */
}

.modal-content td {
    padding: 5px;
/*     font-weight: bold; */
    border: 1px solid #dddddd;
}	
.addr{
	margin-bottom: 20px;
}
.stu{
	margin-top: -15px;
}
#appRetInput{
	border: 2px solid;
	width: 78%;
}
/* #appRetModal { */
/*     text-align: center; /* 텍스트 중앙 정렬 */ */
/* } */

#appRetModal .modal-dialog {
    margin: 50px auto; /* 상하 50px, 좌우 가운데 정렬 */
}

#appRetModal .modal-content {
    width: 500px; /* 모달의 폭을 조절해 주세요 */
    margin: 0 auto; /* 가로 중앙 정렬 */
}
#appRetModal .modal-footer {
    position: relative; /* 상대 위치 설정 */
    bottom: 0; /* 아래 정렬 */
    margin-top: 20px; /* 푸터와의 간격 조절 */
    width: 475px;
}

#appRetModal .modal-content svg {
    position: absolute; /* 절대 위치 설정 */
    top: 10px; /* 위쪽 간격 조절 */
    right: 10px; /* 오른쪽 간격 조절 */
}

#appRetModal .modal-content {
    width: 500px; /* 모달의 폭을 조절해 주세요 */
    margin: 0 auto; /* 가로 중앙 정렬 */
}
</style>
<div class="scholarship_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/tuition/list">등록/장학</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/schlship/schlshipList">장학</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/tutionAndScholarship/recommendList">교수 추천 내역</a></span>
	</div>
	<div class="table_topic">교수 추천 내역<i class="fa-solid fa-circle-info" style="color: #333333; position: absolute; left: 140px;" ></i></div>
	<div class="newCrewList">
	<div class="scholarshipList">
<%-- 		<p>${list}</p> --%>
		<div class="crTb">
			<table>
				<tr class="table_title">
					<th>no</th>
					<th>학과/교수</th>
					<th>학생이름</th>
					<th>신청일</th>
					<th>처리일</th>
					<th>학생정보</th>
					<th>승인여부</th>
					<th>비고</th>
				</tr>
				<c:forEach var="scholarApplyVO" items="${list}" varStatus="stat">
<%-- 					<input class="scrCd" value="${scholarApplyVO.scrCd}" /> --%>
<%-- 					<input class="appCd" value="${scholarApplyVO.approvalVO.appCd}" /> --%>
			        	<tr>
			        	
							<td>${stat.count}</td>
							<td>${scholarApplyVO.professorVO.departmentVO.depNm}/${scholarApplyVO.proNm}</td>
							<td>${scholarApplyVO.userVO.userNm}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${scholarApplyVO.approvalVO.appReg}"></fmt:formatDate></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${scholarApplyVO.approvalVO.appProdt}"></fmt:formatDate></td>
					        <td>
								<button type="button" id="btnOpenModal" class="btn-two mini green" data-app-cd="${scholarApplyVO.approvalVO.appCd}" 
								onclick="openStudentModal('${scholarApplyVO.studentVO.stuCd}','${scholarApplyVO.approvalVO.appCd}','${scholarApplyVO.approvalVO.appYn}')">상세</button>
							</td>
					        <td>
					        	<c:if test="${scholarApplyVO.approvalVO.appYn eq 0}">
							 		대기
								</c:if>
								<c:if test="${scholarApplyVO.approvalVO.appYn eq 1}">
									승인
								</c:if>
								<c:if test="${scholarApplyVO.approvalVO.appYn eq 2}">
									반려
								</c:if>
							</td>
							<td>
							<c:if test="${scholarApplyVO.approvalVO.appYn eq 2}">
								<button class="btn-two gray mini btnCompanion" data-app-ret="${scholarApplyVO.approvalVO.appRet}">반려사유</button>
							</c:if>
							</td>
			        	</tr>
				</c:forEach>
			</table>
			</div>
		</div>
	</div>
</div>

<!-- 모달 창 -->
	<div class="modal fade" id="studentModal" tabindex="-1" role="dialog" aria-labelledby="studentModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
			    	<svg onclick="closeStudentModal()" xmlns="http://www.w3.org/2000/svg" height="16" width="12" 
			   			 viewBox="0 0 384 512" style="cursor: pointer; margin-left: 630px;">
			    		<path fill="#333333" d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
			    	</svg>
			    <div style="width: 600px; height: 100%; margin: 0 auto">
			        <div class="table_topic">학생 정보</div>
	            <div class="modal-body" id="studentDetails" style="margin-top: -30px;"> 
	                <!-- 학생 정보를 동적으로 표시할 부분 -->
	            </div>
	            <div class="modal-footer">
	                <div style="margin-left: 1px;">
<%-- 	                   <button class="btn-two blue mini " onclick="confirmRecommend(${scholarApplyVO.scrCd})">승인</button> --%>
	                   <button class="btn-two blue mini " id="confirmRecommend" type="button">승인</button>
	                   <button class="btn-two red mini " id="nonRecommend" type="button">반려</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>		
	<div class="modal fade" id="appRetModal" tabindex="-1" role="dialog" aria-labelledby="appRetModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content" style="margin-top: 200px; margin-left: 100px;">
			    	<svg onclick="closeAppRetModal()" xmlns="http://www.w3.org/2000/svg" height="16" width="12" 
			   			 viewBox="0 0 384 512" style="cursor: pointer; margin-left: 630px;">
			    		<path fill="#333333" d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
			    	</svg>
			    <div style="width: 600px; height: 100%; margin: 0 auto">
			        <div class="table_topic" style="width:400px;">반려사유를 기입해주세요.</div>
	            <div class="modal-body" style="margin-top: -30px;"> 
	            	<input type="text" id="appRetInput" name="appRetInput" />
	            </div>
	            <div class="modal-footer">
	                <div style="margin-left: 1px;">
<%-- 	                   <button class="btn-two blue mini " onclick="confirmRecommend(${scholarApplyVO.scrCd})">승인</button> --%>
	                   <button class="btn-two blue mini " id="appRetApply" type="button">확인</button>
	                   <button class="btn-two red mini " id="nonAppRetApply" onclick="closeAppRetModal()" type="button">취소</button>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
</div>		
<!-- 모달 종료 -->
	<form id="frm" action="/employee/approval/recommend" method="post">
		<input type="hidden" id="appCd" name="appCd" value=""/>
		<input type="hidden" name="srcCd" />
		<input type="hidden" id="appYn" name="approvalVO.appYn" value="" />
		<input type="hidden" id="appRet" name="appRet" value=""/>
		<sec:csrfInput/>
	</form>	
<script type="text/javascript">
function openStudentModal(stuCd,appCd,appYn) {
	console.log("appCd : " + appCd, "appYn : " + appYn);
	$("#appCd").val(appCd);
	
	let data = { "stuCd": stuCd,
				 "appCd": appCd,
				 "appYn": appYn
				};
	console.log("data : ",data);
	
// 	$('.modal-footer').on('show.bs.modal', function (event) {
//         const appYnValue = $('#appYn').val();
// 		console.log(appYn);
//         // 대기 상태인 경우에만 버튼 보이기
//         if (appYnValue == '0') {
//             $('#confirmRecommend, #nonRecommend').show();
//         } else {
//             $('#confirmRecommend, #nonRecommend').hide();
//         }
//     });
	
    $.ajax({
        type: "post",
        url: "/employee/tutionAndScholarship/getStudent",
        data: JSON.stringify(data),
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
        success: function(data) {
            // 받아온 학생 정보를 모달에 표시
            console.log(data);
            displayStudentDetails(data);
            // 모달 열기
            $('#studentModal').modal('show');
        },
        error: function(error) {
            console.error("Error fetching student details: " + error);
        }
    });
}

// 학생 정보를 모달에 표시하는 함수
function displayStudentDetails(student) {
    // 받아온 학생 정보를 모달에 동적으로 설정
    console.log(student);
    
    let txt = 
    	'<svg xmlns="http://www.w3.org/2000/svg" height="18" width="18" viewBox="0 0 512 512"><path fill="#751c35" d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>' +
        '<span style="margin-left:5px;">인적정보</span>'+
        '<div class="profile_photo_wrap">' +
            '<div class="profile_photo">';
	if (student.filesDetailVO != null) txt += '<img src="/resources/upload/' + student.filesDetailVO.fileSvnm + '" alt="Profile Photo" id="profileImage">';
	else txt += '<img src="/resources/images/unknownperson.jpg" alt="Profile Photo" id="profileImage">';
    txt += '</div>' +
        '<table>' +
            '<tr><th>학번</th><td id="stuCd">' + student.stuCd + '</td></tr>' +
            '<tr><th>이름</th><td>' + student.userVO.userNm + '</td></tr>' +
            '<tr><th>이름(영문)</th><td>' + student.userVO.userNme + '</td></tr>' +
            '<tr><th>주민등록번호</th><td>' + student.userVO.userReg1 + '-*******</td></tr>' +
            '<tr><th>전화번호</th><td>' + student.userVO.userTel + '</td></tr>' +
            '<tr><th>우편번호</th><td>' + student.userVO.userZip + '</td></tr>' +
        '</table>'+
        '</div>' +
        '<div class="addr">' +
        '<table>' +
            '<tr><th>주소</th><td>' + student.userVO.userAddr1 + '</td></tr>' +
            '<tr><th>상세주소</th><td>' + student.userVO.userAddr2 + '(' + student.userVO.userZip + ')</td></tr>' +
            '<tr><th>이메일</th><td>' + student.userVO.userMail + '</td></tr>' +
       '</table>'+ 
       '</div>' +
       '<svg xmlns="http://www.w3.org/2000/svg" height="18" width="18" viewBox="0 0 512 512"><path fill="#751c35" d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>' +
       '<span style="margin-left:5px;">학적정보</span>'+
       '<div class="stu">' +
       '<table>' +    
            '<tr><th>학년</th><td>' + student.stuYear + '학년</td></tr>' +
            '<tr><th>학기</th><td>' + student.stuSem + '학기</td></tr>' +
            '<tr><th>입학일자</th><td>' + new Date(student.stuAddt).toLocaleDateString() + '</td></tr>' +
            '<tr><th>학점</th><td>' + 4.2 + '</td></tr>' +
       '</table>'+
       '</div>' ;
    
    $('#studentDetails').html(txt);
}


function closeStudentModal(){
	$('#studentModal').modal('hide');
}  

function closeAppRetModal(){
	$('#appRetModal').modal('hide');
}  


$(function(){
	const recommendApply = '${recommendApply}';
	if (recommendApply == 1){
		alertSuccess('승인이 완료되었습니다.');
		
		$("#confirmRecommend, #nonRecommend").hide();
	}
	
    $("#confirmRecommend").on("click", function(){
    	
        sweetAlert();
        
    function  sweetAlert(){   
        Swal.fire({
	        text: "추천 신청을 승인하시겠습니까?",
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
	            $("#appCd").val();
	            $("#appYn").val('1');
	        	$("#frm").submit();
	       
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	        }
	    });
	}
});
});
$(function(){
	
	$(".btnCompanion").on("click", function() {
		const appRet = $(this).data("appRet");
		console.log("appRet : ", appRet);
		alertInfo(appRet);
	})

	function alertInfo(appRet) {
		appRet = appRet.slice(0,30) + "<br>" + appRet.slice(30);
		Swal.fire({
			html: '<i class="fa-solid fa-circle-info" style="color: #333333;"></i>  반려사유 : ' + appRet,
			width: 600,
			padding: 30,
			position: "center",
			confirmButtonColor: "#333333",
			confirmButtonText: "확인",
		});
	}
	
	const recommendApply = '${recommendApply}';
	if (recommendApply == 2){
		alertSuccess('반려를 완료하였습니다.');
		
		$("#confirmRecommend, #nonRecommend").hide();
	}
	
    $("#nonRecommend").on("click", function(){
        console.log("@1");
        

        $('#appRetModal').modal('show');
        
        $("#appRetApply").on("click", function(){
            const appRet = $("#appRetInput").val();
        	
            $("#appYn").val('2');
            $("#appRet").val(appRet);

            // 폼을 서브밋
            $("#frm").submit();
            
	        $("#nonAppRetApply").on("click", function(){
	            // 모달을 닫기만 하거나 다른 취소 동작을 추가할 수 있습니다.
	            $('#appRetModal').modal('hide');
	        });    
	    });
            
        //RetAlert();
        /*
        $(document).off('focusin.modal');
        
        fixBootstrapModal();
                
        //function RetAlert(){   
        //    Swal.fire({
        //        text: "추천 신청을 반려하시겠습니까?",
        //        icon: "question",
        //        width: 350,
        //        showCancelButton: true,
        //        confirmButtonColor: "#3085d6",
        //        cancelButtonColor: "#d33",
        //        confirmButtonText: "네",
        //        cancelButtonText: "아니오"
        //    }).then((result) => {
        //        console.log(result);
        //        if (result.isConfirmed) {
                    // "네"를 클릭했을 때의 동작
                    Swal.fire({
	                    text: "반려사유를 기입해주세요.",
	                    input: "text",
	                    inputAttributes: {
	                        autocapitalize: "off"
	                    },
	                    showCancelButton: true,
	                    confirmButtonText: "입력",
	                    cancelButtonText: "취소",
	                    confirmButtonColor: "#3085d6",
	                    cancelButtonColor: "#555555"
	                }).then((reasonResult) => {
	                    if (reasonResult.isConfirmed) {
	                        // 입력 확인을 눌렀을 때의 동작
	                        const appRet = reasonResult.value;
	                        $("#appYn").val('2');
	                        $("#appRet").val(appRet);
	                        $("#frm").submit();
	                        restoreBootstrapModal();
	                    } else {
	                        // 취소를 눌렀을 때의 동작
	                        alertError('반려를 취소하였습니다');
	                        restoreBootstrapModal();
	                    }
	                });
         //       } else {
                    // "아니오"를 클릭했을 때의 동작
         //           alertError('반려를 취소하였습니다');
         //       }
         //   });
        //}
        
        */
    });
});
//call this before showing SweetAlert:
function fixBootstrapModal() {
  var modalNode = document.querySelector('.modal[tabindex="-1"]');
  if (!modalNode) return;

  modalNode.removeAttribute('tabindex');
  modalNode.classList.add('js-swal-fixed');
}

// call this before hiding SweetAlert (inside done callback):
function restoreBootstrapModal() {
  var modalNode = document.querySelector('.modal.js-swal-fixed');
  if (!modalNode) return;

  modalNode.setAttribute('tabindex', '-1');
  modalNode.classList.remove('js-swal-fixed');
}
</script>






































































