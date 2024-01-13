<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="/resources/js/jspdf.min.js"></script>
<script src="/resources/js/bluebird.min.js"></script>
<script src="/resources/jshtml2canvas.min.js"></script>	
	
<style>
.record_box{width:950px; height:1305px; padding:40px; background-color:#ffffff;}
.table_topic{font-size: 20px; padding-bottom:30px;}

.record_form{border:1px solid #d1d0d0; padding:30px; width:100%; height:calc(100% - 100px); border-radius:5px; position:relative;}
.record_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
/* .record_form_title p{width:120px; font-size:16px; margin-bottom:15px;} */
/* .record_form_title select, .counsel_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;} */
.record_form a:hover{color:#ffffff!important;}
.record_form input:focus{outline:none;}
.record_form textarea{resize:none;}
.record_form table th, .record_form table td{border:1px solid #888888; padding:7px; font-size:15px;}
.record_form table th{text-align:center; background-color:#ebebeb;}
	.lecture_menu{height:30px; align-items:center;}
	.lecture_menu a{border:1px solid #eeeeee;background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; border:1px solid #ffffff;}
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div class="lecture_menu" style="display:flex;">
	<a href="/student/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a">홈</a>
	<a href="/student/lecture/syllabus?lecCd=${param.lecCd}" class="sub_menu_a effect">강의계획서</a>
	<a href="/student/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a">공지사항</a>
	<a href="/student/task/list?lecCd=${param.lecCd}" class="sub_menu_a ">과제</a>
	<a href="/student/test/testList?lecCd=${param.lecCd}" class="sub_menu_a">시험</a>
	<a href="/student/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
	<a href="" class="sub_menu_a" style="color: transparent; pointer-events: none;">-</a>
</div>

<div class="record_box">
	<div class="table_topic" style="margin-bottom:40px; padding-bottom:15px; border-bottom:1px solid #d1d0d0;">강의계획서</div>
	<form name="frm" class="record_form">
	<div class="record_form_title">
		<div style="margin-bottom:10px;"></div>
		<table style="margin-bottom:40px;">
			<tr>
				<th>강의명</th>
				<td colspan="2">${lectureVO.lectureApplyVO.lecaNm}</td>
				<th>대상학과</th>
				<td>${lectureVO.lectureApplyVO.departmentVO.depNm}</td>
			</tr>
			<tr>
				<th rowspan="3">담당교수</th>
				<th rowspan="1">성명</th>
				<td>${lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
				<th>개설학년</th>
				<td>${lectureVO.lectureApplyVO.lecaTrg}&nbsp;학년</td>

			</tr>
			<tr>
				<th rowspan="1">연락처</th>
				<td>${lectureVO.lectureApplyVO.professorVO.userVO.userTel}</td>
				<th>학기</th>
				<td>${lectureVO.lectureApplyVO.lecaYear}년&nbsp;${lectureVO.lectureApplyVO.lecaSem}학기</td>
			</tr>
			<tr>
				<th rowspan="1">이메일</th>
				<td>${lectureVO.lectureApplyVO.professorVO.userVO.userMail}</td>
				<th>학점</th>
				<td>${lectureVO.lectureApplyVO.lecaCrd}</td>
			</tr>
			<tr>
				<th>교재 및 참고서</th>
				<td colspan="2">${lectureVO.lectureApplyVO.lecaBook}</td>
				<th>평가방법</th>
				<td>
					<c:if test="${lectureVO.lectureApplyVO.lecaEva == 0}">▶절대평가</c:if>
					<c:if test="${lectureVO.lectureApplyVO.lecaEva == 1}">▶상대평가</c:if><br /><br />
					▶중간고사&nbsp;:&nbsp;${lectureVO.lectureApplyVO.crtrMp}<br /><br />
					▶기말고사&nbsp;:&nbsp;${lectureVO.lectureApplyVO.crtrFp}<br /><br />
					▶과&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제&nbsp;:&nbsp;${lectureVO.lectureApplyVO.crtrTp}<br /><br />
					▶출&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결&nbsp;:&nbsp;${lectureVO.lectureApplyVO.crtrAp}
				</td>
			
			</tr>
		</table>
	
	  <div style="display:flex; flex-direction:column; margin-bottom:25px; margin-top:-30px;">
	  	<p style="margin-bottom:10px;">교과목표 및 개요</p>
	  	<textarea id="lecaCon" name="lecaCon" style="height:230px; padding:10px; line-height:20px; font-size:14px;" readonly="readonly"><c:out value="${lectureVO.lectureApplyVO.lecaCon}"/></textarea>
	  </div>
	  		<table style="margin-bottom:40px;">
			<tr>
				<th rowspan="16" style="width: 90px;">주차별계획</th>
				<th style="width: 80px;">1주차</th>
				<td>${weekplanVOList[0].wpCon}</td>
			</tr>
			<tr>
				<th>2주차</th>
				<td>${weekplanVOList[1].wpCon}</td>
			</tr>
			<tr>
				<th>3주차</th>
				<td>${weekplanVOList[2].wpCon}</td>
			</tr>
			<tr>
				<th>4주차</th>
				<td>${weekplanVOList[3].wpCon}</td>
			</tr>
			<tr>
				<th>5주차</th>
				<td>${weekplanVOList[4].wpCon}</td>
			</tr>
			<tr>
				<th>6주차</th>
				<td>${weekplanVOList[5].wpCon}</td>
			</tr>
			<tr>
				<th>7주차</th>
				<td>${weekplanVOList[6].wpCon}</td>
			</tr>
			<tr>
				<th>8주차</th>
				<td>${weekplanVOList[7].wpCon}</td>
			</tr>
			<tr>
				<th>9주차</th>
				<td>${weekplanVOList[8].wpCon}</td>
			</tr>
			<tr>
				<th>10주차</th>
				<td>${weekplanVOList[9].wpCon}</td>
			</tr>
			<tr>
				<th>11주차</th>
				<td>${weekplanVOList[10].wpCon}</td>
			</tr>
			<tr>
				<th>12주차</th>
				<td>${weekplanVOList[11].wpCon}</td>
			</tr>
			<tr>
				<th>13주차</th>
				<td>${weekplanVOList[12].wpCon}</td>
			</tr>
			<tr>
				<th>14주차</th>
				<td>${weekplanVOList[13].wpCon}</td>
			</tr>
			<tr>
				<th>15주차</th>
				<td>${weekplanVOList[14].wpCon}</td>
			</tr>
			<tr>
				<th>16주차</th>
				<td>${weekplanVOList[15].wpCon}</td>
			</tr>
		</table>
	</div>
	</form>
</div>
<div style="display:flex; justify-content:end; margin-top:40px; position:absolute; top:40px; right:500px;">
		<button class="cancel btn-reg bur" id="pdfDownload" type="button" style="margin-left:10px;">다운로드</button>
</div>	
	




<script type="text/javascript">

logout = function() {
	$("#logoutForm").submit();
}
	
$(function(){
	
	$("#pdfDownload").on("click", function(){
		pdfPrint();
	});
	
	
	function pdfPrint() {
	    var element = document.querySelector('.record_box'),
	    width = element.style.width,
	    height = element.style.height;


	    var parentElement = element.parentElement;

	    parentElement.removeChild(element);
	    document.body.appendChild(element);

	    var options = {
	        scrollX: window.scrollX,
	        scrollY: window.scrollY,
	        scale: window.devicePixelRatio
	    };

	    html2canvas(element, options).then(function (canvas) {
	        document.body.removeChild(element);
	        parentElement.appendChild(element);

	        var imgData = canvas.toDataURL('image/png');

	        var imgWidth = 210;
	        var pageHeight = imgWidth * 1.414;
	        var imgHeight = canvas.height * imgWidth / canvas.width;
	        var heightLeft = imgHeight;

	        var doc = new jsPDF('p', 'mm');
	        var position = 5;
	        doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	        heightLeft -= pageHeight;

	        while (heightLeft >= 20) {
	            position = heightLeft - imgHeight;
	            doc.addPage();
	            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
	            heightLeft -= pageHeight;
	        }

	        // 파일 저장
	        doc.save('${lectureVO.lectureApplyVO.lecaNm} 강의계획서.pdf');
	    });
	}
	
});	
</script>



