<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
#datatable-scroller {
	width: 1000px;
}
.container{
	width: 1032px;
}
</style>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div class="container" style="background-color: white; margin-left: 1px;">
	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
		<div class="col-lg-12">
			</br>
			<h1 class="page-header">주차별계획</h1>
		</div>
	</div>
	<div class="panel" style="margin-left: 1px;">
		<div id="contAreaBox">
			<div class="panel">
				<div class="panel-body">
<!-- 					<form role="form" id="weekplanFrm" -->
<%-- 						action="/professor/weekplan/update?${_csrf.parameterName}=${_csrf.token}" --%>
<!-- 						method="post" > -->
						<input type="hidden" id="lecCd" name="lecCd" value="${weekplanVO.lecCd}" />
						<div class="table-responsive" style="text-align: center;">
							<table id="datatable-scroller"
								class="table table-bordered tbl_Form">
								<caption></caption>
								<colgroup>
									<col width="250px" />
									<col width="" />
								</colgroup>
								<tbody>
									<tr>
										<th class="active">강의명</th>
										<td class="form-inline"><input type="text" id="lecaNm"
											name="lecaNm" value="${weekplanVO.lectureVO.lectureApplyVO.lecaNm}" readonly
											class="form-control" style="width: 840px" />
										</td>
									</tr>
									<tr>
										<th class="active">주차</th>
										<td class="form-inline"><input type="text" id="wpNo"
											name="wpNo" class="form-control" style="width: 200px"
											value="${weekplanVO.wpNo}" readonly="readonly" /></td>
									</tr>
							
									<tr>
										<th class="active">내용</th>
										<td class="form-inline"><textarea id="wpCon" name="wpCon"
												cols="100" rows="10" class="form-control"
												style="width: 840px" readonly="readonly">${weekplanVO.wpCon}</textarea></td>
									</tr>
								</tbody>
							</table>
						</div>

                        <div style="margin-left: 1px; position: relative;">
                            <button type="button" class="btn-two mini sky" style="right: 0; bottom: 50; z-index: 1;"
                                id="btnWeekUpdate">수정</button>
                            <button type="button" id="btnWeekSubmit" class="btn-two mini sky"
                                style="right: 0; bottom: 50; display: none; z-index: 1;">제출</button>
                            <button type="button" id="btnCancle" class="btn-two mini orange"
                                style="right: 0px; bottom: 0; z-index: 1; ">뒤로가기</button>
                           <button type="button" id="btnDelete" class="btn-two mini orange"
                  				 style="right: 0px; bottom: 100; z-index: 1; ">삭제</button>
                        </div>
                        <br>
                        <div>
                        </div>
<%-- 						<sec:csrfInput /> --%>
<!-- 					</form> -->
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
logout = function() {
	$("#logoutForm").submit();
}
	
$(function(){
	$("#btnWeekUpdate").on("click", function(){
		
		 $("#wpCon").prop("readonly", false);
	     $("#btnWeekUpdate").hide(); // 숨김
	     $("#btnWeekSubmit").show(); // 보여줌
	});
	$("#btnCancle").on("click", function(){
		
		location.href = "/professor/weekplan/list?lecCd=" + ${weekplanVO.lecCd};

	});
    $("#btnWeekSubmit").on("click", function () {
    	data = {
    		"wpCon":$("#wpCon").val(),
    		"wpNo":$("#wpNo").val(),
    		"lecCd":$("#lecCd").val()
    	};
    	console.log("data", data);
		$.ajax({
			url : "/professor/weekplan/update?${_csrf.parameterName}=${_csrf.token}",
			contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data),
			type : "post",
			dataType : "json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				// 성공적으로 제출되었을 때의 로직을 처리합니다. 예: 리다이렉트 또는 메시지 표시
				console.log("result", result);
				//if문..(기본키 데이터가 있다면(selectKey에 의해 생성된))
				sweetConfirmUpdate();
			}
			
		});  	
		
    });
    
	function sweetConfirmUpdate() {
	    Swal.fire({
	        text: "주차별일정을 수정 하시겠습니까?",
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
	            // "네"를 클릭했을 때의 동작
	        	
	        	alertSuccess("수정이 완료되었습니다." ,"/professor/weekplan/list?lecCd=" + ${weekplanVO.lecCd});
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('수정을 취소하였습니다.');
	        }
	    });
	}
	$("#btnDelete").on("click", function(){
    	data = {
    			"wpNo":$("#wpNo").val(),
        		"lecCd":$("#lecCd").val()
        	};
        	console.log("data", data);
    		$.ajax({
    			url : "/professor/weekplan/delete?${_csrf.parameterName}=${_csrf.token}",
    			contentType : "application/json;charset=utf-8",
    			data : JSON.stringify(data),
    			type : "post",
    			dataType : "json",
    			beforeSend : function(xhr) {
    				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    			},
    			success : function(result) {
    				// 성공적으로 제출되었을 때의 로직을 처리합니다. 예: 리다이렉트 또는 메시지 표시
    				console.log("result", result);
    				//if문..(기본키 데이터가 있다면(selectKey에 의해 생성된))
    				sweetConfirmDelete();
    			}
    			
    		});  
		
	});
	function sweetConfirmDelete() {
	    Swal.fire({
	        text: "주차별일정을 삭제 하시겠습니까?",
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
	            // "네"를 클릭했을 때의 동작
	        	alertSuccess("삭제가 완료되었습니다." ,"/professor/weekplan/list?lecCd=" + ${weekplanVO.lecCd});
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('삭제를 취소하였습니다.');
	        }
	    });
	}
	
});	

</script>



