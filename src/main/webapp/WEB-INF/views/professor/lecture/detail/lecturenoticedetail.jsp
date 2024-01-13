<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
.table_topic{font-size: 20px; padding-bottom:30px;}
.table_topic i{margin-left:10px;}
.board_wrap {
	background-color: #ffffff;
	padding: 40px;
}

.board_header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.board_title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 0px;
}

.board_info {
	color: #555;
	font-size: 14px;
	margin-bottom: 0px;
}

.board_info span {
	margin-right: 20px;
}

.image_container {
	width: 920px;
	height: 400px;
	border: 1px solid #ccc;
	background-position: center;
	background-size: cover;
	margin-bottom: 20px;
}

.board_content {
	text-align: left;
	max-width: 60%;
	white-space: pre-line;
}

.report_button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #800020;
	color: #fff;
	text-decoration: none;
	font-weight: 300;
	border-radius: 5px;
}

.board_separator {
	border-top: 1px solid #ccc;
	margin: 20px 0;
}

.report_button:hover {
	background-color: #600015;
}
#datatable-scroller {
	width: 1000px;
}
.container{
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
	<a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a effect">공지사항</a>
    <a href="/professor/task/list?lecCd=${param.lecCd}" class="sub_menu_a">과제</a>
    <a href="/professor/test/testList?lecCd=${param.lecCd}" class="sub_menu_a">시험</a>
    <a href="/professor/lectureAttendance?lecCd=${param.lecCd}" class="sub_menu_a">출결관리</a>
    <a href="/professor/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
    <a href="/professor/objection/list?lecCd=${param.lecCd}" class="sub_menu_a">성적이의신청</a>
</div>
<div class="board_wrap">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/list" style="font-size:12px; color:#888888;">강의실</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/detail?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;" id="lecNm"></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">공지사항</a></span>
	</div>
	<div class="board_header">
	</div>
	
	<div class="board_title" >
		<span id="titleSpan">${lectureNoticeVO.lecnTitle}</span>
	</div>
	<div style="position:absolute; right:0; top:30px;">
		<c:if test="${userVO.comdCd == 'USER02'}">
				<button class="btn-two mini blue"
					type="button" id="btnLecnUpdate"
					style="position: absolute; right: 80px; top: 100px; width: 51px;">수정</button>

				<button type="button" id="btnDelete" class="btn-two mini orange"
					style="position: absolute; right: 23px; top: 100px; width: 51px;">삭제</button>
		</c:if>
	</div>
		<div class="board_info" style="position: absolute; right:20px;">

			<span>작성자:${lectureNoticeVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</span> 
			<span>작성일:
				<fmt:formatDate
					value="${lectureNoticeVO.lecnReg}" pattern="yyyy-MM-dd" />
			</span> 
			<c:if test="${lectureNoticeVO.lecnUdt ne null}">
			<span>수정일:
				<fmt:formatDate
					value="${lectureNoticeVO.lecnUdt}" pattern="yyyy-MM-dd" />
			</span>
			</c:if> 
			<span>조회수:${lectureNoticeVO.lecnCnt}</span>
		</div>

<br />


	<hr class="board_separator">
	<div id="imgDiv">
	<c:choose>
		<c:when test="${not empty lectureNoticeVO.filesDetailVOList}">
			<c:forEach items="${lectureNoticeVO.filesDetailVOList}" var="vo">
				<c:if test="${vo.fileExtsn eq 'jpg' or vo.fileExtsn eq 'png'}">
				<c:if test="${vo.fileUsed == 0}">
				<div class="image_container"
					style="background-image: url(/resources/upload/${vo.fileSvnm});"></div>
				</c:if>
				</c:if>
			</c:forEach>
			<br />
		</c:when>
	</c:choose>
	</div>
	<hr class="board_separator">

	<div class="board_content">
		<textarea style="text-align: left; display: none;"
				 id="lecnCon" name="lecnCon"
				 cols="100" rows="10" class="form-control">
			<c:out value="${lectureNoticeVO.lecnCon}" />
		</textarea>
<%-- 		<input type="hidden" id="lecnCon" name="lecnCon" value="${lectureNoticeVO.lecnCon}"/> --%>
		<span id="conSpan">${lectureNoticeVO.lecnCon}</span>
	</div>

	<hr class="board_separator">

	<div id="commentList" class="card-footer">

	</div>
	<br />
<%-- 	<c:if test="${userVO.comdCd eq 'USER02'}"> --%>
<!-- 		<button class="btn-two mini green" -->
<!-- 			type="button" -->
<!-- 			id="btnLecnUpdate" -->
<!-- 			style="margin-left: 10px;">수정</button> -->
<!-- 		<button type="button" id="btnDelete" class="btn-two mini orange"  -->
<!-- 		style="margin-left: -8px;">삭제 -->
<!-- 		</button> -->
<%-- 	</c:if> --%>
		<button type="button" id="btnCancle" class="btn-two mini dark"
		style="position:relative; left:50%; transform:translateX(-50%); 
			margin-top:80px; width:100px; height:30px; font-size:14px;">목록</button>
</div>




<div class="container" style="background-color: white; margin-left: 1px;display: none;">
	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
		<div class="col-lg-12">
			</br>
			<h1 class="page-header"></h1>
		</div>
	</div>
	<div class="panel" style="margin-left: 1px;">
		<div id="contAreaBox">
			<div class="panel">
				<div class="panel-body">
					<form role="form" id="lecNoticeFrm"
					action="/professor/lecturenotice/update?${_csrf.parameterName}=${_csrf.token}"
					method="post" enctype="multipart/form-data">
					<input type="hidden" name="lecnCd" value="${lectureNoticeVO.lecnCd}" id="lecnCd"/>
					<input type="hidden" name="lecCd" value="${lectureNoticeVO.lecCd}" /> 
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
										<th class="active">제목</th>
										<td class="form-inline"><input type="text" id="lecnTitle"
											name="lecnTitle" class="form-control" style="width: 840px"
											value="${lectureNoticeVO.lecnTitle}" /></td>
									</tr>
									<tr>
										<th class="active">첨부파일</th>
										<td class="form-inline"><input type="file"
											id="uploadFiles" name="uploadFiles" class="form-control"
											style="width: 840px" multiple /></td>
									</tr>
									<tr>
										<th class="active">내용</th>
										<td class="form-inline"><textarea id="lecnCon" name="lecnCon"
												cols="100" rows="10" class="form-control"
												style="width: 840px"><c:out value="${lectureNoticeVO.lecnCon}" /></textarea></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div style="margin-left: 1px;">
							<button type="button" class="btn-two mini sky"
								style="position: absolute; right: 618px; top: 79px;" id="btnLecnSubmit">수정</button>
							<button type="button" class="btn-two mini orange"
								style="position: absolute; right: 674px; top: 79px;" id="btnUpdateCancle">취소</button>
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
	console.log("@",$(".lectureName").text());
	$("#btnLecnUpdate").on("click", function(){
		
		$('.board_wrap').hide();
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
	        	$('.board_wrap').show();
	    		$('.container').hide();
	        } else {
	        	
	        }
	    });
	}
	
	
	$("#btnCancle").on("click", function(){
		console.log("왔다")
		location.href = "/professor/lecturenotice/list?lecCd=" + ${lectureNoticeVO.lecCd};

	});
    $("#btnLecnSubmit").on("click", function () {
    	
		sweetConfirmUpdate();
    });
    
	function sweetConfirmUpdate() {
	    Swal.fire({
	        text: "공지사항을 수정 하시겠습니까?",
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
	            alertError('수정을 취소하였습니다.');
	        }
	    });
	}


	function sweetConfirmHistoryBack() {
	    Swal.fire({
	        text: "목록으로 돌아가시겠습니까?",
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
	            location.href = "/professor/lecturenotice/list?lecCd=" + ${lectureNoticeVO.lecCd};
	        	history.back();
	        } else {
				
	        }
	    });
	}


	
	$("#btnDelete").on("click", function(){
		
		data = {
			"lecnCd":$("#lecnCd").val()
		};
		$.ajax({
			url:"/professor/lecturenotice/delete?${_csrf.parameterName}=${_csrf.token}",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			dataType:"json",
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
	        	alertSuccess("삭제되었습니다." ,"/professor/lecturenotice/list?lecCd=" + ${lectureNoticeVO.lecCd});
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('삭제 취소하였습니다.');
	        }
	    });
	}
	
});	

</script>



