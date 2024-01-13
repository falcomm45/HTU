<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
 	.dataTables_paginate paging_simple_numbers{margin: 0 auto;}
 	.col-sm-12 col-md-7{margin: 0 auto;}
 	.mail_toolbar {
	margin-left: 25px;
	padding: 10px;
	webkit-box-flex: 0;
	-webkit-flex: 0 0 auto;
	flex: 0 0 auto;
	position: relative;
	top: auto;
	right: auto;
	left: auto;
	margin: 0 25px;
	-webkit-box-flex: 0;
	flex: 0 0 auto;
	position: relative;
	top: auto;
	right: auto;
	left: auto;
	-webkit-box-align: center;
	align-items: center;
	border-top: 1px solid #ddd;
	justify-content: space-between;
}

.mail_toolbar.type_write {
	display: flex;
	flex-wrap: wrap;
	height: 50px;
	margin: 0px;
}
.mail_toolbar_task {
	display: flex;
}
.mail_btn {
	margin: 0 5px 0 9px;
	padding: 3px 10px;
	outline: none;
	line-height: 20px;
	background-color: transparent;
 	cursor: pointer;
	touch-action: manipulation;
	border: 0;
}
.button_group {
	display: flex;
    padding-left: 25px;
    justify-content: space-evenly;
}
</style>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
    <link rel="stylesheet" href="/resources/test/fonts/icomoon/style.css">
   
    <!-- Style -->
    <link rel="stylesheet" href="/resources/test/css/style.css">
</head>
<body>
<sec:authentication property="principal.userVO" var="userVO"/>
<div class="divMailbox" style="height:calc(100% - 40px);">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
				<c:if test="${userVO.comdCd == 'USER01'}">
<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER02'}">		
<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER03'}">		
<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>
	
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/mail/inbox">메일</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/mail/tempMailBox">임시 보관함</a></span>
	</div>
	<div class="mailHeader">
		<div class="mailHeaderName">임시 보관함</div>
		<!------- 검색기능 ------->
		<form class="mailSearchForm" action="/mail/inbox" method="get">
			<input type="text" name="keyword" class="mailSearch" value="<c:out value='${pageMaker.cri.keyword}'/>" placeholder="메일 검색" /> 
			<input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum}'/>" /> 
			<input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount}' />" />
			<input type="image" src="/resources/images/free-icon-search-149852.png" name="submit" class="mailSearchBtn" value="검색" />
			<select class="searchSelect" name="type">
				<option value=""
					<c:out value='${pageMaker.cri.type == null? "selected": ""}'/>>선택</option>
				<option value="T"
					<c:out value='${pageMaker.cri.type eq "T"?"selected": "" }'/>>제목</option>
				<option value="C"
					<c:out value='${pageMaker.cri.type eq "C"?"selected": "" }'/>>내용</option>
				<option value="W"
					<c:out value='${pageMaker.cri.type eq "W"?"selected": "" }'/>>작성자</option>
			</select> 
		</form>
		<!------- 검색기능 끝------->
<!-- 		<div class="mailSearchForm"> -->
<!-- 			<form> -->
<!-- 				<input class="mailSearch" type="text" placeholder="메일 검색" name="keyword" -->
<%-- 					value="${keyword}" /> --%>
<!-- 				<input type="image" src="/resources/images/free-icon-search-149852.png" name="submit" class="mailSearchBtn" value="검색" /> -->
<!-- 			</form> -->
<!-- 		</div> -->
	</div>
	<div class="mailTotal">
		<span>총 </span><span style="color: #008ee5; vertical-align: middle;">${total}</span><span>개의 메일</span>
	</div>
	<div class="containerMail">
	<!-- ----------------------------------------------------------------------------- -->
	<div class="mail_toolbar type_write">
		<div class="mail_toolbar_task">
			<label class="control control--checkbox">
				<input type="checkbox" class="js-check-all" name="mailCheck"/>
				<div class="control__indicator"></div>
	        </label>
			<div class="button_group">
				<div class="button_task_wrap">
					<c:choose>
						<c:when test="${empty data}">
							<button class="mail_btn" type="button" disabled="disabled">
								<span class="text" style="font-weight: bold; font-size: 14px;">삭제</span>
							</button>
						</c:when>
						<c:otherwise>
							<button id="btnDelete" class="mail_btn" type="button" style="padding-left: 37px;">
								<span class="text" style="font-weight: bold; font-size: 14px;">삭제</span>
							</button>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
<!-- ----------------------------------------------------------------------------- -->	
	    <table class="table custom-table">
	      <tbody>
	      	<c:if test="${empty data}">
				<div style="text-align: center; padding-top: 75px; color: #333333; font-size: 14px; border-top: 1px solid #ddd;">임시 보관한 메일이 없습니다.</div>
			</c:if>
	      	<c:forEach var="univMailVO" items="${data}">
	         <tr>
	           <th scope="row" style="width: 5%;">
	             <label class="control control--checkbox">
	               <input type="checkbox" name="mailCheck"  data-uml-cd="${univMailVO.umlCd}"/>
	               <div class="control__indicator"></div>
	             </label>
	           </th>
	           <td style="width: 15%;">
	             ${univMailVO.userVO.userNm}
	           </td>
	           <td style="width: 60%;">
	           	<a class="mailTitle" href="/mail/tempMail?umlCd=${univMailVO.umlCd}" style="color: #333333">${univMailVO.umlTitle}</a>
	           </td>
	           <td style="width: 20%; text-align: right;"><fmt:formatDate pattern="MM월 dd일 HH:mm" value="${univMailVO.umlReg}"/> </td>
	         </tr>
	        </c:forEach>
	      </tbody>
	    </table>
	</div>
</div>
<!-- 페이지네이션 -->
<div style="background-color:#fff; position:relative; width:100%; height:40px;">
	${articlePage.getPagingArea()}
</div>
    <script src="/resources/test/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/test/js/popper.min.js"></script>
    <script src="/resources/test/js/bootstrap.min.js"></script>
    <script src="/resources/test/js/main.js"></script>
</body>
<script type="text/javascript">
$(function(){
	
	$("#btnDelete").prop("disabled", true);
	
	$('input:checkbox[name=mailCheck]').on('change', function() {
		$("#btnDelete").prop("disabled", !$('input:checkbox[name=mailCheck]:checked').length > 0);
	});
	
	$("#btnDelete").on("click", function(){
		let deleteArr = [];

		$('input:checkbox[name=mailCheck]').each(function(index) {
			if ($(this).is(":checked") == true) {
				deleteArr.push($(this).data("umlCd"));
			}
		});
		
		Swal.fire({
	      text: "선택된 메일을 삭제하시겠습니까?",
	      icon: 'question',
	      width: 400,
	      position:'top',
	      showCancelButton: true,
	      confirmButtonColor: '#3085d6',
	      cancelButtonColor: '#d33',
	      confirmButtonText: '삭제',
	      cancelButtonText:  '취소',
	    }).then((result) => {
	    	console.log(result);
	    	if (result.isConfirmed) {
	    		$.ajax({
					url : "/mail/deleteCheck",
					contentType : "application/json; charset=utf-8",
					data : JSON.stringify(deleteArr),
					type : "post",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}",
								"${_csrf.token}");
					},
					success : function(res) {
	 					alertSuccess('메일이 삭제되었습니다.', '/mail/tempMailBox');
					}
				});
            }
	    });
	});

});
</script>
</html>