<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
		<div class="mailHeaderName">과제등록</div>
	</div>
	<!-- ----------------------------------------------------------------------------- -->
 <form role="form" id="taskFrm" action="/professor/task/create?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<div class="mail_toolbar type_write">
			<div class="mail_toolbar_task">
				<div class="button_group" style="display: flex;">
					<div style="flex: 1;"><button id="taskSubmit" type="button" 
						class="mail_btn button_write_task">등록</button></div>
					<div style="flex: 1;"><button id="taskAuto" type="button" 
						class="mail_btn button_write_auto">자동완성</button></div>
				</div>
			</div>
		</div>
		<div class="mail_write_option">

			<div class="mail_write_option_item subject">
				<div class="mail_write_option_item_inner">
					<div class="title_area">
						<strong class="option_title"><label for="subject_title">과제명</label></strong>
					</div>
					<div class="option_area">
						<div class="option_input_cover">
							<input name="taskNm" id="subject_title" type="text"
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
						<strong class="option_title">첨부파일</strong>
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
			<div class="mail_write_option_item file expanded">
				<div class="mail_write_option_item_inner">
					<div class="title_area">
						<strong class="option_title">과제마감일</strong>
					</div>
					<div class="option_area">
						<div class="file_upload">
							<label class="button_upload"><span class="blind">
							</span><input id="taskEddt" type="date"
								class="blind" name="taskEddt"></label>
							<p class="description"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="editor_area">
			<textarea rows="100" cols="30" id="taskCon" name="taskCon"></textarea>
		</div>
		<sec:csrfInput />
	</form>
</div>


<script type="text/javascript">
$(function(){
	$("#taskSubmit").on("click", function(){
		
		sweetConfirmCreate();
		
	});
	$("#taskAuto").on("click", function(){
		$('#subject_title').val("데이터베이스 설계 과제");	
		
		$('#subject_title').val("문제풀이과제 - 데이터베이스");	
		
		var taskContent = `제출되어야 할 내용<br /><br />
			▣ 각 문제 (총4문제)에 대한 결과물<br /><br />

			▣ 자신의 과제 수행 결과에 대한 자체 평가 (숙제 맨 마지막 장을 할당하여 작성할 것)<br /><br />

			▶ 완성여부 완성인 경우 "완성" 이라고 적음<br /><br />

			▶ 미완성인 경우 "미완성"이라고 적음 (어떤 부분이 미완성인지 기술)<br /><br />

			▶ 과제를 하면서 느낀점 (어떠한 내용이어도 상관없음)<br /><br />

			※ 파일로 첨부하여 제출<br /><br /><br />



			개념적 데이터 모델링 : ER다이어그램<br />

			□ 문제1. 앞장에서 정의된 ER다이어그램을 관계형 데이터 베이스 테이블로 변환하고자 한다.<br />

			한 테이블생성문을 SQL문으로 작성하라.<br /><br />

			□ 문제2. 문제1로부터 작성된 테이블에 임의의 데이터를 입력하고자 한다. 이를 위한 SQL문과 출력 결과를 보여라.<br /><br />

			□ 문제3. 문제2에서 입력된 데이터로부터, 다음과 같은 검색질의 (도서이름에 '데이터' 가 들어간 도서들의 저자명을 검색하라.)<br /><br />

			□ 문제4. 작성된 테이블의 데이터를 변경하고자 한다. 이때, 무 결성 제약조건에 위배되도록 데이터를 변경하고, 해당 결과를 출력하라<br />

			또한, 해당 오류가 발생한 이유를 설명하라.`;
		CKEDITOR.instances['taskCon'].setData(taskContent);
		
	    var currentDate = new Date();

	    currentDate.setDate(currentDate.getDate() + 3);

	    var futureDate = currentDate.toISOString().split('T')[0];
	    $('#taskEddt').val(futureDate);
	  
	    // 자동완성시 파일선택창 자동으로 열리게 하는 부분
// 	    var fakeInput = document.getElementById('ATTACH_LOCAL_FILE_ELEMENT_ID');
// 	    var fakeClick = document.createEvent('MouseEvents');
// 	    fakeClick.initEvent('click', true, true);
// 	    fakeInput.dispatchEvent(fakeClick);
		
	});
	CKEDITOR.replace('taskCon', {
		filebrowserUploadUrl:'/professor/fileuploadCKTask?${_csrf.parameterName}=${_csrf.token}',
		height: 600
	});
	CKEDITOR.config.allowedContent = true;
	
	function copyContent(){
		   $("#taskCon").html(window.editor.getData());
		   return true;
	}
	function sweetConfirmCreate() {
	    Swal.fire({
	        text: "과제를 등록 하시겠습니까?",
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
	        	$("#taskFrm").submit();
	        } else {
	            alertError('등록을 취소하였습니다.');
	        }
	    });
	}
	
});
</script> 
