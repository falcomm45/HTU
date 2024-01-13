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
}
</style>

<sec:authentication property="principal.userVO" var="userVO" />
<div class="container"
	style="background-color: white; position: absolute; left: 24px;">
	<div class="row">
		<div class="col-lg-12">
			</br>
			<h1 class="page-header">
				<div class="publicize_topic"
					style="position: absolute; left: 0%; top: 58%">
					글쓰기<i class="fa-solid fa-circle-info" style="position: absolute; top: 6px;"></i>
				</div>
			</h1>
		</div>
	</div>
	<div class="panel">
		<div id="contAreaBox" class="panel-body">
			<form role="form" id="boardForm"
				action="/common/board/publicize/create?${_csrf.parameterName}=${_csrf.token}"
				method="post" enctype="multipart/form-data">

				</br> </br> </br>
				<!-- 새로운 셀렉트 박스 -->
				<select id="boardType" name="boardType" class="form-control"
					style="width: 10%;" onchange="redirectToPage()">
					<option value="0">게시판 선택</option>
					<option value="2">자유게시판</option>
					<option value="3">홍보게시판</option>
					<option value="4">익명게시판</option>
				</select>

				<script>
    function redirectToPage() {
        var boardTypeSelect = document.getElementById("boardType");
        var selectedValue = boardTypeSelect.value;

        switch (selectedValue) {
            case "2":
                window.location.href = "/common/board/publicize/create";
                break;
            case "3":
                window.location.href = "/common/board/publicize/create";
                break;
            case "4":
                window.location.href = "/common/board/anonymous/insert";
                break;
            default:
                break;
        }
    }
</script>
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
								<th class="active" style="width: 10%;"><b>작성자</b></th>
								<td class="form-inline"><input type="text" id="userNm"
									name="userNm" value="${userVO.userCd}" readonly
									style="width: 10%;" class="form-control" /> <input type="text"
									id="userNm" name="userCd" value="${userVO.userCd}" readonly
									class="form-control" style="display: none;" /></td>
							</tr>
							<tr>
								<th class="active" style="width: 10%;"><b>제목</b></th>
								<td class="form-inline"><input type="text" id="bdTitle"
									name="bdTitle" class="form-control" /></td>
							</tr>
							<tr>
								<th class="active" style="width: 10%;"><b>첨부파일</b></th>
								<td class="form-inline"><input type="file" id="uploadFiles"
									name="uploadFiles" class="form-control" multiple /> <c:forEach
										var="image" items="${uploadedImages}">
										<div id="image-container">
											<img src="${image}" alt="업로드된 이미지">
										</div>
									</c:forEach></td>
							</tr>
							<tr>
								<th class="active" style="width: 10%;"><b>내용</b></th>
								<td>
									<!-- CKEditor 추가 --> <textarea id="bdCon" name="bdCon"
										class="form-control" rows="50;" cols="40;""></textarea>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div>
					<button type="submit" class="btn-two mini sky"
						style="position: absolute; right: 33px; bottom: 12px;">등록</button>
					<a href="/common/board/publicize/list" class="btn-two mini orange"
						style="position: absolute; right: 90px; bottom: 12px;">취소</a>
				</div>
				<sec:csrfInput />
			</form>
		</div>
	</div>
</div>
<script>
$(function() {
	
	CKEDITOR.replace('bdCon', {
		filebrowserUploadUrl:'/common/board/publicize/fileuploadCK?${_csrf.parameterName}=${_csrf.token}',
		height: 600
	});
	CKEDITOR.config.allowedContent = true;
});
</script>

