<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<script src="/resources/js/jquery.min.js"></script>
<script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script>

<style>
#datatable-scroller {
	width: 1000px;
}

.container {
	width: 1032px;
}
</style>

<sec:authentication property="principal.userVO" var="userVO" />

<div class="container"
	style="background-color: white; margin-left: 1px;">
	<div class="row" style="margin-bottom: 20px; margin-left: 1px;">
			<div style="font-size: 12px; color: #888888; margin-bottom: 20px;">
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
					style="font-size: 12px; color: #888888;"><a href="/common/board/notice/list">커뮤니티</a></span> 
					<span style="font-size: 12px; color: #888888;">></span> 
					<span style="font-size: 12px; color: #888888;"><a href="/common/board/publicize/list">홍보게시판</a></span>
					<span style="font-size: 12px; color: #888888;">></span> 
					<span style="font-size: 12px; color: #888888;"><a href="">수정</a></span>
			</div>
			<div style="margin-left: 1px;">
							<button type="submit" class="btn-two mini sky"
								style="position: relative; right: -874px; top: 21px;">수정</button>
							<a href="/common/board/publicize/list" class="btn-two mini orange"
								style="position: relative; right: -854px; top: 20px;">취소</a>
						</div>
	</div>
	<div class="panel" style="margin-left: 1px;">
		<div id="contAreaBox">
			<div class="panel">
				<div class="panel-body">
					<form role="form" id="boardForm"
						action="/common/board/publicize/update?${_csrf.parameterName}=${_csrf.token}"
						method="post" enctype="multipart/form-data">
						<input type="text" name="bdCd" value="${boardVO.bdCd}"
							style="display: none;">
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
											name="userNm" value="${boardVO.userVO.userCd}" readonly
											class="form-control" style="width: 200px" /> <input
											type="text" id="userNm" name="userCd"
											value="${boardVO.userVO.userCd}" readonly
											class="form-control" style="width: 200px; display: none;" />
										</td>
									</tr>
									<tr>
										<th class="active">제목</th>
										<td class="form-inline"><input type="text" id="bdTitle"
											name="bdTitle" class="form-control" style="width: 840px"
											value="${boardVO.bdTitle}" /></td>
									</tr>
									<tr>
										<th class="active">첨부파일</th>
										<td class="form-inline"><input type="file"
											id="uploadFiles" name="uploadFiles" class="form-control"
											style="width: 840px" multiple /></td>
									</tr>
									<tr>
										<th class="active">내용</th>
										<td class="form-inline"><textarea id="bdCon" name="bdCon"
												cols="100" rows="10" class="form-control"
												style="width: 840px">${boardVO.bdCon}</textarea></td>
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
<script>
$(function() {
	
	CKEDITOR.replace('bdCon', {
		filebrowserUploadUrl:'/common/board/publicize/fileuploadCK?${_csrf.parameterName}=${_csrf.token}',
		height: 600
	});
	CKEDITOR.config.allowedContent = true;
});
</script>