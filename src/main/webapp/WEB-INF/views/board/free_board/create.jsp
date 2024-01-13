<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
	top: 84px;
	left: 157px;
	width: 148px;
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

<sec:authentication property="principal.userVO" var="userVO" />
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
			style="font-size: 12px; color: #888888;"><a href="/common/board/free/create">글쓰기</a></span>
	</div>
	<div class="row">
	</div>
	<div class="panel">
		<div id="contAreaBox" class="panel-body">
			<form role="form" id="boardForm"
				action="/common/board/free/create?${_csrf.parameterName}=${_csrf.token}"
				method="post" enctype="multipart/form-data">
				

				<div class="table-responsive">
					<table id="datatable-scroller"
						class="table table-bordered tbl_Form">
						<caption></caption>
						<colgroup>
							<col width="250px" />
							<col />
						</colgroup>
						<tbody>
							<tr>
								<th class="active" style="width: 10%; position: absolute; top: 84px; "><b>게시판 선택</b></th>
								</br>
								<td class="form-inline">
								</br>
								<!-- 드롭다운 추가 -->
									<select id="selBoard" name="selBoard">
										<option value="free">자유게시판</option>
										<option value="anonymous">익명게시판</option>
										<option value="publicize">홍보게시판</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="active" style="width: 10%;"><b>작성자</b></th>
									<td class="form-inline">
										<input type="text" id="userNm" name="userNm" value="${userVO.userNm}" readonly style="width: 13%;" class="form-control" /> 
										<input type="text" id="userCd" name="userCd" value="${userVO.userCd}" readonly class="form-control" style="display: none;" />
									</td>
							</tr>
							<tr>
								<th class="active" style="width: 10%;"><b>제목</b></th>
								<td class="form-inline">
								<input type="text" id="bdTitle" name="bdTitle" class="form-control" /></td>
							</tr>
							<tr>
								<th class="active" style="width: 10%;"><b>첨부파일</b></th>
								<td class="form-inline"><input type="file" id="uploadFiles" name="uploadFiles" class="form-control" multiple /> 
								<c:forEach var="image" items="${uploadedImages}">
										<div id="image-container">
											<img src="${image}" alt="업로드된 이미지">
										</div>
								</c:forEach></td>
							</tr>
							<tr>
								<th class="active" style="width: 10%;"><b>내용</b></th>
								<td>
 								    <pre><textarea id="bdCon" name="bdCon" class="form-control" rows="50" cols="40"></textarea></pre>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<a href="/common/board/notice/list" class="btn-two mini orange"
						style="position: relative; right: -1213px;">취소</a>
					<button type="submit" class="btn-two mini sky"
						style="position: relative; right: -1081px;">등록</button>
				</div>
				<sec:csrfInput />
			</form>
		</div>
	</div>
</div>
<script>
	$(function() {
		
		CKEDITOR.replace('bdCon', {
			filebrowserUploadUrl:'/common/board/free/fileuploadCK?${_csrf.parameterName}=${_csrf.token}',
			height: 600
		});
		CKEDITOR.config.allowedContent = true;
		
		$("#selBoard").on(
				"change",
				function() {
					let boardName = $(this).val();
					console.log("boardName : " + boardName);

					switch (boardName) {
					case "free":
						$("#boardForm").attr("action",
								"/common/board/free/create");
						break;
					case "anonymous":
						$("#boardForm").attr("action",
								"/common/board/anonymous/create");
						break;
					case "publicize":
						$("#boardForm").attr("action",
								"/common/board/publicize/create");
						break;
					default:
						break;
					}
				});

	});
</script>

