<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
.report_box {
	width: 100%;
	padding: 40px;
	background-color: #ffffff;
}

.report_box .table_topic {
	font-size: 20px;
	padding-bottom: 30px;
}

.report_box .table_topic i {
	margin-left: 10px;
}

.report_box table {
	font-size: 14px;
	width: 100%;
	text-align: center;
}

.table_title {
	font-size: 13px;
	border-top: 1px solid #d1d0d0;
	border-bottom: 1px solid #d1d0d0;
	height: 32px;
	line-height: 32px;
}
/* /////////////////여기가 수정시작!!  */
.report_box tr {
	height: 40px;
	border-bottom: 1px solid #ebebeb;
}

.report_box tr:first-child {
	background-color: #EEF1F6;
}

.report_box tr:hover {
	background-color: #f2f3f4;
}

.report_box tr:first-child:hover {
	background-color: #EEF1F6;
}
/* /////////////////여기가 수정끝!!  */
.report_box tr {
	height: 40px;
}

.report_box tr td:nths-child(1) {
	width: 5%;
}

.report_box tr td:nth-child(2) {
	width: 25%;
}

.report_box tr td:nth-child(3) {
	width: 25%;
}

.report_box tr td:nth-child(4) {
	width: 20%;
}

.report_box tr td:nth-child(5) {
	width: 25%;
}

#bdTitle {
	width: 400px;
}

#postReportModal .table {
    border-collapse: collapse;
    width: 100%;
}

#postReportModal .table tr {
    border: none; /* Removing horizontal lines */
}

#postReportModal .table th, #postReportModal .table td {
    padding: 8px;
    text-align: left;
}

#postReportModal .table th {
    background-color: #f2f2f2;
    font-weight: bold;
    width: 4%;
    font-size: 13px;
}

#postReportModal .table td {
    width: 30%; /* You can adjust the width */
}
.custom-close-btn {
            background-color: gainsboro;
            color: #ffffff;
            border: none;
            border-radius: 50%;
            width: 30px;
            height: 30px;
            font-size: 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
        }
</style>

<sec:authentication property="principal.userVO" var="userVO" />
<div class="report_box" style="background-color: white;">
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
		<span style="font-size: 12px; color: #888888;"><a href="/common/mypage/profile">마이페이지</a></span> 
		<span style="font-size: 12px; color: #888888;">></span> 
		<span style="font-size: 12px; color: #888888;"><a href="/common/mypage/myReportList">내 신고 내역</a></span> 
	</div>
	<div class="table_topic">
		내 신고 내역<i class="fa-solid fa-circle-info"
			style="color: #333333; position: absolute; top: 100px; left: 176px;"></i>
	</div>

<table>
    <tr class="table_title" style="border-top:1px solid #333333!important; border-bottom:1px solid #333333!important;">
        <td style="width: 7%;">no</td>
        <td style="width: 34%;">게시글</td>
        <td style="width: 15%">신고사유</td>
        <td style="width: 15%;">신고처리일</td>
        <td style="width: 25%;">처리현황</td>
    </tr>
    <c:choose>
        <c:when test="${!empty myReportList}">
            <c:forEach items="${myReportList}" var="postReportVO" varStatus="stat">
                <tr>
                    <td>${stat.count}</td>

                    <td style="text-align: left;">
                        <c:choose>
                            <c:when test="${postReportVO.appYn eq 1}">
                                <a href="#" style="cursor: pointer;" onclick="showDeletedPostAlert('${postReportVO.bdTitle}')">삭제된 게시글입니다.</a>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${postReportVO.comdCd eq 'BORD01'}">
                                        <a href="/common/board/free/detail?bdCd=${postReportVO.bdCd}" style="cursor: pointer;">${postReportVO.bdTitle}</a>
                                    </c:when>
                                    <c:when test="${postReportVO.comdCd eq 'BORD02'}">
                                        <a href="/common/board/publicize/detail?bdCd=${postReportVO.bdCd}" style="cursor: pointer;">${postReportVO.bdTitle}</a>
                                    </c:when>
                                    <c:when test="${postReportVO.comdCd eq 'BORD03'}">
                                        <a href="/common/board/anonymous/detail?bdCd=${postReportVO.bdCd}" style="cursor: pointer;">${postReportVO.bdTitle}</a>
                                    </c:when>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td>
                        <c:choose>
                            <c:when test="${postReportVO.prRsn eq 0}">불건전한 내용</c:when>
                            <c:when test="${postReportVO.prRsn eq 1}">주제에 맞지 않음</c:when>
                            <c:when test="${postReportVO.prRsn eq 2}">욕설 및 혐오표현</c:when>
                            <c:when test="${postReportVO.prRsn eq 3}">기타</c:when>
                        </c:choose>
                    </td>
                    <td>
                        <c:choose>
                            <c:when test="${not empty postReportVO.appProdt}">
                                <fmt:formatDate value="${postReportVO.appProdt}" pattern="yyyy-MM-dd" />
                            </c:when>
                            <c:otherwise>
                                신고 처리중
                            </c:otherwise>
                        </c:choose>
                    </td>

                    <td>
                        <c:choose>
                            <c:when test="${postReportVO.appYn eq 0}">
                                <p>대기</p>
                            </c:when>
                            <c:when test="${postReportVO.appYn eq 1}">
                                <p>삭제</p>
                            </c:when>
                            <c:when test="${postReportVO.appYn eq 2}">
                                <p>반려</p>
                            </c:when>
                            <c:otherwise>
                                <p>기타</p>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="7"><div style="color: #333333; font-size: 14px;">신고내역이 없습니다.</div></td>
            </tr>
        </c:otherwise>
    </c:choose>
</table>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    function showDeletedPostAlert(postTitle) {
        Swal.fire({
            title: '삭제된 게시글 제목',
            text: postTitle,
            icon: 'info',
            showCancelButton: false,
            confirmButtonText: '확인',
            confirmButtonColor: '#007bff' // Set the color code for the blue color you prefer
        });
    }
</script>


