<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="/resources/js/jquery.min.js"></script>
<style>
#searchForm button {
	border: none;
	color: #fff;
	cursor: pointer;
	border-radius: 5px;
	padding: 0 10px;
	display: flex;
	align-items: center;
	justify-content: center;
}

#searchForm button i {
	margin-right: 5px;
}

#searchForm label {
	margin-right: 10px;
	font-size: 14px;
	color: #333;
}

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
.button_group_mail {
	display: flex;
	padding-left: 25px;
    justify-content: space-evenly;
    
}
</style>
<link rel="stylesheet" href="/resources/test/fonts/icomoon/style.css">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- Style -->
	<link rel="stylesheet" href="/resources/test/css/style.css">
</head>
<body>
<sec:authentication property="principal.userVO" var="userVO" />
<!-- <div class="divMailbox" style="height:calc(100% - 40px); overflow-y:scroll;"> -->
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
	<span style="font-size:12px; color:#888888;"><a href="/mail/inbox">받은 메일함</a></span>
</div>
	<div class="mailHeader" >
		<div class="mailHeaderName">받은 메일함</div>
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
		<div class="button_group_mail">
			<div class="button_task_wrap">
				<c:choose>
					<c:when test="${empty data}">
						<button class="mail_btn" type="button" disabled="disabled">
							<span class="text" style="font-weight: bold; font-size: 14px;">읽음</span>
						</button>
					</c:when>
					<c:otherwise>
						<button id="btnRead" class="mail_btn" type="button">
							<span class="text" style="font-weight: bold; font-size: 14px;">읽음</span>
						</button>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="button_task_wrap">
				<c:choose>
					<c:when test="${empty data}">
						<button class="mail_btn" type="button" disabled="disabled">
							<span class="text" style="font-weight: bold; font-size: 14px;">삭제</span>
						</button>
					</c:when>
					<c:otherwise>
						<button id="btnDelete" class="mail_btn" type="button">
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
					<div style="text-align: center; padding-top: 75px; color: #333333; font-size: 14px; border-top: 1px solid #ddd;">받은 메일이 없습니다.</div>
				</c:if>
				<c:forEach var="univMailVO" items="${data}">
					<tr>
						<th scope="row"><label class="control control--checkbox">
								<input type="checkbox" name="mailCheck"
								data-uml-cd="${univMailVO.umlCd}" />
								<div class="control__indicator"></div>
						</label></th>
						<td  style="width: 50px;">
							<c:if test="${univMailVO.umlYn eq 0}">
					       		<svg xmlns="http://www.w3.org/2000/svg" height="17" width="17" viewBox="0 0 512 512"><path fill="#707070" d="M48 64C21.5 64 0 85.5 0 112c0 15.1 7.1 29.3 19.2 38.4L236.8 313.6c11.4 8.5 27 8.5 38.4 0L492.8 150.4c12.1-9.1 19.2-23.3 19.2-38.4c0-26.5-21.5-48-48-48H48zM0 176V384c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V176L294.4 339.2c-22.8 17.1-54 17.1-76.8 0L0 176z"/></svg>
								
							</c:if> 
							<c:if test="${univMailVO.umlYn eq 1}">
						       	<svg xmlns="http://www.w3.org/2000/svg" height="17" width="17" viewBox="0 0 512 512"><path fill="#707070" d="M64 208.1L256 65.9 448 208.1v47.4L289.5 373c-9.7 7.2-21.4 11-33.5 11s-23.8-3.9-33.5-11L64 255.5V208.1zM256 0c-12.1 0-23.8 3.9-33.5 11L25.9 156.7C9.6 168.8 0 187.8 0 208.1V448c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V208.1c0-20.3-9.6-39.4-25.9-51.4L289.5 11C279.8 3.9 268.1 0 256 0z"/></svg>
							</c:if>
						</td>
						<td style="width: 15%;">${univMailVO.userVO.userNm}</td>
						<td style="width: 60%;"><a class="mailTitle"
							href="/mail/receiveDetail?umlCd=${univMailVO.umlCd}">${univMailVO.umlTitle}</a>
						</td>
						<td class="mailTbl-center" style="text-align: right;"><fmt:formatDate pattern="MM월 dd일 HH:mm" value="${univMailVO.umlReg}" /></td>
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
$(function() {
	
	$("#btnRead").on("click", function(){
		let readArr = [];

		$('input:checkbox[name=mailCheck]').each(function(index) {
			if ($(this).is(":checked") == true) {
				readArr.push($(this).data("umlCd"));
			}
		});

		console.log("readArr:", readArr);

		$.ajax({
			url : "/mail/readCheck",
			contentType : "application/json; charset=utf-8",
			data : JSON.stringify(readArr),
			type : "post",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(res) {
				console.log("읽음!");
				location.reload();
			}
		});
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
	 					alertSuccess('메일이 삭제되었습니다.', '/mail/inbox');
					}
				});
            }
	    });
	});
	
});
let actionForm = $('#actionForm');

</script>
</html>