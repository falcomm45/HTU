<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

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

/* 각자 만든 td개수만큼만쓰고 총 합이 100이 되도록 잘 분배해서 쓰세요 이부분 제일 신경써서 해주세요*/
.free_box tr td:nth-child(1) {
	width: 5%;
}

.free_box tr td:nth-child(2) {
	width: 10%;
}

.free_box tr td:nth-child(3) {
	width: 20%;
}

.free_box tr td:nth-child(4) {
	width: 10%;
}

.free_box tr td:nth-child(5) {
	width: 15%;
}

.free_box tr td:nth-child(6) {
	width: 15%;
}

.free_box tr td:nth-child(7) {
	width: 25%;
}

.image_container {
	width: 920px;
	height: 400px;
	border: 1px solid #ccc;
	background-position: center;
	background-size: cover;
	margin-bottom: 20px;
}
#datatable-scroller {
	width: 1000px;
}
.container{
	width: 1032px;
}
</style>


<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>

<div class="free_box" style="background-color: white;">

<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">강의</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span id="lecNm" style="font-size:12px; color:#888888;"></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">자료실</span>
	</div>
<div class="board_wrap">
	<div class="board_header">
		</br>
		</br>
		<!-- <div class="table_topic">자유게시판<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div> -->
			
	</div>
		<!-- 정보 -->
		<div class="board_info">
			<span>작성자:${lectureDataVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</span>&nbsp; 
			<span>작성일:
				<fmt:formatDate
					value="${lectureDataVO.lecdDt}" pattern="yyyy-MM-dd" />
			</span> &nbsp;
<!-- 			<button class="btn-two mini orange" onclick="goBack()">목록</button> -->
		</div>
		<!-- 정보 -->
		

	<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
		aria-labelledby="reportModalLabel" aria-hidden="true">

	</div>

	<br />

	<table>
	<div class="table_title">
		<span id="titleSpan">&nbsp;${lectureDataVO.lecdTitle}</span>
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
		<span id="conSpan" style="padding-top: 50px">${lectureDataVO.lecdCon}</span>
	</div>
	<hr class="board_separator">
	
	</table>
	
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
 			margin-top:10px; width:100px; height:30px; font-size:14px;">목록</button>
</div>
</div>


<script type="text/javascript">
logout = function() {
	$("#logoutForm").submit();
}
	
$(function(){
	$("#lecNm").text($(".sub_title").text());
	
	
	$("#btnCancle").on("click", function(){
		location.href = "/student/lecturedata/list?lecCd=" + ${param.lecCd};

	});


	

	
});	

</script>



