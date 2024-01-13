<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<style>
.divMailbox .mailHeaderName{font-size: 16px; padding:20px 0 20px 10px; font-weight: 800;}
input:focus {outline:none;}
input[type=file]::file-selector-button {width: 120px; height: 30px; color: #333333; background-color: transparent;
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
	height: 28px;
    text-align: center;
	margin: 0 5px 0 9px;
	padding: 3px 10px;
	border: 1px solid #7e1717;
	border-radius: 5px;
	font-weight: bold;
	color: #7e1717;
	line-height: 20px;
	letter-spacing: 0;
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
.mail_toolbar_task .button_task:hover {
	border: 1px solid #dadada;
	border-radius: 5px;
}
.mail_toolbar_task .button_task_wrap {
	margin-right: 0;
	margin: 0 29px 0 0;
	font-weight: normal;
}
.mail_title {
	font-size: 18px; 
	padding: 20px 0 25px 0;
	font-weight: 600;
}
.mail_content {
	padding-left: 24px;
	border-bottom: 1px solid #dadada;
}
.mail_sender {
	display: flex;
}
.title_area {
	font-size: 14px;
    font-weight: 600;
    line-height: 18px; 
    width: 62px;
}
.mail_sender_area {
	margin: 0 0 8px 4px;
    padding: 5px 12px;
	font-size: 14px;
	background-color: rgba(0, 115, 230, 0.1);
	border: 1px solid rgba(0, 115, 230, 0.1);
	border-radius: 14px;
}
.mail_date {
	font-size: 13px;
	padding: 10px 0 15px 0;
}
.mail_files {
	font-size: 14px;
	padding: 24px;
}
.mail_attachFile {
	display: flex;
    padding-bottom: 10px;
}
.mail_files_wrap {
	padding-left: 24px;
	border: 1px solid #eaeaea;
	max-width: 500px;
}
.mail_files_list {
	padding: 10px 0;
	display: flex;
}
.file_download {
	align-items: center;
    margin-left: auto;
    padding-right: 20px;
}
#cke_1_top, #cke_1_bottom {
	display: none;
}
.cke_chrome {
	border: 0;
}
.cke_contents cke_reset {
	height: 500px;
}
.editor_area {
	font-size: 14px;
}

.autocomplete > div {
  z-index: 999;
  background: #ffffff;
  padding: .2rem .6rem;
  height: 30px;
}
.autocomplete > div.active {
  background: #e0e5f6;
  color: #000;
}
.autocomplete{
  position: absolute;
  max-height: 90px;
  overflow: auto;
}

mark {
  background: #febf0090;
}

</style>
<div class="divMailbox" style="background-color: #ffffff; height: 100%;">
	<div class="mailHeader">
		<div class="mailHeaderName">
			<a href="/mail/sentbox" style="color: #333333; display: flex;">
			<svg xmlns="http://www.w3.org/2000/svg" height="16" width="10" viewBox="0 0 320 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#333333" d="M9.4 233.4c-12.5 12.5-12.5 32.8 0 45.3l192 192c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L77.3 256 246.6 86.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0l-192 192z"/></svg>
			<span style="padding-left: 5px;">보낸 메일함</span>
			</a>
		</div>
	</div>
<!-- ----------------------------------------------------------------------------- -->
	<div class="mail_toolbar type_write">
		<div class="mail_toolbar_task">
			<div class="button_group_mail">
				<div class="button_task_wrap">
					<button id="btnDelete" class="mail_btn" type="button" data-uml-cd="${univMailVO.umlCd}">
						<span class="text" style="font-weight: bold; font-size: 14px;">삭제</span>
					</button>
					<a href="/mail/sentbox" id="btnList" class="mail_btn" type="button">
						<span class="text" style="font-weight: bold; font-size: 14px;">목록</span>
					</a>
				</div>
			</div>
		</div>
	</div>
<!-- ----------------------------------------------------------------------------- -->
	<div class="mail_content">
		<div class="mail_title">
			<p>${univMailVO.umlTitle}</p>
		</div>
		<div class="mail_sender">
			<div class="title_area">
				<strong class="option_title">보낸사람</strong>
			</div>
			<div class="mail_sender_area">
				${univMailVO.userVO.userNm}
			</div>
		</div>
		
		<div class="mail_date">
		    <p><fmt:formatDate pattern="yyyy년 MM월 dd일 HH:mm" value="${univMailVO.umlReg}"/></p>
		</div>
	</div>
<!-- ----------------------------------------------------------------------------- -->
	<c:if test="${univMailVO.filesDetailVOList ne null and not empty univMailVO.filesDetailVOList}">
		<div class="mail_files">
			<div class="mail_attachFile">
			    <p style="padding-right: 3px;">첨부</p>
			    <svg xmlns="http://www.w3.org/2000/svg" height="14" width="12" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#686868" d="M364.2 83.8c-24.4-24.4-64-24.4-88.4 0l-184 184c-42.1 42.1-42.1 110.3 0 152.4s110.3 42.1 152.4 0l152-152c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-152 152c-64 64-167.6 64-231.6 0s-64-167.6 0-231.6l184-184c46.3-46.3 121.3-46.3 167.6 0s46.3 121.3 0 167.6l-176 176c-28.6 28.6-75 28.6-103.6 0s-28.6-75 0-103.6l144-144c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-144 144c-6.7 6.7-6.7 17.7 0 24.4s17.7 6.7 24.4 0l176-176c24.4-24.4 24.4-64 0-88.4z"/></svg>
			</div>
		    <div class="mail_files_wrap">
			    <c:forEach var="fileDetail" items="${univMailVO.filesDetailVOList}">
			    	<ul class="mail_files_list">
				        <a class="mail_file" href="/resources/upload/${fileDetail.fileSvnm}" download="${fileDetail.fileOrnm}">${fileDetail.fileOrnm}</a>
				        <div class="file_download">
					        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#686868" d="M256 464a208 208 0 1 1 0-416 208 208 0 1 1 0 416zM256 0a256 256 0 1 0 0 512A256 256 0 1 0 256 0zM376.9 294.6c4.5-4.2 7.1-10.1 7.1-16.3c0-12.3-10-22.3-22.3-22.3H304V160c0-17.7-14.3-32-32-32l-32 0c-17.7 0-32 14.3-32 32v96H150.3C138 256 128 266 128 278.3c0 6.2 2.6 12.1 7.1 16.3l107.1 99.9c3.8 3.5 8.7 5.5 13.8 5.5s10.1-2 13.8-5.5l107.1-99.9z"/></svg>
				        </div>
			    	</ul>
			    </c:forEach>
		    </div>
		</div>
	</c:if>
	<div class="editor_area">
		<textarea name="umlCon" readonly="readonly">${univMailVO.umlCon}</textarea>
	</div>
<!-- 		<div> -->
<!-- 			<a href="/mail/sentbox" class="btn-two gray mini">목록</a> -->
<%-- 			<a id="deleteMail" href="/mail/sentbox" data-uml-cd="${univMailVO.umlCd}" class="btn-two red mini">삭제</a> --%>
<!-- 		</div> -->
</div>
<script>
$(function(){
	
	CKEDITOR.replace('umlCon', {
		height: 710
	});
	CKEDITOR.config.allowedContent = true;
	   
	$("#btnDelete").on("click", function(){
		
		Swal.fire({
	      text: "메일을 삭제하시겠습니까?",
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
	    		
	    		let umlCd = $(this).data("umlCd");
				console.log("umlCd : " + umlCd);
				
				$.ajax({
					url:"/mail/deleteSentMail?umlCd="+umlCd,
					data:umlCd,
					type:"post",
					beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
					success : function(res) {
	 					alertSuccess('메일이 삭제되었습니다.', '/mail/sentbox');
					}
				});
            }
	    });
	});
	
});

</script>
