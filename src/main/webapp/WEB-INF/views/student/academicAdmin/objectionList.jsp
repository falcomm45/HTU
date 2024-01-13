<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="cfn" uri="/WEB-INF/tld/myTld.tld" %>

<style>
	/* 여기 스타일 전부 가져다가 복붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "counsel_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
	.objection_box{width:100%; height:100%; padding:40px; background-color:#ffffff;}
	/* 상단에 있는 제목 (여기서는 상담내역) css입니다
		그대로 복붙하시고 해당div에  .table_topic값 주세요*/
	.objection_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.objection_box .table_topic i{margin-left:10px;}
	/* table입니다 */
	.objection_box table{font-size:14px; width:100%; text-align:center;}
	/* 테이블의 시작부분 타이틀입니다 */
	.table_title{font-size:13px; border-top:1px solid #d1d0d0; border-bottom:1px solid #d1d0d0; height:32px; line-height:32px;}
	.objection_box tr{height:40px;}
	/* 각자 만든 td개수만큼만쓰고 총 합이 100이 되도록 잘 분배해서 쓰세요 이부분 제일 신경써서 해주세요*/
	.objection_box tr td:nth-child(1){width:8%;}
	.objection_box tr td:nth-child(2){width:8%;}
	.objection_box tr td:nth-child(3){width:12%;}
	.objection_box tr td:nth-child(4){width:10%;}
	.objection_box tr td:nth-child(5){width:5%;}
	.objection_box tr td:nth-child(6){width:10%;}
	.objection_box tr td:nth-child(7){width:7%;}
	.objection_box tr td:nth-child(8){width:10%;}
	.objection_box tr td:nth-child(9){width:10%;}
	.objection_box tr td:nth-child(10){width:10%;}
	.objection_box tr td:nth-child(11){width:10%;}
  /* 테이블의 시작부분 타이틀입니다 */
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	/* /////////////////여기가 수정시작!!  */
	.objection_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.objection_box .table_title2{background-color:#EEF1F6;}
	.objection_box tr:hover{background-color:#f2f3f4;}
	.objection_box .table_title2:hover{background-color:#EEF1F6;}
	/* /////////////////여기가 수정끝!!  */
	.objection_box{width:100%; padding:40px; background-color:#ffffff;}
	.objection_form{border:1px solid #d1d0d0; padding:30px; width:100%; border-radius:5px; position:relative;}
	.objection_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
	.objection_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
	.objection_form_title select, .objection_form_title input{font-size:14px; border: 1px solid #d1d0d0; border-radius:3px; padding:5px 15px;}
	.objection_form a:hover{color:#ffffff!important;}
	.objection_form_title input{border: none;}
	.objection_form input:focus{outline:none;}
	.objection_form textarea{resize:none;}
	.objection_form1 table th, .objection_form1 table td{border:1px solid #888888; padding:7px; font-size:14px;}
	.objection_form1 table td{text-wrap:nowrap;}
	.objection_form1 table th{text-align:center; background-color:#ebebeb; padding:3px;}
  .close_bt:hover {background-color: #333;}
</style>
<sec:authentication property="principal.userVO" var="userVO"/>
<div class="objection_box">
  <div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/grade/gradeList">성적관리</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/grade/objectionList">성적이의신청</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/grade/objectionList">이의신청목록</a></span>
	</div>
  <div class="table_topic">이의신청목록<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
  <table>
		<tr class="table_title table_title2">
			<td>수강년도</td>
			<td>수강학기</td>
			<td>강의명</td>
			<td>이수구분</td>
			<td>학점</td>
			<td>담당교수</td>
			<td>이전등급</td>
      <td>결재일</td>
      <td>신청결과</td>
			<td>변경등급</td>
			<td>비고</td>
		</tr>
		<tbody id="gradeTbody">
			<c:forEach items="${gradeList}" var="gradeVO">
				<c:if test="${gradeVO.objectionVO.appCd != null}">
					<tr>
						<td>${gradeVO.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaYear}</td>
						<td>${gradeVO.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaSem}</td>
						<td>${gradeVO.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaNm}</td>
						<td>
							<c:choose>
								<c:when test="${gradeVO.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaType eq 0}">전공필수</c:when>
								<c:when test="${gradeVO.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaType eq 1}">전공선택</c:when>
								<c:when test="${gradeVO.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaType eq 2}">교양필수</c:when>
								<c:when test="${gradeVO.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaType eq 3}">교양선택</c:when>
							</c:choose>
						</td>
						<td>${gradeVO.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaCrd}</td>
						<td>${gradeVO.gradeCriteriaVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
						<td>
						  <c:choose>
						    <c:when test="${gradeVO.lecgSum >= 95}">A+</c:when>
						    <c:when test="${gradeVO.lecgSum >= 90}">A</c:when>
						    <c:when test="${gradeVO.lecgSum >= 85}">B+</c:when>
						    <c:when test="${gradeVO.lecgSum >= 80}">B</c:when>
						    <c:when test="${gradeVO.lecgSum >= 75}">C+</c:when>
						    <c:when test="${gradeVO.lecgSum >= 70}">C</c:when>
						    <c:when test="${gradeVO.lecgSum >= 65}">D+</c:when>
						    <c:when test="${gradeVO.lecgSum >= 60}">D</c:when>
						    <c:otherwise>F</c:otherwise>
						  </c:choose>
						</td>
						<td>
						  <c:choose>
						    <c:when test="${gradeVO.objectionVO.approvalVO.appYn eq 0}">-</c:when>
						    <c:otherwise><fmt:formatDate value="${gradeVO.objectionVO.approvalVO.appProdt}" pattern="yy.MM.dd"/></c:otherwise>
						  </c:choose>
						</td>
						<td>
						  <c:choose>
						    <c:when test="${gradeVO.objectionVO.approvalVO.appYn eq 0}">대기</c:when>
						    <c:when test="${gradeVO.objectionVO.approvalVO.appYn eq 1}">승인</c:when>
						    <c:when test="${gradeVO.objectionVO.approvalVO.appYn eq 2}">반려</c:when>
						  </c:choose>
						</td>
						<td>
						  <c:choose>
						    <c:when test="${gradeVO.objectionVO.approvalVO.appYn eq 1}">${gradeVO.lecgGrade}</c:when>
						    <c:otherwise>-</c:otherwise>
						  </c:choose>
						</td>
						<td>
						  <c:choose>
						    <c:when test="${gradeVO.objectionVO.approvalVO.appYn eq 2}"><button class="btn-two bur mini btnCompanion" data-app-cd="${gradeVO.objectionVO.appCd}">반려사유</button></c:when>
						    <c:otherwise>-</c:otherwise>
						  </c:choose>
						
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>


<script>
	const str = '${jsonGradeList}'.replaceAll("\n", "ddd");
	console.log(str);
  const jsonGradeList = JSON.parse(str);
	console.log(jsonGradeList);
	const jsonUserVO = JSON.parse('${jsonUserVO}');
	console.log(jsonUserVO);
  
  $(".btnCompanion").on("click", function() {
		const appCd = $(this).data("appCd");
		const grade = jsonGradeList.find(grade => {if (grade.objectionVO.appCd == appCd) return true});
		alertInfo(grade.objectionVO.objRpl);
	});
	
	
	function alertInfo(message) {
		if (message.length > 30) {
			message = message.slice(0,30) + "<br>" + message.slice(30);
		}
		Swal.fire({
			title: "반려사유",
			html: message,
			icon: "info",
			width: 600,
			position: "center",
			confirmButtonColor: "#3085d6",
			confirmButtonText: "확인",
		}).then((result) => {
			
		});
	}
  
  $(function() {
    
  });
</script>