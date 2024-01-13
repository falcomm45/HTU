<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
/* 여기 스타일 전부 가져다가 복붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "notice_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
.notice_box {
	width: 100%;
	padding: 40px;
	background-color: #ffffff;
}
/* 상단에 있는 제목 (여기서는 상담내역) css입니다
	 그대로 복붙하시고 해당div에  .table_topic값 주세요*/
.notice_box .table_topic {
	font-size: 20px;
	padding-bottom: 30px;
}

.notice_box .table_topic i {
	margin-left: 10px;
}
/* table입니다 */
.notice_box table {
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
.notice_box tr {
	height: 40px;
	border-bottom: 1px solid #ebebeb;
}

.notice_box tr:first-child {
	background-color: #EEF1F6;
}

.notice_box tr:hover {
	background-color: #f2f3f4;
}

.notice_box tr:first-child:hover {
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

<div class="notice_box" style="background-color: white;">

	<!-- 카테고리 -->
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		
<c:if test="${userVO.comdCd == 'USER01'}">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER02'}">		
	<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

<c:if test="${userVO.comdCd == 'USER03'}">		
	<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
</c:if>

		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/common/board/notice/list">커뮤니티</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/common/board/notice/list">공지사항</a></span>
	</div>
	<!-- 카테고리 -->
	
	<div class="board_wrap" style="width:100%; position:relative;">
		<input id="empCd" name="empCd" type="hidden" value='${noticeBoardVO.empCd}'/>
	
	<!-- 수정/삭제버튼 -->
		<div style="position:absolute; right:-9px; top:-40px;">
			<c:if test="${userVO.comdCd eq 'USER03'}">
				<button class="btn-two mini blue"
					onclick="location.href='/common/board/notice/update?nbCd=${noticeBoardVO.nbCd}'"
					style="margin-right:-8px;">수정</button>
				<button type="button" id="btnDelete" class="btn-two mini orange">삭제</button>
			</c:if>
		</div>
	<!-- 수정/삭제버튼 -->
	
	<!-- 글 제목 -->
	<div class="table_title">&nbsp;${noticeBoardVO.nbTitle}</div>
	<!-- 글 제목 끝 -->
	
	</br>
	
	<!-- 정보 -->
		<div class="board_info" style="position: absolute; right:20px;" >
			<span>작성자:&nbsp;${noticeBoardVO.userNm}</span>&nbsp;
			<span>작성일:&nbsp;
				<fmt:formatDate
					value="${noticeBoardVO.nbReg}" pattern="yyyy-MM-dd HH:mm" />
			</span> &nbsp;
			<span>조회수:&nbsp;${noticeBoardVO.nbCnt}</span>
		</div>
	<!-- 정보 끝 -->
	
	</br>
	</br>
	</br>
	
	<!-- 이미지 나오는 공간 -->
	<c:choose>
		<c:when test="${not empty noticeBoardVO.filesDetailVOList}">
			<c:forEach items="${noticeBoardVO.filesDetailVOList}" var="vo">
				<div class="image_container"
					style="background-image: url(/resources/upload/${vo.fileSvnm});">
				</div>
			</c:forEach>
			<br />
		</c:when>
	</c:choose>
	<!-- 이미지 나오는 공간 끝 -->
	
	</br>

<%-- <div class="board_content" style="line-height: 30px; font-size: 15px;"><pre>${noticeBoardVO.nbCon}</pre></div> --%>
	
	<!-- 글 내용 -->
	<div class="board_content" style="width:100%;  line-height: 30px; font-size: 15px;">
		<pre style="width:100%; overflow-x:hidden; text-wrap:wrap;">${noticeBoardVO.nbCon}</pre>
	</div>
	<!-- 글 내용 -->
	
	</div>

	</br>
	</br>
	

	
	</br>
	
	<!-- 목록 버튼 -->
	<button class="btn-two mini dark" onclick="goBack()"
			style="position:relative; left:50%; transform:translateX(-50%); 
			margin-top:80px; width:80px; height:30px; font-size:14px;">목록</button>
	<!-- 목록 버튼 끝 -->
	</div>
</div>

<form id="infoForm" action="/common/board/notice/update?nbCd=${vo.nbCd}" method="get">
   <input type="hidden" id="nbCd" name="nbCd" value='<c:out value="${noticeBoardVO.nbCd}"/>'>
</form>

<script type="text/javascript" src="/resources/js/postReport.js"></script>


<script type="text/javascript" src="/resources/js/postReport.js">
	$(function() {
		$(".image_container").each(function() {
			let url = $(this).data("url");
			$(this).css({
				"background-image" : "url(/resources/upload/" + url + ")",
				"background-position" : "center",
				"background-size" : "cover"
			});
		});
	});
</script>

<script>
    let form = $("#infoForm");
	
    function goBack() {
        window.history.back();
    }
    
    $("#list_btn").on("click", function(){
        form.find("#nbCd").remove();
        form.attr("action", "/common/board/notice/list");
        form.submit();
     });
     
     $("#update_btn").on("click", function(){
        form.attr("action", "/common/board/notice/update");
        form.submit();
     });
     
     // 버튼 클릭 이벤트 정의
     $("#delete_btn").click(function() {
         // 확인 다이얼로그 표시
         if (confirm("게시물을 삭제하시겠습니까?")) {
             // 삭제 함수 호출
             deletePost("${noticeBoardVO.nbCd}", "${_csrf.token}");
         }
     });

    
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
                    deletePost("${noticeBoardVO.nbCd}", "${_csrf.token}");
                }
            });
        });
    });

    //게시물 삭제 함수
    function deletePost(nbCd, csrfToken) {
        $.ajax({
            type: "POST",
            url: "/common/board/notice/deletePost", 
            data: JSON.stringify({nbCd: nbCd}),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            headers: {
                "X-CSRF-TOKEN": csrfToken
            },
            success: function (data) {
                if (data.result === "success") {
                    alertSuccess("삭제가 완료되었습니다.", "/common/board/notice/list");
                    <sec:authorize access="hasRole('ROLE_EMPLOYEE')">
                        alertSuccess("삭제가 완료되었습니다.", "/common/board/notice/list");
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