<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
.counsel_box{width:100%; padding:40px; background-color:#ffffff;}
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
</style>

<div class="counsel_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;">강의</span>
	<span style="font-size:12px; color:#888888;">></span>
	 <span id="lecNm" style="font-size:12px; color:#888888;"></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;">주차별계획</span>
	</div>
	<div class="table_topic">주차별계획<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	<table>
		<tr class="table_title">
			<td>순번</td>
			<td>주차</td>
			<td>작성자</td>
		</tr>
		<c:forEach var="weekplanVO" items="${data.content}" varStatus="stat">
		<c:if test="${weekplanVO.lecCd eq param.lecCd}">
			<tr>
				<td>${stat.count}</td>
				<td><a href="/professor/weekplan/detail?wpNo=${weekplanVO.wpNo}&lecCd=${weekplanVO.lecCd}">${weekplanVO.lectureVO.lectureApplyVO.lecaNm}&nbsp;${weekplanVO.wpNo}주차주차</a></td>
				<td>${weekplanVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
			</tr>
		</c:if>
		</c:forEach>

	</table>
	<input type="hidden" name="lecCd" value="${param.lecCd}" />
</div>

<%-- <td class="text-center"><a href="/professor/weekplan/detail?wpNo=${weekplanVO.wpNo}&lecCd=${weekplanVO.lecCd}">${weekplanVO.wpNo}주차</a></td> --%>



		<a href="/professor/weekplan/create?lecCd=${param.lecCd}" 
		class="btn btn-primary" style=" display: inline-block; padding:
		10px 20px; background-color: #800020; color: #fff; text-decoration:
		none; font-weight: 300; border-radius: 5px; position: absolute; right:
		30px;">등록</a></br>




<script type="text/javascript">
const weekUpdate = '${weekUpdate}';
const weekCreate = '${weekCreate}';
$(function(){
	
	$("#lecNm").text($(".sub_title").text());
	
	if (weekUpdate == 1) {
		alertSuccess('주차별계획 수정이 완료되었습니다.');
	}
	if (weekCreate == 1) {
		alertSuccess('주차별계획 등록이 완료되었습니다.');
	}
	
});


</script>
