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
		<div class="mailHeaderName">공지사항</div>
	</div>
	<!-- ----------------------------------------------------------------------------- -->
	 <form role="form" id="lecNoticeFrm" action="/professor/lecturenotice/create?${_csrf.parameterName}=${_csrf.token}" method="post">
		<div class="mail_toolbar type_write">
			<div class="mail_toolbar_task">
				<div class="button_group" style="display: flex;">
					<div style="flex: 1;"><button id="lecNoticdSubmit" type="button" 
						class="mail_btn button_write_task">등록</button></div>
					<div style="flex: 1;"><button id="noticeAuto" type="button" 
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
							<input name="lecnTitle" id="lecnTitle" type="text"
								class="option_input" tabindex="4" maxlength="180"
								required="required" />
						<input type="hidden" id="lecCd" name="lecCd" value="${param.lecCd}" />
						</div>
					</div>
				</div>
			</div>
			<div class="mail_write_option_item file expanded">
				<div class="mail_write_option_item_inner">
<!-- 					<div class="title_area"> -->
<!-- 						<strong class="option_title">파일첨부</strong> -->
<!-- 					</div> -->
<!-- 					<div class="option_area"> -->
<!-- 						<div class="file_upload"> -->
<!-- 							<label class="button_upload"><span class="blind"> -->
<!-- 							</span><input id="ATTACH_LOCAL_FILE_ELEMENT_ID" type="file" -->
<!-- 								class="blind" name="uploadFiles" multiple="multiple"></label> -->
<!-- 							<p class="description"></p> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
			</div>
		</div>
		<div class="editor_area">
			<textarea rows="100" cols="30" id="lecnCon" name="lecnCon"></textarea>
		</div>
		<sec:csrfInput />
	</form>
</div>



<script type="text/javascript">
$(function(){
	$("#lecNoticdSubmit").on("click", function(){
		
		sweetConfirmCreate();
		
	});
	
	$("#noticeAuto").on("click", function(){
		$('#lecnTitle').val("2024년도 형택대학교 학부대학 ‘글쓰기’ 튜터 모집");	
		
		var lecnContent = `1. 서류 접수 및 발표 일정<br />

			1) 서류 접수 기간: 2024년 1월 15일(월) ~ 2023년 1월 26일(금)<br />

			2) 임용 예정자에 대해서는 2월 12일(월) 이후 학부대학에서 개별 통지 2. 제출 장소 - 비대면 상황이므로 아래의 메일로 제출 (ycbwriting@yonsei.ac.kr)<br />

			2. 지원 자격 - 연세대학교 <글쓰기> 강좌의 목표와 방향을 이해하고 헌신하고자 하는 분 - 선발 후 1년 동안 튜터 활동을 성실히 수행하고자 하는 분 - 연세대학교 박사과정 재학생 (박사 5학기 이상 우대) * 4학기 이하의 경우 장학금 지급 중복 등의 불이익이 발생하지 않도록 본인이 유념해야 하며, 중복 지급으로 인한 문제 발생 시 학부대학이 책임지지 않음<br />

			3. 튜터 업무 - 연세대학교 <글쓰기> 강좌 발전을 위해 노력한다. - <글쓰기> 워크숍 및 튜터 워크숍에 참여한다. - 해당 <글쓰기> 분반의 교ㆍ강사와 협의하여 강의 수행, 학생 글 피이드백, 퀴즈 채점, 1:1 튜터링 등을 성실히 수행한다.<br />
		
			4. 제출 서류 (기존 및 신규 튜터 모두 제출)<br />

			1) 이력서 1통 *기존 튜터 경력, 자신의 전공, 글쓰기 또는 독서 관련 교육ㆍ연구ㆍ학회 활동 중심의 자기소개 포함<br />

			2) 박사과정 재학증명서 1부<br />

			3) 최근 3년간의 논문 또는 매체에 발표한 글 가운데 1편 제출`;
		
		CKEDITOR.instances['lecnCon'].setData(lecnContent);
	    
	    var fakeInput = document.getElementById('ATTACH_LOCAL_FILE_ELEMENT_ID');
	    var fakeClick = document.createEvent('MouseEvents');
	    fakeClick.initEvent('click', true, true);
	    fakeInput.dispatchEvent(fakeClick);
		
	});
	CKEDITOR.replace('lecnCon', {
		filebrowserUploadUrl:'/professor/fileuploadCKNotice?${_csrf.parameterName}=${_csrf.token}',
		height: 600
	});
	CKEDITOR.config.allowedContent = true;
	
	function copyContent(){
		   //textarea에 div 내용값을 넣어줌
		   $("#lecnCon").html(window.editor.getData());
		   return true;
	}
	function sweetConfirmCreate() {
	    Swal.fire({
	        text: "공지사항을 등록 하시겠습니까?",
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
	        	$("#lecNoticeFrm").submit();
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('등록을 취소하였습니다.');
	        }
	    });
	}
	
});
</script> 


