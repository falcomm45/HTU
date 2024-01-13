<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<style>
body {
	font-family: 'Arial, Helvetica, sans-serif'; /* 전체 페이지의 기본 폰트 설정 */
}

/* Container 내부의 요소들 간격 설정 */
.table-responsive {
	margin: 20px 0;
	text-align: center;
}

.tbl_Form th, .tbl_Form td {
	padding: 10px;
}

.form-inline input {
	width: 100%; /* 폭을 100%로 변경 */
	box-sizing: border-box;
}

#image-container {
	width: 100%;
	height: 300px;
	border: 1px solid #ccc;
	overflow: hidden;
	position: relative;
}

#image-container img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	position: absolute;
	top: 0;
	left: 0;
}

#bdCon {
	width: 100%;
	height: 200px;
}

.panel-body {
	padding: 20px; /* Panel Body의 padding 설정 */
	margin-top: -64px;
}

.btn-group {
	margin-bottom: 20px;
}

.btn-primary, .btn-danger {
	width: 80px; /* 버튼 폭을 조절 */
}

.page-header {
	position: relative;
	left: 32px;
	top: 23px;
	font-size: 28px; /* 글자 크기 조절 */
}

#contAreaBox select {
	float: right;
	position: absolute;
	top: 133px;
	left: 56px;
}

#selBoard {
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	font-family: 'Arial, Helvetica, sans-serif';
	cursor: pointer;
	outline: none;
	background-color: #fff;
	width: 150px; /* 적절한 폭으로 조절 */
}

#selBoard option {
	padding: 10px;
	font-size: 16px;
	font-family: 'Arial, Helvetica, sans-serif';
}

/* 셀렉트 화살표 아이콘 스타일링 (선택 사항) */
#selBoard::after {
	content: '\25BC';
	position: absolute;
	top: 50%;
	right: 10px;
	transform: translateY(-50%);
	font-size: 18px;
	pointer-events: none;
}

/* 선택된 옵션의 배경색과 텍스트 색상 설정 */
#selBoard option:checked {
	background-color: #007bff; /* 선택된 배경색 */
	color: #fff; /* 선택된 텍스트 색상 */
}

.container .table_topic {
	font-size: 20px;
	padding-bottom: 30px;
	position: absolute;
	top: 67px;
	left: 35px;
}

.container .table_topic i {
	margin-left: 10px;
}
</style>

<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>

<div class="container"
	style="background-color: white; position: absolute; left: 24px;">
	<!-- 카테고리 표시 : 이거는 안에 스타일값 다 들어있으니까 통째로 복사하고 안에내용만 하드코딩하시면됩니다요 -->
	<div
		style="font-size: 12px; color: #888888; margin-bottom: 20px; padding: 35px;">
		
		<c:if test="${userVO.comdCd == 'USER01'}">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER02'}">		
	<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER03'}">		
	<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>
		
		<span style="font-size: 12px; color: #888888;">></span> <span
			style="font-size: 12px; color: #888888;"><a href="/common/board/notice/list">커뮤니티</a></span> <span
			style="font-size: 12px; color: #888888;">></span> <span
			style="font-size: 12px; color: #888888;"><a href="/common/board/notice/list">공지사항</a></span> <span
			style="font-size: 12px; color: #888888;">></span> <span
			style="font-size: 12px; color: #888888;"><a href="/common/board/notice/create">공지사항 등록</a></span>
	</div>

<div class="row" style="margin-bottom:20px; margin-left:1px;">
  <div class="col-lg-12">
<!--     <div class="table_topic"> -->
<!-- 				공지사항 등록<i class="fa-solid fa-circle-info" style="color: #333333;"></i> -->
<!-- 			</div> -->
  </div>
</div>


<div class="panel" style="margin-left:1px;">
  <div id="contAreaBox">
    <div class="panel">
      <div class="panel-body">
        <form role="form" id="boardForm" action="/common/board/notice/createPost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
          <div class="table-responsive" style="text-align:center;">
            <table id="datatable-scroller" class="table table-bordered tbl_Form" overflow-x: hidden;>
              <caption></caption>
              <colgroup>
                <col width="250px" />
                <col />
              </colgroup>
              <tbody>
                <tr>
                  <th class="active">제목</th>
                  <td class="form-inline">
                    <input type="text" id="nbTitle" name="nbTitle" class="form-control" style="width: 100%" />
                  </td>
                </tr>
                <tr>
                  <th class="active">첨부파일</th>
                  <td class="form-inline">
                    <input type="file" id="uploadFiles" name="uploadFiles" class="form-control" style="width: 100%" multiple />
                  </td>
                </tr>
                <tr>
                  <th class="active">내용</th>
                  <td class="form-inline">
                    <pre><textarea id="nbCon" name="nbCon" cols="100" rows="10" class="form-control"></textarea></pre>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
<!--           <div style="margin-left:1px;"> -->
<!--             <button type="submit" class="btn btn-primary">등록</button> -->
<!--             <a href="/common/board/notice/list" class="btn btn-danger">취소</a> -->
<!--           </div> -->
				<div>
					<a href="/common/board/notice/list" class="btn-two mini orange"
						style="position: relative; right: -1213px;">취소</a>
					<button type="submit" class="btn-two mini sky"
						style="position: relative; right: -1081px;">등록</button>
				</div>
          <sec:csrfInput/>
        </form>
      </div>
    </div>
  </div>
</div>
</div>

		
		
 <script type="text/javascript">
//등록버튼 클릭 시 실행
function submitForm(){

	$.ajax({
	  url: "/common/board/notice/createPost?${_csrf.parameterName}=${_csrf.token}",
	  contentType:"application/json;charset=utf-8",
	  data:JSON.stringify(data),
	  type: "post",
	  dataType:"json",
	  beforeSend:function(xhr){
	     xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	  },
	  success: function (result) {
	    // 성공적으로 제출되었을 때의 로직을 처리합니다. 예: 리다이렉트 또는 메시지 표시
	    console.log("result",result);
	  	//if문..(기본키 데이터가 있다면(selectKey에 의해 생성된))
	  	location.href="/common/board/notice/list";
	  }
	});
}

//화면이 모두 로딩되면 자동 실행
$(function(){  
	
	CKEDITOR.replace('nbCon', {
		filebrowserUploadUrl:'/common/board/notice/fileuploadCK?${_csrf.parameterName}=${_csrf.token}',
		height: 600
	});
	CKEDITOR.config.allowedContent = true;
	
}); 
</script> 
<!-- <div style="margin-left:1px;"> -->
<!-- 	<button type="submit" class="btn btn-primary">등록</button> -->
<!-- 	<a href="/common/board/notice/list" class="btn btn-danger">취소</a> -->
<!-- </div> -->


