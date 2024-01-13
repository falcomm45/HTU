<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/jquery.min.js"></script>

<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<style>
.divMailbox .mailHeaderName {
	font-size: 20px;
	padding: 30px;
	font-weight: 600;
}

input:focus {
	outline: none;
}

input[type=file]::file-selector-button {
	width: 120px;
	height: 30px;
	color: #333333;
	background-color: transparent;
	border: 1px solid #dadada;
	border-radius: 10px;
	cursor: pointer;
}

input[type=file]::file-selector-button:hover {
	background-color: #dadada;
	color: #fff;
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
	border-top: 1px solid #dadada;
	border-bottom: 1px solid #dadada;
	justify-content: space-between;
}

.mail_toolbar.type_write {
	font-size: 14px;
	display: flex;
	flex-wrap: wrap;
	height: 50px;
	margin-left: 0px;
	margin-right: 0px;
}

.button_group {
	display: flex;
	width: 350px;
}

.mail_toolbar_task .button_write_task {
	width: 50px;
	height: 28px;
	text-align: center;
	margin: 0 5px 0 1100px;
	padding: 3px 10px;
	border: 1px solid #7e1717;
	border-radius: 5px;
	font-weight: bold;
	color: #7e1717;
	line-height: 20px;
	letter-spacing: 0;
}
.mail_toolbar_task .button_write_auto {
	width: 80px;
	height: 28px;
	text-align: center;
	margin: 0 0px 0 9px;
	padding: 3px 10px;
	border: 1px solid #7e1717;
	border-radius: 5px;
	font-weight: bold;
	color: #7e1717;
	line-height: 20px;
	letter-spacing: 0;
}

.mail_btn {
	/* 	margin: 0; */
	margin: 0 5px 0 9px;
	padding: 3px 10px;
	outline: none;
	line-height: 20px;
	background-color: transparent;
	cursor: pointer;
	touch-action: manipulation;
	border: 0;
}

.mail_toolbar_task .button_task:hover {
	border: 1px solid #dadada;
	border-radius: 5px;
}

.mail_toolbar_task .button_task_wrap {
	margin-right: 0;
	margin: 0 29px 0 0;
	font-weight: normal;
}

.mail_write_option {
	padding-top: 10px;
	font-size: 14px;
	font-weight: 600;
}

.mail_write_option_item_inner .title_area {
	align-items: center;
	width: 160px;
	padding: 5px 0 6px 11px;
}

.mail_write_option_item_inner .option_area {
	border-bottom: 1px solid #dadada;
	width: 100%;
}

.mail_write_option_item_inner {
	display: flex;
}

.editor_area {
	margin-top: 20px;
}

.mail_write_option_item_inner .user_input {
	padding: 2px 0;
	width: 100%;
	background-color: transparent;
}

.mail_write_option_item_inner .option_input {
	padding: 6px 0;
	width: 100%;
	background-color: transparent;
}

.mail_write_option_item.file .option_area {
	border-bottom: 0;
}

.mail_write_option_item_inner .blind {
	padding: 6px 0;
	width: 100%;
	background-color: transparent;
}

.cke_contents cke_reset {
	height: 500px;
}

.autocomplete>div {
	z-index: 999;
	background: #ffffff;
	padding: .2rem .6rem;
	height: 30px;
}

.autocomplete>div.active {
	background: #e0e5f6;
	color: #000;
}

.autocomplete {
	position: absolute;
	max-height: 90px;
	overflow: auto;
}

mark {
	background: #febf0090;
}
</style>
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>

<div class="divMailbox" style="background-color: #ffffff;">
	<div class="mailHeader">
		<div class="mailHeaderName">자료등록</div>
	</div>
	<!-- ----------------------------------------------------------------------------- -->
	<form name="frm"
		id="lecDataFrm" action="/professor/lecturedata/create?${_csrf.parameterName}=${_csrf.token}"
		method="post" 
		enctype="multipart/form-data">
		<div class="mail_toolbar type_write">
			<div class="mail_toolbar_task">
				<div class="button_group" style="display: flex;">
					<div style="flex: 1;"><button id="dataSubmit" type="button" 
					class="mail_btn button_write_task">등록</button></div>
					<div style="flex: 1;"><button id="dataAuto" type="button" 
					class="mail_btn button_write_auto">자동완성</button></div>
				</div>
			</div>
		</div>
		<div class="mail_write_option">

			<div class="mail_write_option_item subject">
				<div class="mail_write_option_item_inner">
					<div class="title_area">
						<strong class="option_title"><label for="subject_title">제목</label></strong>
					</div>
					<div class="option_area">
						<div class="option_input_cover">
							<input name="lecdTitle" id="subject_title" type="text"
								class="option_input" tabindex="4" maxlength="180"
								required="required">
						<input type="hidden" id="lecCd" name="lecCd" value="${param.lecCd}" />
						</div>
					</div>
				</div>
			</div>
			<div class="mail_write_option_item file expanded">
				<div class="mail_write_option_item_inner">
					<div class="title_area">
						<strong class="option_title">파일첨부</strong>
					</div>
					<div class="option_area">
						<div class="file_upload">
							<label class="button_upload"><span class="blind">
							</span><input id="ATTACH_LOCAL_FILE_ELEMENT_ID" type="file"
								class="blind" name="uploadFiles" multiple="multiple"></label>
							<p class="description"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="editor_area">
			<textarea rows="100" cols="30" id="lecdCon" name="lecdCon"></textarea>
		</div>
		<sec:csrfInput />
	</form>
</div>



<script type="text/javascript">
$(function(){
	$("#dataSubmit").on("click", function(){
// 		$("#lecdCon").html(window.editor.getData());
		sweetConfirmCreate();
	});
	$("#dataAuto").on("click", function(){
		$('#subject_title').val("[프로그래밍 심화] JAVA Spring CRUD예시");	
		
		var lecdContent = `CRUD 기본을 연습을 위한 JAVA Spring CRUD 예시 파일입니다.`;
		
		CKEDITOR.instances['lecdCon'].setData(lecdContent);
	    
	    var fakeInput = document.getElementById('ATTACH_LOCAL_FILE_ELEMENT_ID');
	    var fakeClick = document.createEvent('MouseEvents');
	    fakeClick.initEvent('click', true, true);
	    fakeInput.dispatchEvent(fakeClick);
		
	});
	
	
	
	CKEDITOR.replace('lecdCon', {
		filebrowserUploadUrl:'/professor/fileuploadCKData?${_csrf.parameterName}=${_csrf.token}',
		height: 600
	});
	CKEDITOR.config.allowedContent = true;
	
	function copyContent(){
		   //textarea에 div 내용값을 넣어줌
		   $("#lecdCon").html(window.editor.getData());
		   return true;
	}
	
	function sweetConfirmCreate() {
	    Swal.fire({
	        text: "자료를 등록 하시겠습니까?",
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
	        	$("#lecDataFrm").submit();

	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('등록을 취소하였습니다.');
	        }
	    });
	}
	
});

</script> 


