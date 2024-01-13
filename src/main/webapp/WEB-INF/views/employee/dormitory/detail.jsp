<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/css/reset.css">
<link rel="stylesheet" href="/resources/css/main.css">
<style>
.form-inline {
	width: 250px;
}
.form-inline-sec {
	width: 150px;
}
.form-inline-thr {
	width: 150px;
}
.active {
	padding-left: 10px;   /* 좌측 여백 설정 */
  	padding-right: 10px;  /* 우측 여백 설정 */
}
</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<%-- <p>${dormitoryVO}</p> --%>
<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
	<div class="col-lg-12">
		<h1 class="page-header">기숙사신청정보</h1>
	</div>
</div>
<div class="panel" style="margin-left: 1px;"> 
	<div id="contAreaBox">
		<div class="panel">
			<div class="panel-body">
				<form role="form" id="domFrm" action="/employee/approval/dormitory?${_csrf.parameterName}=${_csrf.token}" method="post">
					<input type="hidden" name="domCd" id="domCd" value="${dormitoryVO.domCd}" />
					<input type="hidden" name="stuCd" id="stuCd" value="${dormitoryVO.stuCd}" />
					<input type="hidden" name="userNm" id="userNm" value="${dormitoryVO.userVO.userNm}" />
					<input type="hidden" name="stuYear" id="stuYear" value="${dormitoryVO.studentVO.stuYear}" />
<%-- 					<input type="text" name="appCd" id="appCd" value="${dormitoryVO.appCd}" /> --%>
					<input type="hidden" name="bldCd" id="bldCd" value="${dormitoryVO.bldCd}" />
					<input type="hidden" name="domYear" id="domYear" value="${dormitoryVO.domYear}" />
					<input type="hidden" name="domSem" id="domSem" value="${dormitoryVO.domSem}" />
					<input type="hidden" name="comdNm" id="comdNm" value="${dormitoryVO.bldCd}" />
					<input type="hidden" name="userTel" id="userTel" value="${dormitoryVO.userVO.userTel}" />
					<input type="hidden" name="userMail" id="userMail" value="${dormitoryVO.userVO.userMail}" />
					<input type="hidden" name="userReg1" id="userReg1" value="${dormitoryVO.userVO.userReg1}" />

					<input type="hidden" name="approvalVO.appYn" id="appYn" value="" />
					<input type="hidden" name="approvalVO.appRet" value="" />
					
					<input type="hidden" name="appCd" id="appCd" value="${dormitoryVO.approvalVO.appCd}" />
					<div class="table-responsive" style="text-align: center;">
						<table id="datatable-scroller"
							class="table table-bordered tbl_Form">
							<caption></caption>
							<colgroup>
								<col width="250px" />
								<col />
							</colgroup>
							<tbody class="domibody">
								<tr class="tr1">
									<th class="active">이름</th>
									<td class="form-inline">${dormitoryVO.userVO.userNm}</td>
									<th class="active">학번</th>
									<td class="form-inline-sec">${dormitoryVO.stuCd}</td>
									<th class="active">학년</th>
									<td class="form-inline-thr">${dormitoryVO.studentVO.stuYear}</td>
								</tr>
								<tr>
									<th class="active">전화번호</th>
									<td class="form-inline">${dormitoryVO.userVO.userTel}</td>
									<th class="active">이메일</th>
									<td class="form-inline-sec">${dormitoryVO.userVO.userMail}</td>
									<th class="active">주소</th>
									<td class="form-inline-thr">${dormitoryVO.userVO.userAddr1}</td>

								</tr>
								<tr>
									<th class="active">희망년도</th>
									<td class="form-inline">${dormitoryVO.domYear}</td>
									<th class="active">희망학기</th>
									<td class="form-inline-sec">${dormitoryVO.domSem}</td>
									<th class="active">희망동</th>
<%-- 									<td class="form-inline-thr">${dormitoryVO.bldCd}</td> --%>
									<c:if test="${dormitoryVO.bldCd == 'BULD10'}"><td class="form-inline-thr">기숙사A동</td></c:if>
									<c:if test="${dormitoryVO.bldCd == 'BULD11'}"><td class="form-inline-thr">기숙사B동</td></c:if>
								</tr>
			
							</tbody>
						</table>
					</div>
					<div style="margin-left: 1px;">
						<button type="button" class="btn btn-primary" 
						<c:if test="${dormitoryVO.approvalVO.appYn == 1 or dormitoryVO.approvalVO.appYn == 2}">disabled</c:if>
							id="realSubmitForm">승인</button>
						<button type="button" class="btn btn-primary" 
						<c:if test="${dormitoryVO.approvalVO.appYn == 1 or dormitoryVO.approvalVO.appYn == 2}">disabled</c:if>
							id="notSubmitForm">반려</button>
						<button type="button" class="btn btn-danger"
							id="cancleSubmit">취소</button>
					</div>
					<sec:csrfInput />
				</form>
			</div>
		</div>
	</div>
</div>

<!-- 모달 창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true" >
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="reportModalLabel">반려사유</h5>
            </div>
            <div class="modal-body">
                <div class="form-group">
				    <label for="reportReason">반려 사유</label>
				<textarea class="form-control" id="appRet" rows="3" placeholder="반려 사유를 입력하세요" name="approvalVO.appRet"></textarea>
				</div>
      
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" id="confirmReject">확인</button>
    			<button type="button" class="btn btn-primary" id="cancelReject">취소</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

/* logout = function() {
	$("#logoutForm").submit();
}
	
$(function(){
    $("#realSubmitForm").on("click", function(){
        console.log("dhktek");
        
    	// realSubmitForm 버튼을 클릭했을 때
        $("#appYn").val("1"); // value를 1로 설정
        // 폼을 서버로 제출
    	alertSuccess('결재완료', "/employee/dormitory/list");
    	setTimeout(() =>  $("#domFrm").submit(), 500);
    });

    $("#notSubmitForm").on("click", function(){
    	console.log("@1");
    	$("#myModal").modal("show");
    });
    
 // 모달 창의 닫기 버튼을 클릭했을 때 모달 창을 숨김
    $(".close").on("click", function(){
        $("#myModal").css("display", "none");
    });

    // 취소 버튼을 클릭했을 때 모달 창을 숨김
    $("#cancelReject").on("click", function(){
        $("#myModal").modal("hide");
    });

    // 확인 버튼을 클릭했을 때 폼을 서버로 제출
    $("#confirmReject").on("click", function(){
        // 반려 사유 가져오기
        var appRetValue = $("#appRet").val();
        
        // 로깅을 통해 값 확인
        console.log("appRet : " + appRetValue);

        // 숨겨진 input 요소에 반려 사유를 설정
        $("#lecFrm input[name='approvalVO.appRet']").val(appRetValue);
    	
        $("#appYn").val("2"); // value를 1로 설정
        // 폼을 서버로 제출
    	alertSuccess('결재완료', "/employee/dormitory/list");
    	setTimeout(() =>  $("#domFrm").submit(), 500);
    });


    $("#cancleSubmit").on("click", function(){
    	
    	alertError('결재취소', "/employee/dormitory/list");
    });
	
});	 */

</script>



