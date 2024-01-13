<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<style>
.counsel_box{width:100%; padding:40px; background-color:#ffffff;height: 100%;}
.counsel_box .table_topic{font-size: 20px; padding-bottom:30px;}
.counsel_box .table_topic i{margin-left:10px;}
.counsel_box table{font-size:14px; width:100%; text-align:center;}
.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
.counsel_box tr{height:40px; border-bottom:1px solid #ebebeb;}
.counsel_box tr:first-child{background-color:#EEF1F6;}
.counsel_box tr:hover{background-color:#f2f3f4;}
.counsel_box tr:first-child:hover{background-color:#EEF1F6;}
.counsel_box tr td:nth-child(1){width:5%;}
.counsel_box tr td:nth-child(2){width:50%;}
.counsel_box tr td:nth-child(3){width:20%;}
.counsel_box tr td:nth-child(4){width:10%;}
.counsel_box tr td:nth-child(5){width:10%;}
.lecture_menu{height:30px; align-items:center;}
	.lecture_menu a{border:1px solid #ebebeb; box-sizing:border-bos; background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; box-sizing: border-box; border:1px solid #ffffff;}
	.btn-reg:hover{color:#ffffff;}
</style>
<div style="display:flex;" class="lecture_menu">
	<a href="/professor/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a ">홈</a>
	<a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a effect">공지사항</a>
    <a href="/professor/task/list?lecCd=${param.lecCd}" class="sub_menu_a">과제</a>
    <a href="/professor/test/testList?lecCd=${param.lecCd}" class="sub_menu_a">시험</a>
    <a href="/professor/lectureAttendance?lecCd=${param.lecCd}" class="sub_menu_a">출결관리</a>
    <a href="/professor/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
    <a href="/professor/objection/list?lecCd=${param.lecCd}" class="sub_menu_a">성적이의신청</a>
</div>
<div class="counsel_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/list" style="font-size:12px; color:#888888;">강의실</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/detail?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;" id="lecNm"></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">공지사항</a></span>
	</div>
	<div class="table_topic" style="display: flex;">
		<div style="flex: 1;">공지사항<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	</div>
	<table>
	<div style="position:relative;"><a href="/professor/lecturenotice/create?lecCd=${param.lecCd}" class="btn-reg bur" style="position:absolute; top:-40px; right:0;">등록</a></div>
		<tr class="table_title">
			<td>no</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>수정일</td>
		</tr>
		<c:forEach var="lectureNoticeVO" items="${data.content}" varStatus="stat">
		<c:if test="${lectureNoticeVO.lecCd eq param.lecCd}">
			<tr>
				<td>${stat.count}</td>
				<td style="text-align: left;"><a href="/professor/lecturenotice/detail?lecnCd=${lectureNoticeVO.lecnCd}&lecCd=${lectureNoticeVO.lecCd}">${lectureNoticeVO.lecnTitle}</a></td>
				<td>${lectureNoticeVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
				<td><fmt:formatDate value="${lectureNoticeVO.lecnReg}" pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatDate value="${lectureNoticeVO.lecnUdt}" pattern="yyyy-MM-dd" /></td>
			</tr>
		</c:if>
		</c:forEach>

	</table>
	<input type="hidden" name="lecCd" value="${param.lecCd}" />
</div>


		




<script type="text/javascript">
const lecnUpdate = '${lecnUpdate}';
const lecnCreate = '${lecnCreate}';
$(function(){
// 	$("#lecNm").text($(".sub_title").text());
	$("#lecNm").text($(".lectureName").text());
	console.log('lecnUpdate',lecnUpdate);
	if (lecnUpdate == 1) {
		alertSuccess('공지사항 수정완료');
	}
	if (lecnCreate == 1) {
		alertSuccess('공지사항 등록완료');
	}

});
</script>