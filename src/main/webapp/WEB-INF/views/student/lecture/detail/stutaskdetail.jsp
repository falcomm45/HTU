<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="path/to/fontawesome/css/all.min.css" />
<style>
.mail_files {
	font-size: 14px;
	padding-top: 400px;
}
.mail_attachFile {
	display: flex;
    padding-bottom: 10px;
}
.mail_files_wrap {
	padding-left: 24px;
/* 	padding-bottom: 20px; */
	border: 1px solid #eaeaea;
	max-width: 500px;
	margin-bottom: 20px;
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
</style>
<sec:authentication property="principal.userVO" var="userVO" />
<input type="hidden" name="taskCd" value="${taskVO.taskCd}" id="taskCd" />
<input type="hidden" name="lecCd" value="${taskVO.lecCd}" />


<input type="hidden" id="taskCd" value="${taskVO.taskCd}" />
<input type="hidden" id="stuCd" value="${userVO.userCd}" />

<div style="width:100%; height:100%; padding:30px; background-color:#ffffff;">
	<div style="border-bottom:1px solid #333; padding-bottom:20px; ">
		<!-- 타이틀 -->
		<input name="lecCd" value="${taskVO.taskNm}" style="font-size:28px; font-weight:600;" readonly="readonly"/>
		<!-- 교수명, 제출일  -->
		<div style="font-size:13px; display:flex; align-items:center; margin-top:10px;">
			<!-- 교수명 -->
			<input value="${taskVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}" style="font-size:15px; width:50px; text-align:left;" readonly="readonly"/>
			<span style="font-size:20px;">&nbsp;ㆍ&nbsp;</span>
			<!-- 제출일 -->
			<fmt:formatDate value="${taskVO.taskReg}" pattern="yyyy-MM-dd"/>
<!-- 			<input value="24.01.05" style="font-size:15px; width:70px;"/> -->
		</div>
		<!-- 점수배점 -->
		<div style="display:flex; font-size:15px; align-items:center;">
			<div style="flex: 1;"><span style="height:23.6px; line-height:23.6px;">마감일&nbsp;&nbsp;:&nbsp;&nbsp;</span>
			<fmt:formatDate value="${taskVO.taskEddt}" pattern="yyyy-MM-dd"/></div>
		</div>
	</div>
  <div style="display:flex; margin-top:20px; height:72%; justify-content:space-between; border-bottom:1px solid #ccc; padding-bottom:20px; ">
		<!-- 과제내용  -->
		<div style="padding:20px; width:calc(100% - 300px); margin-right:20px;">
		${taskVO.taskCon}
	<c:if test="${not empty taskVO.filesDetailVOList}">
		<div class="mail_files"	>
			<div class="mail_attachFile">
			    <p style="padding-right: 3px;">첨부</p>
			    <c:if test="${fn:length(taskVO.filesDetailVOList) > 1}">
                    <a type="button" class="download-all-link">(전체 다운로드)</a>
                </c:if>
				    <svg xmlns="http://www.w3.org/2000/svg" height="14" width="12" viewBox="0 0 448 512">!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.<path fill="#686868" d="M364.2 83.8c-24.4-24.4-64-24.4-88.4 0l-184 184c-42.1 42.1-42.1 110.3 0 152.4s110.3 42.1 152.4 0l152-152c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-152 152c-64 64-167.6 64-231.6 0s-64-167.6 0-231.6l184-184c46.3-46.3 121.3-46.3 167.6 0s46.3 121.3 0 167.6l-176 176c-28.6 28.6-75 28.6-103.6 0s-28.6-75 0-103.6l144-144c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-144 144c-6.7 6.7-6.7 17.7 0 24.4s17.7 6.7 24.4 0l176-176c24.4-24.4 24.4-64 0-88.4z"/></svg>
			</div>
		    <div class="mail_files_wrap">
			    <c:forEach var="fileDetail" items="${taskVO.filesDetailVOList}" varStatus="loop">
			    	<div class="fileDiv" id="fileDiv_${loop.index}">
			    		<input type="hidden" class="fileSvnm" value="${fileDetail.fileSvnm}"/>
                  		<input type="hidden" class="fileOrnm" value="${fileDetail.fileOrnm}"/>
			    	</div>
			    	<ul class="mail_files_list">
				        <a class="mail_file" href="/resources/upload/${fileDetail.fileSvnm}" download="${fileDetail.fileOrnm}">${fileDetail.fileOrnm}</a>
				        <div class="file_download">
					        <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.<path fill="#686868" d="M256 464a208 208 0 1 1 0-416 208 208 0 1 1 0 416zM256 0a256 256 0 1 0 0 512A256 256 0 1 0 256 0zM376.9 294.6c4.5-4.2 7.1-10.1 7.1-16.3c0-12.3-10-22.3-22.3-22.3H304V160c0-17.7-14.3-32-32-32l-32 0c-17.7 0-32 14.3-32 32v96H150.3C138 256 128 266 128 278.3c0 6.2 2.6 12.1 7.1 16.3l107.1 99.9c3.8 3.5 8.7 5.5 13.8 5.5s10.1-2 13.8-5.5l107.1-99.9z"/></svg>
				        </div>
			    	</ul>
			    </c:forEach>
		    </div>
		</div>
	</c:if>
		</div>
		<div class="submitDiv">
		<c:choose>
			<c:when test="${taskSubmitVO.tsubCd eq null}">
				<div style="position:relative; width:300px; height:150px; padding:20px; box-sizing:border-box; border:1px solid #ccc; border-radius:5px; margin-top:20px; box-shadow: 0 1px 2px 0 rgba(60,64,67,.3), 0 2px 6px 2px rgba(60,64,67,.15);">
					<div style="display:flex; justify-content:space-between; align-items:end;">	
						<div style="font-size:20px;">과제제출함</div>
						<div style="font-size:15px;">미제출</div>
					</div>
						<c:if test="${taskVO.taskEddt < sysdate}">
							<p style="margin-top:20px; width:100%; font-size:14px; line-height:23px; height:30px; background-color:#fff;">제출일이 마감되었습니다.</p>						
						</c:if>
						<c:if test="${taskVO.taskEddt > sysdate}">
							<input type="file" name="uploadFiles" id="submitFile" multiple="multiple" style="margin-top:20px; width:100%; font-size:14px; border:1px solid #ccc; line-height:23px; height:30px; background-color:#fff;border-radius:3px;"/>
							<button type="button" id="tasksubmitButton" style="border:1px solid #ccc; border-radius:3px; background-color:#ebebeb; font-size:13px; height:30px; margin-top:5px; line-height:30px; position:absolute; right:20px; bottom:20px;">과제제출</button>
						</c:if>
				</div>
			</c:when>
			<c:otherwise>
				<div style="position:relative; width:300px; height:150px; padding:20px; box-sizing:border-box; border:1px solid #ccc; border-radius:5px; margin-top:20px; box-shadow: 0 1px 2px 0 rgba(60,64,67,.3), 0 2px 6px 2px rgba(60,64,67,.15);">
					<div style="display:flex; justify-content:space-between; align-items:end;">	
						<div style="font-size:20px;">과제제출함</div>
						<div style="font-size:15px;">제출완료</div>
					</div>
					<c:forEach var="vo" items="${taskSubmitVO.filesDetailVOList}" varStatus="">
						<div style="padding-top: 20px;" class="submitFileListDiv">
							<a class="fileLink" href="/resources/upload/${vo.fileSvnm}"  style="margin-top:20px; width:100%; font-size:18px;  line-height:30px; height:40px; background-color:#fff;border: 1px solid #eaeaea;border-radius:3px; " download="${vo.fileOrnm}">${vo.fileOrnm} <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.<path fill="#686868" d="M256 464a208 208 0 1 1 0-416 208 208 0 1 1 0 416zM256 0a256 256 0 1 0 0 512A256 256 0 1 0 256 0zM376.9 294.6c4.5-4.2 7.1-10.1 7.1-16.3c0-12.3-10-22.3-22.3-22.3H304V160c0-17.7-14.3-32-32-32l-32 0c-17.7 0-32 14.3-32 32v96H150.3C138 256 128 266 128 278.3c0 6.2 2.6 12.1 7.1 16.3l107.1 99.9c3.8 3.5 8.7 5.5 13.8 5.5s10.1-2 13.8-5.5l107.1-99.9z"/></svg></a>
						</div>
					</c:forEach>
					<input type="file" name="uploadFiles" id="submitFile" multiple="multiple" style="margin-top:20px; width:100%; font-size:14px; border:1px solid #ccc; line-height:23px; height:30px; background-color:#fff;border-radius:3px;display: none;"/>
					<button type="button" id="tasksubmitUpdateButton" style="border:1px solid #ccc; border-radius:3px; background-color:#ebebeb; font-size:13px; height:30px; margin-top:5px; line-height:30px; position:absolute; right:20px; bottom:20px;">수정</button>
					<button type="button" id="tasksubmitUpdateSubmitButton" style="border:1px solid #ccc; border-radius:3px; background-color:#ebebeb; font-size:13px; height:30px; margin-top:5px; line-height:30px; position:absolute; right:20px; bottom:20px;display: none;">제출</button>
				</div>
			</c:otherwise>
		</c:choose>
		</div>
  </div>	

	<!-- 목록 버튼 -->
	<button class="btn-two mini dark" type="button" id="btnBack"
			style="position:relative; left:50%; transform:translateX(-50%);width:100px; height:30px; font-size:14px;">
	목록</button>
	<!-- 목록 버튼 끝 -->
</div>

<script>
$(function() {
    console.log("코드변경2@");
    var taskVOFile = [];
    $('.download-all-link').on('click', function(){
    	download();
    });
    $('#btnBack').on('click', function(){
//     	/student/task/list?lecCd=351
//     	history.back();
		location.href = "/student/task/list?lecCd=" + ${param.lecCd};
    });
    function download() {
        $("[id^=fileDiv_]").each(function (index) {
            var fileSvnm = $(this).find(".fileSvnm").val();
            var fileOrnm = $(this).find(".fileOrnm").val();
            var data = {
                "fileSvnm": fileSvnm,
                "fileOrnm": fileOrnm
            };
            taskVOFile.push(data);
        });
        for(var i = 0; i < taskVOFile.length; i++){
            var fileSvnm = taskVOFile[i].fileSvnm;
            var fileOrnm = taskVOFile[i].fileOrnm;
			
            var link = document.createElement("a");
            var url = "/resources/upload/" + fileSvnm;
            link.download = fileOrnm;
            link.href = url;
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
            delete link;
        }
    }  
	
    $("#lecNm").text($(".lectureName").text());
	const formData = new FormData();
	var taskCd = $('#taskCd').val();
	var stuCd = $('#stuCd').val();

	$("#submitFile").change(function() {
		var files = files = $("#submitFile")[0].files;
		for (var i = 0; i < files.length; i++) {
			formData.append("files", files[i]);
		}
	});
	const data = {
		"taskCd" : taskCd,
		"stuCd" : stuCd
	}
	formData.append("taskSubmitVO", new Blob([ JSON.stringify(data) ], {type : "application/json"}));
	$('#tasksubmitButton').on('click', function() {
		$.ajax({
			url : "/student/task/submit",
			type : "post",
			data : formData, 
			processData : false,
			contentType : false,
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			},
			success : function(res) {
				alertSuccess('과제제출 완료.');
				var submitDivHtml = `<div style="position:relative; width:300px; height:150px; padding:20px; box-sizing:border-box; border:1px solid #ccc; border-radius:5px; margin-top:20px; box-shadow: 0 1px 2px 0 rgba(60,64,67,.3), 0 2px 6px 2px rgba(60,64,67,.15);">
					<div style="display:flex; justify-content:space-between; align-items:end;"><div style="font-size:20px;">과제제출함</div><div style="font-size:15px;">제출완료</div></div><div style="padding-top: 20px;" class="submitFileListDiv">`;
// 				var submitDivHtml = "";
			 	for(var i = 0; i < res.length; i++){
			 		submitDivHtml += '<a class="fileLink" href="/resources/upload/' + res[i].fileSvnm + '"  style="margin-top:20px; width:100%; font-size:18px;  line-height:30px; height:40px; background-color:#fff;border: 1px solid #eaeaea;border-radius:3px; " download>' + res[0].fileOrnm + '<svg xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512">!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.<path fill="#686868" d="M256 464a208 208 0 1 1 0-416 208 208 0 1 1 0 416zM256 0a256 256 0 1 0 0 512A256 256 0 1 0 256 0zM376.9 294.6c4.5-4.2 7.1-10.1 7.1-16.3c0-12.3-10-22.3-22.3-22.3H304V160c0-17.7-14.3-32-32-32l-32 0c-17.7 0-32 14.3-32 32v96H150.3C138 256 128 266 128 278.3c0 6.2 2.6 12.1 7.1 16.3l107.1 99.9c3.8 3.5 8.7 5.5 13.8 5.5s10.1-2 13.8-5.5l107.1-99.9z"/></svg></a></div>';
			 	}
					
			    submitDivHtml += `
			        <input type="file" name="uploadFiles" id="updateFile" multiple="multiple" style="margin-top:20px; width:100%; font-size:14px; border:1px solid #ccc; line-height:23px; height:30px; background-color:#fff;border-radius:3px;display: none;"/>
			        <button type="button" id="tasksubmitUpdateButton" style="border:1px solid #ccc; border-radius:3px; background-color:#ebebeb; font-size:13px; height:30px; margin-top:5px; line-height:30px; position:absolute; right:20px; bottom:20px;">수정</button>
			        <button type="button" id="tasksubmitUpdateSubmitButton" style="border:1px solid #ccc; border-radius:3px; background-color:#ebebeb; font-size:13px; height:30px; margin-top:5px; line-height:30px; position:absolute; right:20px; bottom:20px;display: none;">제출</button>
			    </div>`;
			    
			    $(".submitDiv").html(submitDivHtml);
			
			},
			error : function(xhr) {
				console.log(xhr);
			}
		});
	});
	$(document).on('click', '#tasksubmitUpdateButton', function(){
		$('#tasksubmitUpdateButton').hide();
		$('.updateFileListDiv').hide();
		$('#tasksubmitUpdateSubmitButton').show();
		$('#updateFile').show();
	});
	
	
	$(document).on('click', '#tasksubmitUpdateSubmitButton', function(){
		const formData = new FormData();
		var taskCd = $('#taskCd').val();
		var stuCd = $('#stuCd').val();

		$("#updateFile").change(function() {
			var files = files = $("#updateFile")[0].files;
			for (var i = 0; i < files.length; i++) {
				formData.append("files", files[i]);
			}
		});
		const data = {
			"taskCd" : taskCd,
			"stuCd" : stuCd
		}
		formData.append("taskSubmitVO", new Blob([ JSON.stringify(data) ], {type : "application/json"}));
			$.ajax({
				url : "/student/task/submit/update",
				type : "post",
				data : formData, 
				processData : false,
				contentType : false,
				beforeSend : function(xhr) {
					xhr.setRequestHeader("${_csrf.headerName}",
							"${_csrf.token}");
				},
				success : function(res) {
					
				},
				error : function(xhr) {
					console.log(xhr);
				}
			});
	});
	
});
</script>