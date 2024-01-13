<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
.crew_box{width:100%; padding:40px; background-color:#ffffff;}
.table_topic{font-size: 20px; padding-bottom:30px;}

.crew_form{border:1px solid #d1d0d0; padding:30px; width:80%; border-radius:5px; position:relative;}
.crew_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
.crew_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
.crew_form_title select, .crew_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
.crew_margin_left{margin-left:5px;}
.crew_form a:hover{color:#ffffff!important;}
</style>
<sec:authentication property="principal.userVO" var="userVO"/>
<div class="crew_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;">동아리</span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;">나의 동아리</span>
	</div>
	<div class="table_topic">동아리 수정</div>
	<form class="crew_form" action="/student/crew/crewUpdatePost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<input name="crCd" value="${crewVO.crCd}" hidden="hidden" />
		<div class="crew_form_title">
			<p>동아리명</p>
			<input type="text" name="crNm" value="${crewVO.crNm}" required="required"/>
		</div>
		<div class="crew_form_title">
			<p>동아리 목적</p>
			<input type="text" name="crCon" value="${crewVO.crCon}" required="required"/>
		</div>
		<div class="crew_form_title">
			<p>동아리장</p>
			<select name="crLeader" id="crLeader">
				<c:forEach var="crewMem" items="${crewPersonnelList}">
					<option value="${crewMem.stuCd}"
						<c:if test ="${crewMem.stuCd eq crewVO.crLeader}">selected="selected"</c:if>
					>${crewMem.stuNm}</option>
				</c:forEach>
			</select>
		</div>
		<div class="crew_form_title">
			<p>동아리실</p>
			<select name="roomCd" id="roomCd">
				<option value="${crewVO.roomCd}" selected="selected">학생회관 ${crewVO.roomNm}</option>
				<c:forEach var="roomList" items="${roomList}">
					<option value="${roomList.roomCd}">${roomList.roomNm}</option>
				</c:forEach>
			</select>
		</div>
		<div class="crew_form_title" style="margin-bottom:100px;">
			<p>파일첨부</p>
			<c:forEach var="fileDetail" items="${crewVO.filesDetailVOList}">
				<div style="padding-bottom: 10px; font-size: 14px;">
			        <a name="uploadFiles" href="/resources/upload/${fileDetail.fileSvnm}">${fileDetail.fileOrnm}</a>
			        <img data-file-cd="${fileDetail.fileCd}" data-file-sn="${fileDetail.fileSn}" class="fileDeleteBtn" alt="delete" src="/resources/images/x.png" style="width: 10px; height: 10px;" /><br />
				</div>
	    	</c:forEach>
	    	<input type="file" name="uploadFiles" multiple="multiple" />
		</div>
		<div class="counsel_form_title" style="margin-bottom:0; margin-top:20px; position:absolute; right:30px; bottom:30px;">
			<div style="display:flex;">
				<button type="submit" id="btnUpdate" class="btn-reg bur">확인</button>
				<button type="button" id="btnCancle" class="btn-reg back" style="margin-left:10px;">취소</button>
			</div>
		</div>
		<sec:csrfInput />
	</form>
</div>
<script type="text/javascript">
$(function(){

	$(".fileDeleteBtn").on("click", function(){
		let node = $(this).parent();
		let fileCd = $(this).data("fileCd");
		let fileSn = $(this).data("fileSn");
		
		let data = {
			"fileCd":fileCd,
			"fileSn":fileSn
		};
		
		console.log("data", data);

		$.ajax({
			url:"/student/crew/deleteFileUpdate",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(res){
				console.log("res : ", res);
				if(res > 0){
					node.remove();
				}
			}
		});
	});
	
	$("#btnCancle").on("click", function(){
		
		Swal.fire({
 	        text: "이 페이지를 벗어나면 수정된 내용은 저장되지 않습니다.",
 	        icon: "question",
 	        width: 300,
 	        showCancelButton: true,
 	        confirmButtonColor: "#3085d6",
 	        cancelButtonColor: "#d33",
 	        confirmButtonText: "확인",
 	        cancelButtonText: "취소"
 	    }).then((str) => {
 	        console.log(str);
 	        if (str.isConfirmed) {
       	    	$(window).unbind('onbeforeunload');
				history.back()
 	        } else {

 	        }
 	    });
	});
});

// window.onbeforeunload = function() {
// 	return false;
// };
</script>