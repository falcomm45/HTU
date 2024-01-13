<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
.record_box{width:950px; height:1000px; padding:40px; background-color:#ffffff;}
.table_topic{font-size: 20px; padding-bottom:30px;}

.record_form{border:1px solid #d1d0d0; padding:30px; width:100%; height:calc(100% - 35px); border-radius:5px; position:relative;}
.record_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
/* .record_form_title p{width:120px; font-size:16px; margin-bottom:15px;} */
/* .record_form_title select, .counsel_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;} */
.record_form a:hover{color:#ffffff!important;}
.record_form input:focus{outline:none;}
.record_form textarea{resize:none;}
.record_form table th, .record_form table td{border:1px solid #888888; padding:7px; font-size:15px;}
.record_form table th{text-align:center; background-color:#ebebeb;}
#myModal .modal-header,
#myModal .modal-body,
#myModal .modal-footer {border: none; }
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div class="record_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">결재</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">강의계획서 제출목록</span>
		<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;">강의명</span>
	</div>
<form name="frm" id="lecFrm" action="/employee/approval/lectureapply?${_csrf.parameterName}=${_csrf.token}" method="post" class="record_form">
	<div class="table_topic" style="margin-bottom:40px; padding-bottom:15px; border-bottom:1px solid #d1d0d0;">강의계획신청</div>
	<input type="hidden" id="userCd" name="approvalVO.userCd" value="${userVO.userCd}" /> 
	
	<input type="hidden" name="lecaCd" id="lecaCd" value="${lectureApplyVO.lecaCd}" />         
	<input type="hidden" name="proCd" id="proCd" value="${lectureApplyVO.proCd}" />            
	<input type="hidden" name="appCd" id="appCd" value="${lectureApplyVO.appCd}" />            
	<input type="hidden" name="depCd" id="depCd" value="${lectureApplyVO.depCd}" />            
	<input type="hidden" name="roomCd" id="roomCd" value="${lectureApplyVO.roomCd}" />         
	<input type="hidden" name="approvalVO.appYn" id="appYn" value="" />                        
	<input type="hidden" name="approvalVO.appRet" value="" />                            
	                                                                                           
	<input type="hidden" name="umlSender" value="${lectureApplyVO.approvalVO.appTarget}"/>     
	<input type="hidden" name="umlReceiver" value="${lectureApplyVO.approvalVO.userCd}"/>      
	
	
	<div class="record_form_title">
		<div style="margin-bottom:10px;"></div>
		<table style="margin-bottom:40px;">
			<tr>
				<th>강의명</th>
				<td><input id="lecaNm" type="text" name="lecaNm" value="${lectureApplyVO.lecaNm}" style="width:150px; font-size:15px; border:0;" readonly="readonly"/></td>
				<th>작성자</th>
				<td>${lectureApplyVO.professorVO.userVO.userNm}</td>
				<th>개설학년</th>
				<td><input id="lecaTrg" type="number" name="lecaTrg" value="${lectureApplyVO.lecaTrg}" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>년도</th>
				<td><input id="lecaYear" type="number" name="lecaYear" value="${lectureApplyVO.lecaYear}" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></td>
				<th>학기</th>
				<td><input id="lecaSem" type="number"  name="lecaSem" value="${lectureApplyVO.lecaSem}" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></td>
				<th>대상학과</th>
				<td>${lectureApplyVO.departmentVO.depNm}<select id="depCd"  name="depCd" style="width:100px; font-size:15px; border:0;display: none;"><c:forEach var="departmentVO" items="${departmentVOList}"><option value="${departmentVO.depCd}">${departmentVO.depNm}</option></c:forEach></select></td>
			</tr>
			<tr>
				<th>정원</th>
				<td><input id="lecaCap" type="number" name="lecaCap" value="${lectureApplyVO.lecaCap}" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></td>
				<th>학점</th>
				<td><input id="lecaCrd" type="number"  name="lecaCrd" value="${lectureApplyVO.lecaCrd}" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></td>
				<th>강의시수</th>
				<td><input id="lecaPer" type="number"  name="lecaPer" value="${lectureApplyVO.lecaPer }" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>평가구분</th>
				<td><c:if test="${lectureApplyVO.lecaEva == 0}"><input type="text" id="eva" value="상대평가" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></c:if><c:if test="${lectureApplyVO.lecaEva == 1}"><input type="text" id="eva" value="절대평가" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></c:if></td>
				<th>전공유형</th>
				<td><c:if test="${lectureApplyVO.lecaType == 0}"><input type="text" id="type" value="전공필수" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></c:if><c:if test="${lectureApplyVO.lecaType == 1}"><input type="text" id="type" value="전공선택" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></c:if><c:if test="${lectureApplyVO.lecaType == 2}"><input type="text" id="type" value="교양필수" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></c:if><c:if test="${lectureApplyVO.lecaType == 3}"><input type="text" id="type" value="교양선택" style="width:100px; font-size:15px; border:0;" readonly="readonly"/></c:if></td>
				<th>강의실</th>
				<td><input type="text" id="room" value="${lectureApplyVO.roomCd}" style="width:140px; font-size:15px; border:0;" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>시작시간</th>
				<td><input type="text" id="stde" value="${lectureApplyVO.lecaStdt}" style="width:100px; font-size:15px; border:0;" readonly="readonly"/><select id="lecaStdt"  name="lecaStdt" style="width:100px; font-size:15px; border:0;display: none;"><option value="9:00">9:00</option><option value="10:00">10:00</option><option value="11:00">11:00</option><option value="12:00">12:00</option><option value="13:00">13:00</option><option value="14:00">14:00</option><option value="15:00">15:00</option><option value="16:00">16:00</option><option value="17:00">17:00</option><option value="18:00">18:00</option></select></td>
				<th>종료시간</th>
				<td><input type="text" id="eddt" value="${lectureApplyVO.lecaEddt}" style="width:100px; font-size:15px; border:0;" readonly="readonly"/><select id="lecaEddt"  name="lecaEddt" style="width:100px; font-size:15px; border:0;display: none;"><option value="9:00">9:00</option><option value="10:00">10:00</option><option value="11:00">11:00</option><option value="12:00">12:00</option><option value="13:00">13:00</option><option value="14:00">14:00</option><option value="15:00">15:00</option><option value="16:00">16:00</option><option value="17:00">17:00</option><option value="18:00">18:00</option></select></td>
				<th>받는사람</th>
				<td><input type="text" id="target" value="${lectureApplyVO.approvalVO.userCd}" style="width:100px; font-size:15px; border:0;" readonly="readonly"/><select id="approvalVO.appTarget"  name="approvalVO.appTarget" style="width:100px; font-size:15px; border:0;display: none;"><c:forEach var="empVO" items="${employeeList}"><option value="${empVO.userCd}">${empVO.userNm}</option></c:forEach></select></td>
			</tr>
			<tr>
				<th>교재 및 참고서</th>
				<td colspan="5"><input id="lecaBook" type="text" name="lecaBook" value="${lectureApplyVO.lecaBook}" style="width:600px; font-size:15px; border:0;" readonly="readonly"/></td>
			</tr>
			<tr>
				<th>비고</th>
				<td colspan="5"><input id="lecaNote" type="text" name="lecaNote" value="${lectureApplyVO.lecaNote}" style="width:600px; font-size:15px; border:0;" readonly="readonly"/></td>
			</tr>
		</table>
		<div style="margin-bottom:20px; display: flex;">
			<span>희망요일 &nbsp;:&nbsp;<span id="day">${lectureApplyVO.lecaSche}</span></span>
			<div style="display: none;">
			<span>
				<input type="checkbox" name="lecaScheC" id="lecaScheC" value="월요일"  /><span class="scSpan">월</span>
				<input type="checkbox" name="lecaScheC" id="lecaScheC" value="화요일"  /><span class="scSpan">화</span>
				<input type="checkbox" name="lecaScheC" id="lecaScheC" value="수요일"  /><span class="scSpan">수</span>
				<input type="checkbox" name="lecaScheC" id="lecaScheC" value="목요일"  /><span class="scSpan">목</span>
				<input type="checkbox" name="lecaScheC" id="lecaScheC" value="금요일"  /><span class="scSpan">금</span>
				<input type="hidden" id="lecaSche" name="lecaSche" value="" /></span>
		</div>
		</div>
		<div style="margin-bottom:10px;">
			<span>성적처리기준</span>
			<p style="font-size:12px; color:#333333; text-wrap:nowrap; display:block; margin:5px 0 0 5px!important;"> * 비율을 입력해주세요.<p>
		</div>
	    <div style="display:flex; margin-bottom:40px; align-items: center;">
	 	<div style="flex:1; display:flex; align-items: center;">
			<input type="number" name="crtrMp" id="crtrMp" value="${lectureApplyVO.crtrMp}" style="width:160px; font-size:15px; border:1px solid #888888;text-align: center;"placeholder="중간고사" readonly="readonly"/>
		</div>
		<div style="flex:1; display:flex; align-items: center;">
			<input type="number" name="crtrFp" id="crtrFp" value="${lectureApplyVO.crtrFp}" style="width:160px; font-size:15px; border:1px solid #888888;text-align: center;"placeholder="기말고사" readonly="readonly"/>
		</div>
		<div style="flex:1; display:flex; align-items: center;">
			<input type="number" name="crtrTp" id="crtrTp" value="${lectureApplyVO.crtrTp}" style="width:160px; font-size:15px; border:1px solid #888888;text-align: center;"placeholder="과제" readonly="readonly"/>
		</div>
		<div style="flex:1; display:flex; align-items: center;">
			<input type="number" name="crtrAp" id="crtrAp" value="${lectureApplyVO.crtrAp}"style="width:160px; font-size:15px; border:1px solid #888888;text-align: center;"placeholder="출결" readonly="readonly"/>
		</div>
	  </div>	
	  <div style="display:flex; flex-direction:column; margin-bottom:40px; margin-top:10px;">
	  	<p style="margin-bottom:10px;">교과목 개요</p>
	  	<textarea id="lecaCon" name="lecaCon" style="height:230px; padding:10px; line-height:20px; font-size:14px;"><c:out value="${lectureApplyVO.lecaCon}"></c:out></textarea>
	  </div>
	</div>
		<div style="display:flex; justify-content:end; margin-top:40px; position:absolute; bottom:10px; right:30px;">
			<c:if test="${lectureApplyVO.approvalVO.appYn == 0}">
				<button class="btn-two mini blue" id="realSubmitForm" type="button" style="position: relative; right: -88px;">승인</button>
				<button class="btn-two mini orange" id="notSubmitForm" type="button" style="position: relative; right: -76px;">반려</button> 
			</c:if>
				<button class="btn-two mini gray" id="cancleSubmit" type="button" style="position: relative; left: -170%; transform:translateX(-50%);">목록</button>
		</div>
	</form>	
	<sec:csrfInput />
</div>

	
	<!-- 모달 창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reportModalLabel" style="text-align: center; width: 100%;">반려사유를 기입해주세요.</h5>
            </div>
            <div class="modal-body">
                <input class="form-control" id="appRet" width="80%;" name="approvalVO.appRet" />
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-secondary" id="confirmReject" style="background-color: #3085d6">입력</button>
                <button type="button" class="btn btn-primary" id="cancelReject" style="background-color: #555555;">취소</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

logout = function() {
	$("#logoutForm").submit();
}
	
<!-- // <button onclick="alertSuccess('메세지')">zz</button> -->
// <button onclick="alertError('메세지')">ㅇㅇ</button>
$(function(){
    $("#realSubmitForm").on("click", function(){
        $("#appYn").val("1"); // value를 1로 설정
        sweetConfirmApproval();
    });
	function sweetConfirmApproval() {
	    Swal.fire({
	        text: "결재승인 하시겠습니까?",
	        icon: "question",
	        width: 300,
	        showCancelButton: true,
	        confirmButtonColor: "#3085d6",
	        cancelButtonColor: "#d33",
	        confirmButtonText: "네",
	        cancelButtonText: "아니오"
	    }).then((result) => {
	        console.log(result);
	        if (result.isConfirmed) {
	        	$("#lecFrm").submit();
	        } else {
	            alertError('결재를 취소하였습니다.');
	        }
	    });
	}


    $("#notSubmitForm").on("click", function(){
    	console.log("@1");
        $("#myModal").modal("show");
    });

    $(".close").on("click", function(){
        $("#myModal").css("display", "none");
    });

    $("#cancelReject").on("click", function(){
        $("#myModal").modal("hide");
    });

    $("#confirmReject").on("click", function(){
        var appRetValue = $("#appRet").val();
        
        console.log("appRet : " + appRetValue);

        $("#lecFrm input[name='approvalVO.appRet']").val(appRetValue);

        $("#appYn").val("2"); 
        sweetConfirmReject();
    });
	function sweetConfirmReject() {
	    Swal.fire({
	        text: "반려하시겠습니까?",
	        icon: "question",
	        width: 300,
	        showCancelButton: true,
	        confirmButtonColor: "#3085d6",
	        cancelButtonColor: "#d33",
	        confirmButtonText: "네",
	        cancelButtonText: "아니오"
	    }).then((result) => {
	        console.log(result);
	        if (result.isConfirmed) {
	        	$("#lecFrm").submit();
	        } else {
	            alertError('반려를 취소하였습니다.');
	        }
	    });
	}
    
    $("#cancleSubmit").on("click", function(){
    	location.href = "/employee/lectureapproval/list";
    });
	
});	

</script>



