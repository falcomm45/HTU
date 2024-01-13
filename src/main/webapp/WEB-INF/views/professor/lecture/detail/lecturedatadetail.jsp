<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>
<style>
/* 여기 스타일 전부 가져다가 복붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "free_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
.free_box {
	width: 100%;
	padding: 40px;
	background-color: #ffffff;
}
/* 상단에 있는 제목 (여기서는 상담내역) css입니다
	 그대로 복붙하시고 해당div에  .table_topic값 주세요*/
.free_box .table_topic {
	font-size: 20px;
	padding-bottom: 30px;
}

.free_box .table_topic i {
	margin-left: 10px;
}
/* table입니다 */
.free_box table {
	font-size: 14px;
	width: 100%;
	text-align: center;
}
/* 테이블의 시작부분 타이틀입니다 */
.table_title {
	font-size: 24px;
	border-top: 1px solid #333333 !important;
	border-bottom: 1px solid #333333 !important;
	height: 63px;
	line-height: 61px;
	background-color: #EEF1F6;
}

/* /////////////////여기가 수정시작!!  */
.free_box tr {
	height: 40px;
	border-bottom: 1px solid #ebebeb;
}

.free_box tr:first-child {
	background-color: #EEF1F6;
}

.free_box tr:hover {
	background-color: #f2f3f4;
}

.free_box tr:first-child:hover {
	background-color: #EEF1F6;
}
/* /////////////////여기가 수정끝!!  */
.image_container {
	width: 920px;
	height: 400px;
	border: 1px solid #ccc;
	background-position: center;
	background-size: cover;
	margin-bottom: 20px;
}
/* 신고 모달창 꾸미기 */
#datatable-scroller {
	width: 1000px;
}

.container {
	width: 1032px;
}
.lecture_menu{height:30px; align-items:center;}
	.lecture_menu a{border:1px solid #ebebeb; box-sizing:border-bos; background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; box-sizing: border-box; border:1px solid #ffffff;}
	.btn-reg:hover{color:#ffffff;}
</style>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div style="display:flex;" class="lecture_menu">
	<a href="/professor/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a ">홈</a>
	<a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a ">공지사항</a>
    <a href="/professor/task/list?lecCd=${param.lecCd}" class="sub_menu_a">과제</a>
    <a href="/professor/test/testList?lecCd=${param.lecCd}" class="sub_menu_a">시험</a>
    <a href="/professor/lectureAttendance?lecCd=${param.lecCd}" class="sub_menu_a">출결관리</a>
    <a href="/professor/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a effect">자료실</a>
    <a href="/professor/objection/list?lecCd=${param.lecCd}" class="sub_menu_a">성적이의신청</a>
</div>
<div class="free_box" style="background-color: white;">

<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span><a href="/professor/lecture/list" style="font-size:12px; color:#888888;">강의실</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span><a href="/professor/lecture/detail?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;" id="lecNm"></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span><a href="/professor/lecturedata/list?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">자료실</a></span>
</div>
<div class="board_wrap" style="width:100%; position:relative;">
	<div class="board_header">
		</br>
		</br>
	</div>
		<!-- 정보 -->

		<!-- 정보 -->
		

	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
		aria-labelledby="reportModalLabel" aria-hidden="true">
	</div>

<%-- 	<c:if test="${userVO.comdCd == 'USER02'}"> --%>
<!-- 		<button type="button" class="btn-two mini blue" id="btnDataUpdate" style="margin-left: 10px;">수정</button> -->
<!-- 		<button type="button" id="btnDelete" class="btn-two mini orange"  -->
<!-- 		style="margin-left: -8px;">삭제 -->
<!-- 		</button> -->
<%-- 	</c:if> --%>
	<div style="position:absolute; right:0; top:-40px;">
		<c:if test="${userVO.comdCd == 'USER02'}">
				<button class="btn-two mini blue"
					type="button" id="btnDataUpdate"
					style="position: absolute; right: 50px; top: 30px; width: 51px;">수정</button>

				<button type="button" id="btnDelete" class="btn-two mini orange"
					style="position: absolute; right: -7px; top: 30px; width: 51px;">삭제</button>
		</c:if>
	</div>
		
	<div class="table_title">
		<span id="titleSpan">&nbsp;${lectureDataVO.lecdTitle}</span>
	</div>
	
	<div class="board_info" style="position: absolute; right:20px;">
		<span>작성자:${lectureDataVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</span>&nbsp; 
		<span>작성일:
			<fmt:formatDate
				value="${lectureDataVO.lecdDt}" pattern="yyyy-MM-dd" />
		</span> &nbsp;
	</div>
	
	
	
	
	</br>
<!-- 	<div id="imgDiv"> -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${not empty lectureDataVO.filesDetailVOList}"> --%>
<%-- 				<c:forEach items="${lectureDataVO.filesDetailVOList}" var="vo"> --%>
<%-- 					<c:if test="${vo.fileExtsn eq 'png' or vo.fileExtsn eq 'jpg'}"> --%>
<!-- 					<div class="image_container" -->
<%-- 						style="background-image: url(/resources/upload/${vo.fileSvnm});"></div> --%>
<%-- 					</c:if> --%>
<%-- 				</c:forEach> --%>
<!-- 				<br /> -->
<%-- 			</c:when> --%>
<%-- 		</c:choose> --%>
<!-- 	</div> -->
	</br>
	<div class="board_content" style="line-height: 30px; font-size: 15px;height: 500px;">
		<span id="conSpan">${lectureDataVO.lecdCon}</span>
	</div>
	<hr class="board_separator">
	
	
	<!-- 댓글 -->
	<div id="commentList" class="card-footer">
		<c:choose>
			<c:when test="${not empty lectureDataVO.filesDetailVOList}">
			첨부파일 : 
				<c:forEach items="${lectureDataVO.filesDetailVOList}" var="vo">
					<div class="row">
						<div class="col-md-8">
							<div class="form-group">
								<span><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path d="M288 32c0-17.7-14.3-32-32-32s-32 14.3-32 32V274.7l-73.4-73.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l128 128c12.5 12.5 32.8 12.5 45.3 0l128-128c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L288 274.7V32zM64 352c-35.3 0-64 28.7-64 64v32c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V416c0-35.3-28.7-64-64-64H346.5l-45.3 45.3c-25 25-65.5 25-90.5 0L165.5 352H64zm368 56a24 24 0 1 1 0 48 24 24 0 1 1 0-48z"/></svg>
								<a href="/resources/upload/${vo.fileSvnm}" download="${vo.fileOrnm}">${vo.fileOrnm}&nbsp;(${vo.fileSize}&nbsp;Byte)</a>
							</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>

	<br />
	
	
	<button type="button" id="btnCancle" class="btn-two mini dark"
	style="position:relative; left:50%; transform:translateX(-50%); 
			margin-top:80px; width:100px; height:30px; font-size:14px;">목록</button>
</div>
</div>

<div class="container" style="background-color: white; margin-left: 1px;display: none;">
	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
		<div class="col-lg-12">
			</br>
			<h1 class="page-header"></h1>
		</div>
				<div style="margin-left: 1px;">
							<button type="button" class="btn-two mini sky"
								style="position: relative; right: -874px; top: 21px;" id="btnDataSubmit">수정</button>
							<button type="button" class="btn-two mini orange"
								style="position: relative; right: -854px; top: 20px;" id="btnUpdateCancle">취소</button>
						</div>
	</div>
	<div class="panel" style="margin-left: 1px;">
		<div id="contAreaBox">
		
			<div class="panel">
				<div class="panel-body">
					<form role="form" id="lecdataFrm"
						action="/professor/lecturedata/update?${_csrf.parameterName}=${_csrf.token}"
						method="post" enctype="multipart/form-data">
						<input type="hidden" name="lecCd" value="${lectureDataVO.lecCd}" />
						<input type="hidden" name="lecdCd" value="${lectureDataVO.lecdCd}" id="lecdCd"/>
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
										<th class="active" hidden>작성자</th>
										<td class="form-inline" hidden><input type="text" id="userNm"
											name="userNm" value="${lectureDataVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}" readonly
											class="form-control" style="width: 200px" />
										</td>
									</tr>
									<tr>
										<th class="active">제목</th>
										<td class="form-inline"><input type="text" id="lecdTitle"
											name="lecdTitle" class="form-control" style="width: 840px"
											value="${lectureDataVO.lecdTitle}" /></td>
									</tr>
									<tr>
										<th class="active">첨부파일</th>
										<td class="form-inline"><input type="file"
											id="uploadFiles" name="uploadFiles" class="form-control"
											style="width: 840px" multiple /></td>
									</tr>
									<tr>
										<th class="active">내용</th>
										<td class="form-inline"><textarea id="lecdCon" name="lecdCon"
												cols="100" rows="10" ><c:out value="${lectureDataVO.lecdCon}" /></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
				
						<sec:csrfInput />
					</form>
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
	$("#lecNm").text($(".lectureName").text());
	$("#btnDataUpdate").on("click", function(){
		
		$('.free_box').hide();
		$('.container').show();
		
		
	});
	$("#btnUpdateCancle").on("click", function(){
		sweetConfirmUpdateCancle();
	});
	
	function sweetConfirmUpdateCancle() {
	    Swal.fire({
	        text: "수정을 취소 하시겠습니까?",
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
	        	$('.free_box').show();
	    		$('.container').hide();
	        } else {
	        	
	        }
	    });
	}
	
	
	
	$("#btnCancle").on("click", function(){
// 		history.back();
		location.href = "/professor/lecturedata/list?lecCd=" + ${param.lecCd};

	});
	$("#btnDelete").on("click", function(){
		data = {
			"lecdCd" : $("#lecdCd").val()
		};
		$.ajax({
			url:"/professor/lecturedata/delete?${_csrf.parameterName}=${_csrf.token}",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			dataType:"json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success : function(result) {
				console.log("result", result);
				sweetConfirmDelete();
			}
			
		});
		
	});
	function sweetConfirmDelete() {
	    Swal.fire({
	        text: "삭제하시겠습니까?",
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
	        	alertSuccess("삭제되었습니다." ,"/professor/lecturedata/list?lecCd=" + ${param.lecCd});
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('삭제 취소하였습니다');
	        }
	    });
	}
	
	
    $("#btnDataSubmit").on("click", function () {
        sweetConfirmUpdate();


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
	function sweetConfirmUpdate() {
	    Swal.fire({
	        text: "수정하시겠습니까?",
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
// 	            console.log("@@", result);
	            $('#lecdataFrm').submit();
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('수정을 취소하였습니다');
	        }
	    });
	}
	
});	

</script>



