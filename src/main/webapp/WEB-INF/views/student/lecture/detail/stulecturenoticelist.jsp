<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
.counsel_box{width:100%; height:calc(100% - 40px); padding:40px; background-color:#ffffff; z-index:999; position:relative; margin-top:5px;}
.counsel_box .table_topic{font-size: 20px; padding-bottom:30px;}
.counsel_box .table_topic i{margin-left:10px;}
.counsel_box table{font-size:14px; width:100%; text-align:center;}
.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
.counsel_box tr{height:40px; border-bottom:1px solid #ebebeb;}
.counsel_box tr:first-child{background-color:#EEF1F6;}
.counsel_box tr:hover{background-color:#f2f3f4;}
.counsel_box tr:first-child:hover{background-color:#EEF1F6;}
.counsel_box tr td:nth-child(1){width:5%;}
.counsel_box tr td:nth-child(2){width:40%;}
.counsel_box tr td:nth-child(3){width:15%;}
.counsel_box tr td:nth-child(4){width:15%;}
.counsel_box tr td:nth-child(5){width:15%;}
.counsel_box tr td:nth-child(6){width:10%;}
.lecture_menu{height:30px; align-items:center;}
	.lecture_menu a{border:1px solid #eeeeee;background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; border:1px solid #ffffff;}
</style>
<div class="lecture_menu" style="display:flex;">
	<a href="/student/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a ">홈</a>
	<a href="/student/lecture/syllabus?lecCd=${param.lecCd}" class="sub_menu_a">강의계획서</a>
	<a href="/student/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a effect">공지사항</a>
	<a href="/student/task/list?lecCd=${param.lecCd}" class="sub_menu_a ">과제</a>
	<a href="/student/test/testList?lecCd=${param.lecCd}" class="sub_menu_a">시험</a>
	<a href="/student/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
	<a href="" class="sub_menu_a" style="color: transparent; pointer-events: none;">-</a>
</div>

<div class="counsel_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/lecture/list">내 강의실</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span id="lecNm" style="font-size:12px; color:#888888;"></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="">공지사항</a></span>
	</div>
	<div class="table_topic">공지사항<i class="fa-solid fa-circle-info" style="color: #333333;"></i><p>${lectureNoticeVO.lecCd}</p></div>
	<table>
		<tr class="table_title">
			<td>no</td>
			<td>제목</td>
			<td>작성자</td>
			<td>작성일</td>
			<td>수정일</td>
			<td>조회수</td>
		</tr>
		<c:forEach var="lectureNoticeVO" items="${data.content}" varStatus="stat">
		<c:if test="${lectureNoticeVO.lecCd eq param.lecCd}">
			<tr>
				<td>${stat.count}</td>
				<td style="text-align: left;" class="btnDetail" data-lecn-cd="${lectureNoticeVO.lecnCd}">
				<span style="cursor: pointer;">
				${lectureNoticeVO.lecnTitle}</td>
				</span>
				<td>${lectureNoticeVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
				<td><fmt:formatDate value="${lectureNoticeVO.lecnReg}" pattern="yyyy-MM-dd" /></td>
				<td><fmt:formatDate value="${lectureNoticeVO.lecnUdt}" pattern="yyyy-MM-dd" /></td>
				<td>${lectureNoticeVO.lecnCnt}</td>
			</tr>
		</c:if>
		</c:forEach>

	</table>
	<input type="hidden" id="lecCD" name="lecCd" value="${param.lecCd}" />
</div>			

<script type="text/javascript">
$(function(){
	$("#lecNm").text($(".lectureName").text());
	$(".btnDetail").on("click", function (event) {
		
		const lecnCd = $(this).data("lecnCd")
		const lecCd = $("#lecCD").val();
		$.ajax({
			
			url: "/student/count?lecnCd="+lecnCd,
			type: "get",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: (res) => {
				if (res != null) {
					location.href = "/student/lecturenotice/detail?lecnCd=" + lecnCd + "&lecCd=" + lecCd;
				}
			}
		});
			
	})

});
</script>