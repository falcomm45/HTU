<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!-- <style> -->
<!-- /*  .content{background-color:#ffffff;} */ -->
<!-- /*  .table_topic{font-size: 20px; padding-bottom:30px;} */ -->
<!-- /*  .prifile_wrap tr{display: table-row;} */ -->
<!-- /*  .profile_wrap th{width:170px; padding:20px; font-size:14px;} */ -->
<!-- /*  .profile_wrap td{padding:10px;} */ -->
<!-- /*  .profile_photo{width:100px!important; height:100px!important; border:1px solid #888888;} */ -->
<!-- </style> -->

<style>
	.crewDetail {width: 100%; height: 100%; background-color:#ffffff;}
	.crewIndex {width: 100%; height: 100%;}
	.crewIndex a{color:#333333!important; text-decoration:none!important;}
	.crewIndex a:hover{color:#333333!important; text-decoration:none!important;}
	.crewHeader {font-size: 20px; padding-bottom: 30px; position: relative;}
	#appBtn, #btnQuit, #btnApply {position: absolute; right: 10px; bottom: 10px;}
	#appBtn:hover{background-color: #003866;}
	#btnQuit:hover{background-color: #818181;}
	#btnApply:hover{background-color: #237e55;}
	.crewDivbox {width: 100%; display: inline-flex;height: 40%; margin-bottom: 10px;}
	.crewDiv1 {width: 40%; margin-right: 10px;}
	.crewDiv2 {width: 60%;}
	.crewInfo {border-radius : 5px; position: relative; height: 100%; padding: 40px; 
		margin-bottom: 10px; background-color: #ffffff;}
	.crewInfoTbl {width: 100%; height: 80%; font-size: 14px;}
	.crewInfoHeader {font-size: 18px; padding-bottom: 20px;}
	.crewInfoTbl-title {padding-right: 5px; font-weight: bold;}
	.crewInfoTbl a{border: 1px solid #eaeaea; border-radius: 5px; font-size: 14px; padding: 5px;}
	.crewInfoTbl tr:last-child{padding: 300px;}
	.crewModBtn {position: absolute; width: 20px; height: 20px; right: 13px; bottom: 13px;}
	.crewManage {border-radius : 5px; padding: 15px 13px; background-color: #ffffff; 
		overflow: auto;}
/* ---------------------------------------------------------------------------- */
	.crew_box{width:60%; padding:40px; background-color:#ffffff; border-radius: 5px;}
	.crew_box .table_topic{font-size: 18px; padding-bottom:20px;}
	.crew_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #d1d0d0; border-bottom:1px solid #d1d0d0; height:32px; line-height:32px;}
	.crew_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.crew_box tr:first-child{background-color:#EEF1F6;}
	.crew_box tr:hover{background-color:#f2f3f4;}
	.crew_box tr:first-child:hover{background-color:#EEF1F6;}
	.crew_box tr td:nth-child(1){width:10%;}
	.crew_box tr td:nth-child(2){width:30%;}
	.crew_box tr td:nth-child(3){width:40%;}
	.crew_box tr td:nth-child(4){width:20%;}
	
	.crew_form{border:1px solid #d1d0d0; padding:30px; width:80%; border-radius:5px; position:relative;}
	.crew_form_title{display:flex; flex-direction:column; margin-bottom:20px;}
	.crew_form_title p{width:120px; font-size:16px; margin-bottom:10px;}
	.crew_form_title select, .crew_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
	.crew_margin_left{margin-left:5px;}
	.crew_form a:hover{color:#ffffff!important;}
/* ---------------------------------------------------------------------------- */
	.crewPerson {border-radius : 5px; height: 100%; padding: 15px 25px; margin-bottom: 10px;
		background-color: #ffffff;}
	.crTb{height: 80%; overflow: auto;}
	.crewPersonTbl {width: 100%; text-align: center; border-spacing: 30px; line-height: 3rem;}
	.crewPerson-tr {border-bottom: 1px solid #eaeaea; padding: 30px 0;}
	.crewPersonTbl tr:last-child {border:none;}
	.crewPersonTbl th {position: sticky; top: 0px; background-color : #eaeaea;}
	.crewfiles {display: inline-flex; width: 400px; justify-content: center;}
	.crewfiles img {display: block; padding: 0 5px; width: 1000px; height: 700px;}
	#crewActBtn {font-size: 24px; padding-top: 30px; float: right;}
	.crewActivityHeader {font-size: 18px;  padding-top: 15px; padding-left: 10px;}
	.crewAct {width: 100%;  border-bottom: 1px solid #ebebeb; padding: 20px; overflow: auto;}
	.actStuNm {font-size: 18px; font-weight: bold;}
	.crewAct p {padding: 10px 0;}
	#craAddBtn {float: right; padding-right: 30px;}
	ul.tabs{margin: 0px; padding: 0px; list-style: none;}
	ul.tabs li{border-radius: 5px 5px 0 0; background: #eaeaea; color: #222;
		display: inline-block; padding: 10px 15px; cursor: pointer;}
	ul.tabs li.current{border-radius: 5px 5px 0 0; background: #ffffff; color: #222;}
	.tab-content{display: none; background: #ffffff; padding: 15px; border-radius: 5px;}
	.tab-content.current{display: inherit;}
	ul.tabs li:hover {background-color: #ced1d7;}
	.lecture_menu{height:30px; align-items:center;}
	.lecture_menu a{border:1px solid #eeeeee;background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; border:1px solid #ffffff;}
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div style="display:flex;" class="lecture_menu">
	<a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a effect">홈</a>
	<a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a">공지사항</a>
    <a href="/professor/task/list?lecCd=${param.lecCd}" class="sub_menu_a">과제</a>
    <a href="/professor/test/testList?lecCd=${param.lecCd}" class="sub_menu_a">시험</a>
    <a href="/professor/lectureAttendance?lecCd=${param.lecCd}" class="sub_menu_a">출결관리</a>
    <a href="/professor/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
    <a href="/professor/objection/list?lecCd=${param.lecCd}" class="sub_menu_a">성적이의신청</a>
</div>
<div class="crewDetail">
<input type="hidden" id="lecCd" name="lecCd" value="${lectureVO.lecCd}" />
	<div class="crewIndex">
		<div class="crewDivbox" style="margin-top:20px; padding:20px; box-sizing:border-box;">
			<div class="crewDiv1" style="border:1px solid #ebebeb; ">
				<div class="crewInfo">
					<div class="crewInfoHeader" style="display: flex; justify-content: space-between;">
						<p style="font-size:25px; font-weight:600;">${lectureVO.lectureApplyVO.lecaNm}</p>
						<input type="hidden" id="lecNM" value="${lectureVO.lectureApplyVO.lecaNm}"/>
					</div>
					<table class="crewInfoTbl">
						<tr>
							<td class="crewInfoTbl-title">교수명</td>
							<td>${lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">강의구분</td>
							<c:if test="${lectureVO.lectureApplyVO.lecaType == 0}"><td>전공필수</td></c:if>
							<c:if test="${lectureVO.lectureApplyVO.lecaType == 1}"><td>전공선택</td></c:if>
							<c:if test="${lectureVO.lectureApplyVO.lecaType == 2}"><td>교양필수</td></c:if>
							<c:if test="${lectureVO.lectureApplyVO.lecaType == 3}"><td>교양선택</td></c:if>
							<td></td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">전공</td>
							<td>${lectureVO.lectureApplyVO.departmentVO.depNm}</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">학점</td>
							<td>${lectureVO.lectureApplyVO.lecaCrd}</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">년도&nbsp;/&nbsp;학기</td>
							<td>${lectureVO.lectureApplyVO.lecaYear}년&nbsp;${lectureVO.lectureApplyVO.lecaSem}학기</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">학년</td>
							<td>${lectureVO.lectureApplyVO.lecaTrg}</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">수강인원</td>
							<td>${lectureVO.lecHcnt}</td>
						</tr>
					</table>
<%-- 					<c:if test="${crewVO.crLeader eq userVO.userCd}"> --%>
<!-- 						<div> -->
<%-- 							<a href="/student/crew/crewUpdate?crCd=${crewVO.crCd}"> --%>
<!-- 								<img class="crewModBtn" src="/resources/images/gear.png" alt="crewManage" /> -->
<!-- 							</a> -->
<!-- 						</div> -->
<%-- 					</c:if> --%>
				</div>
			</div>
			<div class="crew_box" style="border:1px solid #ebebeb; border-radius:0px;">
				<div class="table_topic">수강중인학생</div>
				<div class="crTb">
					<table>
						<tr class="table_title">
							<th>no</th>
							<th>학번</th>
							<th>이름</th>
							<th>학과</th>
						</tr>
						<!-- 수강중인학생 구해서 넣어주기  -->
						<c:forEach var="enrolmentVO" items="${enrolmentVOList}" varStatus="stat">
							<tr>
								<td>${stat.count}</td>
								<td>${enrolmentVO.studentVO.stuCd}</td>
								<td>${enrolmentVO.studentVO.userVO.userNm}</td>
								<td>${enrolmentVO.studentVO.departmentVO.depNm}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div class="crewContent">
			<div class="crewContentTab">
				<ul class="tabs">
				</ul>
				<div id="tab-1" class="tab-content current" >
					<div class="crewActivity">
						<div class="crewActivityHeader">
							주차별 계획
							<a href="/professor/weekplan/create?lecCd=${lectureVO.lecCd}" id="craAddBtn"><img src="/resources/images/plus.png" style="width: 20px; height: 20px; left: 10px;"/></a>
						</div>
						<c:forEach var="weekplanVO" items="${weekplanVOList}"> 
							<div class="crewAct">
								<c:choose>
									<c:when test="${not empty weekplanVO}">
										<p style="font-weight: bold;"><a type="button" class="weekUpdate"><span>${weekplanVO.wpNo}</span>주차</a>
											<svg class="weekDelete" xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><path d="M170.5 51.6L151.5 80h145l-19-28.4c-1.5-2.2-4-3.6-6.7-3.6H177.1c-2.7 0-5.2 1.3-6.7 3.6zm147-26.6L354.2 80H368h48 8c13.3 0 24 10.7 24 24s-10.7 24-24 24h-8V432c0 44.2-35.8 80-80 80H112c-44.2 0-80-35.8-80-80V128H24c-13.3 0-24-10.7-24-24S10.7 80 24 80h8H80 93.8l36.7-55.1C140.9 9.4 158.4 0 177.1 0h93.7c18.7 0 36.2 9.4 46.6 24.9zM80 128V432c0 17.7 14.3 32 32 32H336c17.7 0 32-14.3 32-32V128H80zm80 64V400c0 8.8-7.2 16-16 16s-16-7.2-16-16V192c0-8.8 7.2-16 16-16s16 7.2 16 16zm80 0V400c0 8.8-7.2 16-16 16s-16-7.2-16-16V192c0-8.8 7.2-16 16-16s16 7.2 16 16zm80 0V400c0 8.8-7.2 16-16 16s-16-7.2-16-16V192c0-8.8 7.2-16 16-16s16 7.2 16 16z"/></svg>
											<svg class="weekUpdateIcon" xmlns="http://www.w3.org/2000/svg" height="16" width="16" viewBox="0 0 512 512"><path d="M441 58.9L453.1 71c9.4 9.4 9.4 24.6 0 33.9L424 134.1 377.9 88 407 58.9c9.4-9.4 24.6-9.4 33.9 0zM209.8 256.2L344 121.9 390.1 168 255.8 302.2c-2.9 2.9-6.5 5-10.4 6.1l-58.5 16.7 16.7-58.5c1.1-3.9 3.2-7.5 6.1-10.4zM373.1 25L175.8 222.2c-8.7 8.7-15 19.4-18.3 31.1l-28.6 100c-2.4 8.4-.1 17.4 6.1 23.6s15.2 8.5 23.6 6.1l100-28.6c11.8-3.4 22.5-9.7 31.1-18.3L487 138.9c28.1-28.1 28.1-73.7 0-101.8L474.9 25C446.8-3.1 401.2-3.1 373.1 25zM88 64C39.4 64 0 103.4 0 152V424c0 48.6 39.4 88 88 88H360c48.6 0 88-39.4 88-88V312c0-13.3-10.7-24-24-24s-24 10.7-24 24V424c0 22.1-17.9 40-40 40H88c-22.1 0-40-17.9-40-40V152c0-22.1 17.9-40 40-40H200c13.3 0 24-10.7 24-24s-10.7-24-24-24H88z"/></svg>
										</p>	
									</c:when>
									<c:otherwise>
										<p style="font-weight: bold;">등록된 주차별 계획이 없습니다</p>
									</c:otherwise>
								</c:choose>
								<p class="conP">${weekplanVO.wpCon}</p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="cramodal modal-bg"  style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
	<div id="craModal" style="overflow: auto; position:absolute; z-index: 999; width: 600px; height: 350px; border-radius:10px; padding:30px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
		<button type="button" class="btn-two gray mini close_bt" onclick="closeModal()" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>
			<input name="crCd" value="${crewVO.crCd}" hidden />
			<div class="craModal-content">
				<div class="crew_form_title">
					<p>주차</p>
					<div>
						<input type="text"  name="wpNo" id="wpNo" style="height: 30px;" readonly="readonly"/>
					</div>
				</div>
				<div class="crew_form_title">
					<p>내용</p>
					<textarea id="wpCon" name="wpCon" maxlength=1000 required="required" style="resize: none; height: 130px;"></textarea>
				</div>
				<div style="justify-content: right; display: flex;">
					<button type="button" class="craBtn btn-reg bur" id="craBtn">수정하기</button>
				</div>
			</div>
	</div>
</div>



<script type="text/javascript">

const jsonLectureVO = JSON.parse('${jsonLectureVO}');
console.log(jsonLectureVO);

$(document).on("click", "#btnEndLecture", function() {
	
	let flag = true;
	let maxAtt = 0;
	$.ajax({
		url: "/professor/checkAttendance?lecCd=" + jsonLectureVO.lecCd,
		type: "get",
		async: false,
		success: function(res) {
			const enrolLength = Number('${fn:length(enrolmentVOList)}');
			maxAtt = enrolLength * jsonLectureVO.calendarList.length;
			if (maxAtt > res) {
				alertError("기입되지 않은 출석이 있습니다.");
				flag = false;
				return;
			};
		}
	})
	
	if (flag) {
		$.ajax({
			url: "/professor/endLecture?lecCd=" + jsonLectureVO.lecCd + "&maxAtt=" + maxAtt,
			type: "get",
			success: res => {
				alertSuccess("해당 강의가 종강되었습니다.", "/professor/lecture/detail?lecCd="+jsonLectureVO.lecCd)
			}
		})
	}
});

$(function(){
	
	const lecaYear = jsonLectureVO.lectureApplyVO.lecaYear;
	const lecaSem = jsonLectureVO.lectureApplyVO.lecaSem;
	
	const today = new Date();
	let lastDay = "";
	if (lecaSem == 1) {
		lastDay = new Date(`\${lecaYear}-06-17`);
	} else {
		lastDay = new Date(`\${lecaYear}-12-15`);
	}
	
	if(today > lastDay) {
		let btn = "";
		if (jsonLectureVO.lecStat == 0) {
			btn = $(`<button class="btn-reg bur btn-two" id="btnEndLecture" style="font-size: 16px;">종강</button>`)
		} else if (jsonLectureVO.lecStat == 1){
			btn = $(`<button class="btn-reg bur btn-two" style="font-size: 14px; width=120px!important;" disabled>종강</button>`)
		}
		$(".crewInfoHeader").append(btn);
	}
	
	$('.weekUpdate').on('click', function(){
		$(".crewModBtn").css("display", "none");
		$(".crewPersonTbl th").css("position", "static");
		$(".crewInfo").css("position", "static");
		
        var weekNo = $(this).text().replace(/[^0-9]/g, ''); 
        var weekContent = $(this).next('p').text();

        // Set the values in the modal
        $("#wpNo").val(weekNo);
        $("#wpCon").val(weekContent);
		
        $(".cramodal").fadeIn();

        $(".close_bt").on("click", function(){
        	$(".cramodal").fadeOut();
        	$(".crewPersonTbl th").css("position", "sticky");
    		$(".crewInfo").css("position", "relative");
    		$(".crewModBtn").css("display", "");
        });
	});
	
		$('.weekUpdateIcon').on('click', function(){
			var weekNo = $(this).closest(".crewAct").find("span").text().replace(/[^0-9]/g, '');
			
			
			$(".crewModBtn").css("display", "none");
			$(".crewPersonTbl th").css("position", "static");
			$(".crewInfo").css("position", "static");
			
	
	        // Set the values in the modal
	        $("#wpNo").val(weekNo);
// 	        $("#wpCon").val(weekContent);
			
	        $(".cramodal").fadeIn();
	
	        $(".close_bt").on("click", function(){
	        	$(".cramodal").fadeOut();
	        	$(".crewPersonTbl th").css("position", "sticky");
	    		$(".crewInfo").css("position", "relative");
	    		$(".crewModBtn").css("display", "");
	        });
		});
	
	$("#craBtn").on("click", function(){
        Swal.fire({
            title: '수정하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네',
            cancelButtonText: "아니오"
        }).then((result) => {
            if (result.isConfirmed) {
            	
            	var lecCD = $("#lecCd").val();
            	var lecNM = $("#lecNM").val();
            	data = {
                		"wpCon":$("#wpCon").val(),
                		"wpNo":$("#wpNo").val(),
                		"lecCd":$("#lecCd").val()
                	};
            		$.ajax({
            			url : "/professor/weekplan/update?${_csrf.parameterName}=${_csrf.token}",
            			contentType : "application/json;charset=utf-8",
            			data : JSON.stringify(data),
            			type : "post",
            			dataType : "json",
            			beforeSend : function(xhr) {
            				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            			},
            			success : function(result) {
            				console.log("result", result);
            				alertSuccess("수정이 완료되었습니다.", "/professor/lecture/detail?lecCd=" + lecCD + "&lecNm=" + lecNM);
//             				professor/lecture/detail?lecCd=271&lecNm=성적처리기준+테스트
            			}
            			
            		}); 
            }else{
            	alertError('수정을 취소하였습니다');
            }
        });
		
		
	});

	$(".weekDelete").on("click", function(){
		
		var weekNo = $(this).closest(".crewAct").find("span").text().replace(/[^0-9]/g, '');
		
        Swal.fire({
            title: '삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '네',
            cancelButtonText: "아니오"
        }).then((result) => {
            if (result.isConfirmed) {
            	
            	var lecCD = $("#lecCd").val();
            	var lecNM = $("#lecNM").val();
            	data = {
            			"wpNo":weekNo,
                		"lecCd":$("#lecCd").val()
                	};
                	console.log("data", data);
            		$.ajax({
            			url : "/professor/weekplan/delete?${_csrf.parameterName}=${_csrf.token}",
            			contentType : "application/json;charset=utf-8",
            			data : JSON.stringify(data),
            			type : "post",
            			dataType : "json",
            			beforeSend : function(xhr) {
            				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            			},
            			success : function(result) {
            				// 성공적으로 제출되었을 때의 로직을 처리합니다. 예: 리다이렉트 또는 메시지 표시
            				console.log("result", result);
            				//if문..(기본키 데이터가 있다면(selectKey에 의해 생성된))
            				alertSuccess("삭제가 완료되었습니다.", "/professor/lecture/detail?lecCd=" + lecCD + "&lecNm=" + lecNM);
            			}
            			
            		});  
            }else{
            	alertError('삭제를 취소하였습니다');
            }
        });
		
	});
});
	

</script>



