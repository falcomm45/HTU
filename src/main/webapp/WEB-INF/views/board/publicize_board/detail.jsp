<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
/* 여기 스타일 전부 가져다가 복붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "publicize_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
.publicize_box {
	width: 100%;
	padding: 40px;
	background-color: #ffffff;
}
/* 상단에 있는 제목 (여기서는 상담내역) css입니다
	 그대로 복붙하시고 해당div에  .table_topic값 주세요*/
.publicize_box .table_topic {
	font-size: 20px;
	padding-bottom: 30px;
}

.publicize_box .table_topic i {
	margin-left: 10px;
}
/* table입니다 */
.publicize_box table {
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
.publicize_box tr {
	height: 40px;
	border-bottom: 1px solid #ebebeb;
}

.publicize_box tr:first-child {
	background-color: #EEF1F6;
}

.publicize_box tr:hover {
	background-color: #f2f3f4;
}

.publicize_box tr:first-child:hover {
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
</style>
<sec:authentication property="principal.userVO" var="userVO" />

<div class="publicize_box" style="background-color: white;">

	<!-- 카테고리 -->
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
		
		<span style="font-size: 12px; color: #888888;">></span> 
		<span style="font-size: 12px; color: #888888;"><a href="/common/board/notice/list">커뮤니티</a></span> 
		<span style="font-size: 12px; color: #888888;">></span> 
		<span style="font-size: 12px; color: #888888;"><a href="/common/board/publicize/list">홍보게시판</a></span>
		</div>
	<!-- 카테고리 -->
	
	<div class="board_wrap" style="width:100%; position:relative;">
<!-- 		<div class="board_header"> -->
		<input id="userCd" name="userCd" type="hidden" value='${userVO.userCd}'/>
			</br> </br>
			
			<!-- 신고버튼 -->
			
			<c:if test="${(userVO.comdCd eq 'USER01' or userVO.comdCd eq 'USER02') and userVO.userCd ne boardVO.userCd}">
				<button class="btn-two mini orange"
					style="text-align: center; position: absolute; right: -7px; top: -12px;"
					onclick="openReportModal('${boardVO.bdCd}', '${userVO.userCd}')">

					<svg xmlns="http://www.w3.org/2000/svg" height="16" width="16"
						viewBox="0 0 512 512">
				<path fill="#ffffff"
							d="M256 32c14.2 0 27.3 7.5 34.5 19.8l216 368c7.3 12.4 7.3 27.7 .2 40.1S486.3 480 472 480H40c-14.3 0-27.6-7.7-34.7-20.1s-7-27.8 .2-40.1l216-368C228.7 39.5 241.8 32 256 32zm0 128c-13.3 0-24 10.7-24 24V296c0 13.3 10.7 24 24 24s24-10.7 24-24V184c0-13.3-10.7-24-24-24zm32 224a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z" />
				</svg>
					<span style="color: #ffffff; margin-left: 5px;">신고</span>
				</button>
			</c:if>
			<!-- 신고버튼 끝 -->
			
<!-- 		</div> -->
		
		<!-- 수정/삭제 버튼 -->
		<div style="position:absolute; right:0; top:-40px;">
		<c:if test="${userVO.userCd == boardVO.userCd}">
				<button class="btn-two mini blue"
					onclick="location.href='/common/board/publicize/update?bdCd=${boardVO.bdCd}'"
					style="position: absolute; right: 50px; top: 30px; width: 51px;">수정</button>
			</c:if>

			<c:if
				test="${userVO.comdCd == 'USER03' || userVO.userCd == boardVO.userCd}">
				<button type="button" id="btnDelete" class="btn-two mini orange"
					style="position: absolute; right: -7px; top: 30px; width: 51px;">삭제</button>
		</c:if>
		</div>
		<!-- 수정/삭제 버튼 끝 -->
		
		
		
		<!-- 글 제목 --> 
		<div class="table_title">&nbsp;${boardVO.bdTitle}</div>
		<!-- 글 제목 끝 -->
		
		</br>
		
		<!-- 정보 -->
		<div class="board_info" style="position: absolute; right:20px;">
			<span>작성자:&nbsp;${boardVO.userVO.userNm}</span>&nbsp;
			<span>작성일:&nbsp; 
				<fmt:formatDate
				 value="${boardVO.bdReg}" pattern="yyyy-MM-dd" />
			</span> &nbsp; 
			<span>조회수:&nbsp;${boardVO.bdCnt}</span>
		</div>
		<!-- 정보 끝 -->
		
		</br>

		<!-- Font Awesome CDN 추가 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-KyZXEAg3QhqLMpG8r+Knujsl5+z0I5t9z7/0Ooml1IX9e4h6qf4YO5lO0q72/AkOb7r3ZJOZIp9k5eFjnR5fWA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- 신고 모달창 -->
<div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="reportModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div class="modal-title" id="reportModalLabel" style="font-size: 25px;">
          <i class="fas fa-flag" style="margin-right: 10px;"></i>해당 게시글을 신고합니다.
<!-- 			<i class="bi bi-x-circle" style="margin-right: 10px;"></i>해당 게시글을 신고합니다. -->
        </div>
      </div>
      <div class="modal-body">
        <div class="form-group">
          <!-- 수정: 특수기호 추가 -->
          <label for="reportReason" style="margin-right: 5px; font-size: 20px;">&nbsp;● 신고사유</label>
          </br></br>
          <select class="form-control" id="prRsn" name="prRsn">
            <option value="" selected disabled>사유를 선택해주세요</option>
            <option value="0">불건전한 내용</option>
            <option value="1">주제에 맞지 않음</option>
            <option value="2">욕설 및 혐오표현</option>
            <option value="3">기타</option>
          </select>
        </div>
        </br></br>
        <div class="form-group">
          <!-- 수정: 특수기호 추가 -->
          <label for="prDetail" style="margin-right: 5px; font-size: 20px;" >&nbsp;● 상세내역</label>
          </br></br>
          <!-- style 속성으로 크기 고정 및 줄임 방지 -->
          <textarea class="form-control" id="prDetail" name="prDetail" rows="8" style="resize: none;" placeholder="상세 내용을 입력해주세요"></textarea>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn-two mini orange" onclick="submitReport('${boardVO.bdCd}', '${userVO.userCd}')" style="position: relative; right: -13px;">신고</button>
        <button type="button" class="btn-two mini gray" onclick="closeReportModal()">취소</button>
      </div>
    </div>
  </div>
</div>
<!-- 신고 모달창 -->

		<br />

		<table>
			

			</br>
			<!-- 이미지 나오는 공간 -->
			<c:choose>
				<c:when test="${not empty boardVO.fileList}">
					<c:forEach items="${boardVO.fileList}" var="vo">
						<div class="image_container"
							style="background-image: url(/resources/upload/${vo.fileSvnm});"></div>
					</c:forEach>
					<br />
				</c:when>
			</c:choose>
			<!-- 이미지 나오는 공간 끝 -->
			
			</br>
			
			<!-- 글 내용 -->
			<div class="board_content" style="width:100%;  line-height: 30px; font-size: 15px;">
			<pre style="width:100%; overflow-x:hidden; text-wrap:wrap;">${boardVO.bdCon}</pre>
			</div>
			<!-- 글 내용 -->

		</table>
		
		</br>
		</br>
		
		<!-- 댓글 -->
		<div id="commentList" class="card-footer" style="margin-top:80px;">
			<div class="row">
				<div class="col-md-10">
					<div class="form-group">
						<input id="commentContent" type="text" style="width: 115%;"
							class="form-control col-md-8" placeholder="댓글을 입력하세요." required>
					</div>
				</div>
				<div class="col-md-2 ml-5">
					<div class="form-group">
						<button id="insertComment" class="btn-two mini sky"
							style="position: relative; right: -171px;">등록</button>
					</div>
				</div>
			</div>
			<sec:authentication property="principal.userVO" var="userVO" />
			<c:forEach items="${boardVO.commentList}" var="vo">
				<div class="row">
					<div class="col-md-8">
						<div class="form-group">
							<span>${vo.cmtCon}</span>
							<button class="btn btn-sm btn-primary parentComment"
								data-cmt-cd="${vo.cmtCd}">댓글</button>
							<button class="btn btn-sm btn-danger commentReport"
								data-cmt-cd="${vo.cmtCd}">신고</button>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	<!-- 댓글 끝 -->
		</br>

		<!-- 목록 버튼 -->
	<button class="btn-two mini dark" onclick="goBack()"
			style="position:relative; left:50%; transform:translateX(-50%); 
			margin-top:80px; width:80px; height:30px; font-size:14px;">목록</button>
	<!-- 목록 버튼 끝 -->
	</div>
</div>

<form id="infoForm" action="/common/board/publicize/update?bdCd=${vo.bdCd}"
	method="get">
	<input type="hidden" id="bdCd" name="bdCd"
		value='<c:out value="${boardVO.bdCd}"/>'>
</form>


<link rel="stylesheet" type="text/css"
	href="path/to/sweetalert2.min.css">
<script src="path/to/sweetalert2.all.min.js"></script>

<script type="text/javascript" src="/resources/js/postReport.js">
    $(function () {
        $(".image_container").each(function () {
            let url = $(this).data("url");
            $(this).css({
                "background-image": "url(/resources/upload/" + url + ")",
                "background-position": "center",
                "background-size": "cover"
            });
        });
    });
</script>

<script>
    function goBack() {
        window.history.back();
    }
</script>

<script>
    let form = $("#infoForm");

    $(function () {
        $("#btnDelete").click(function () {
            Swal.fire({
                title: '삭제하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: '확인',
                cancelButtonText: '취소' 
            }).then((result) => {
                if (result.isConfirmed) {
                    deletePost("${boardVO.bdCd}", "${_csrf.token}");
                }
            });
        });
    });

    
    function deletePost(bdCd, csrfToken) {
        $.ajax({
            type: "POST",
            url: "/common/board/publicize/delete", 
            data: JSON.stringify({bdCd: bdCd}),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            headers: {
                "X-CSRF-TOKEN": csrfToken
            },
            success: function (data) {
                if (data.result === "success") {
                    alertSuccess("삭제가 완료되었습니다.", "/common/board/publicize/list");
                    <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                        alertSuccess("삭제가 완료되었습니다.", "/common/board/publicize/list");
                    </sec:authorize>
                } else {
                    alertError("Delete failed.");
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error("AJAX Error:", textStatus, errorThrown);
                alertError("에러가 발생하였습니다.");
            }
        });
    }
</script>