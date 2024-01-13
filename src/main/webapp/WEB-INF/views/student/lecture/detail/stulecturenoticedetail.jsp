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
	padding: 30px; 
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
	margin-bottom: -30px;
	padding-right: 
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
	.lecture_menu a{border:1px solid #eeeeee;background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; border:1px solid #ffffff;}
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<input type="hidden" name="lecnCd" value="${lectureNoticeVO.lecnCd}" id="lecnCd"/>
<input type="hidden" name="lecCd" value="${lectureNoticeVO.lecCd}" /> 

<div class="board_wrap">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">강의</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span id="lecNm" style="font-size:12px; color:#888888;"></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">공지사항</span>
	</div>
	<div class="board_header">
		<div class="table_topic">공지사항<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	</div>
	
	<div style="display:flex;">
		<div class="board_title" style="flex:1">
		<span id="titleSpan">${lectureNoticeVO.lecnTitle}</span>
		</div>
		<div class="board_info" style="flex:1">
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
		<span id="conSpan">${lectureNoticeVO.lecnCon}</span>
	</div>

	<hr class="board_separator">

	<div id="commentList" class="card-footer">

	</div>
	<br />
			<button type="button" id="btnCancle" class="btn-two mini dark"
		style="position:relative; left:50%; transform:translateX(-50%); 
 			margin-top:80px; width:100px; height:30px; font-size:14px;">목록</button>
	<sec:csrfInput />
	</form>
</div>


<script type="text/javascript">
logout = function() {
	$("#logoutForm").submit();
}
	
$(function(){
	$("#lecNm").text($(".lectureName").text());
	$("#btnCancle").on("click", function(){
		location.href = "/student/lecturenotice/list?lecCd=" + ${param.lecCd};
	});
    
	function sweetConfirmList() {
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
	            location.href = "/student/lecturenotice/list?lecCd=" + ${param.lecCd};
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('취소되었습니다.');
	        }
	    });
	}


	
	
});	

</script>



