<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
/* 공통 스타일 */
.text-center {
	text-align: center;
}

/* 카드 스타일 */
.card-body {
	height: 10%;
}

.card .topic {
	position: relative;
}

.free_topic {
	font-size: 30px;
	padding-bottom: 50px;
}

.FreeBoard_box .free_topic i {
	margin-left: 10px;
	color: #333333; /* 추가된 부분 */
}

.FreeBoard_box table {
	font-size: 14px;
	width: 168%;
}

.FreeBoard_box table tbody tr {
/*     cursor: pointer; */
}

.FreeBoard_box table tbody tr td:nth-child(2) {
    text-align: center; /* 두 번째 열(제목)만 왼쪽 정렬 */
}

.FreeBoard_box table tbody tr td:not(:nth-child(2)) {
    text-align: center; /* 나머지는 가운데 정렬 */
}

/* Optional: If you want to center text in the first column vertically */
.FreeBoard_box table tbody tr td:nth-child(2) {
    vertical-align: middle;
}

.FreeBoard_box table tbody tr {
	height: 20px; /* 적절한 높이로 조절해주세요 */
	line-height: 20px; /* 적절한 높이로 조절해주세요 */
}

.table_title {
	font-size: 13px;
	border: 1px solid #d1d0d0;
	height: 32px;
	line-height: 32px;
	background-color: #f8f9fa;
	font-weight: bold; /* 글씨 굵게 */
}


.FreeBoard_box table tbody tr td:first-child {
    font-weight: bold;
}

/* 글쓰기 링크 스타일 */
.write-link {
	position: absolute;
	top: 50%;
	left: 80%;
}

.FreeBoard_box th {
	width: calc((100% - 190px) / 16)!important;
	background-color:#EEF1F6;
}
.FreeBoard_box td{
	background-color:#EEF1F6;
}

#trHeight {
	height: 70px;
}

.custom-select { 
	 appearance: none;
    -webkit-appearance: none;
    border-radius: 2px;
    border: none;
    color: #333;
}
.cateDiv{
	margin-left: 16px;
}
.lecture_menu{height:30px; align-items:center;}
	.lecture_menu a{border:1px solid #ebebeb; box-sizing:border-bos; background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; box-sizing: border-box; border:1px solid #ffffff;}
.FreeBoard_box .table_topic{font-size: 20px; padding-bottom:20px;}
.FreeBoard_box .table_topic i{margin-left:10px;}
</style>
<div style="display:flex;" class="lecture_menu">
	<a href="/professor/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a ">홈</a>
	<a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a ">공지사항</a>
    <a href="/professor/task/list?lecCd=${param.lecCd}" class="sub_menu_a">과제</a>
    <a href="/professor/test/testList?lecCd=${param.lecCd}" class="sub_menu_a ">시험</a>
    <a href="/professor/lectureAttendance?lecCd=${param.lecCd}" class="sub_menu_a effect">출결관리</a>
    <a href="/professor/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
    <a href="/professor/objection/list?lecCd=${param.lecCd}" class="sub_menu_a">성적이의신청</a>
</div>

<div class="FreeBoard_box" style="background-color: white;">
	<input type="text" id="vo" style="display: none;" value='${lecture}'>
	<div class="row">
		<div class="col-md-12">
			<div class="card" style="margin-top: 8px;">
				<br><br>
	<div style="font-size:12px; color:#888888; margin-bottom: 20px; margin-left: 35px;" class="cateDiv">
		<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/list" style="font-size:12px; color:#888888;">강의실</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/detail?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;" id="lecNm"></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lectureAttendance?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">출결관리</a></span>
	</div>
				<div class="topic">
					<div class="table_topic" style="display: flex;">
						<div style="flex: 1; margin-left: 33px;">출결관리</i></div>
					</div>
				</div>
				<div class="card-body" style="width:100%;">
					<div id="bootstrap-data-table_wrapper"
						class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer" style="width:100%;">
						<div class="row">
							<div class="col-sm-12">
								<table id="bootstrap-data-table"
									class="table table-striped table-bordered dataTable no-footer"
									role="grid" aria-describedby="bootstrap-data-table_info" style="width: 100%;">
									<c:set value="${fn:length(lectureVO.calendarList)}" var="orginSize"/>
									<thead>
										<c:set value="${fn:length(fn:split(lectureVO.lectureScheduleVO.lecDay, '/'))}" var="daySize"/>
										<c:choose>
											<c:when test="${daySize == 1}">
												<c:set value="${fn:length(lectureVO.calendarList)}" var="span" />											
											</c:when>
											<c:when test="${daySize == 2}">
												<c:choose>
													<c:when test="${fn:length(lectureVO.calendarList) % 2 == 0}">
														<c:set value="${fn:length(lectureVO.calendarList) / 2}" var="span" />
													</c:when>
													<c:otherwise>
														<c:set  value="${(fn:length(lectureVO.calendarList) / 2) + 0.5}" var="span"/>
													</c:otherwise>
												</c:choose>
											</c:when>
										</c:choose>
										<tr role="row" class="table_title">
											<th class="text-center" colspan="${orginSize + 3}" id="lectureNm" style="position: relative;">
												<div style="font-size: 18px; font-weight: 600;">${lectureVO.lectureApplyVO.lecaNm}</div> 
												<div style="display: flex; align-items: center; position: absolute; right: 10px; top: 50%; transform: translateY(-50%);">
													<div style="display: flex; align-items: center;  margin-right: 8px;">
														<div style="color: #03c75a; margin-top: -2px; margin-right: 3px;">○</div>  : 출석
													</div>
													<div style="display: flex; align-items: center;  margin-right: 3px;">
														<div style="color: #39A7FF; margin-right: 3px;">△</div>  : 지각
													</div>
													<div style="display: flex; align-items: center; "> 
														<div style="color: #ff2929; font-size: 18px; margin-top: -4px; margin-right: 3px;">×</div>  : 결석
													</div>
												</div>
											</th>
										</tr>
										<tr role="row" class="table_title text-center">
											<th width="150px!important;" class="text-center" rowspan="2"><b>학생</b></th>
											<c:set value="${fn:split(lectureVO.lectureScheduleVO.lecDay, '/')}" var="dayArr"/>
											<c:choose>
												<c:when test="${daySize == 1}">
													<c:forEach begin="0" end="${span - 1}" var="i">
														<th style="width: calc( 100% / 16)!important;"><b>${i+1}주차</b></th>
													</c:forEach>
												</c:when>
												<c:when test="${daySize == 2}">
													<c:forEach begin="0" end="${span - 1}" var="i">
														<th style="width: calc( 100% / 16)!important;" colspan="2"><b>${i+1}주차</b></th>
													</c:forEach>
												</c:when>
											</c:choose>										
											<th rowspan="2" style="width: 47px!important; height: 112px; line-height: 80px; text-wrap: nowrap; position: absolute; right: 1rem; z-index: 2; background-color: #f8f9fa; border: none;">비고</th>
										</tr>
										<tr role="row" class="table_title text-center">
											<c:forEach items="${lectureVO.calendarList}" var="calendar">
												<td>
													<div style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
														<fmt:formatDate value="${calendar.calDate}" pattern="E"/>
														<input type="checkbox" class="insertAll" data-form-date="${calendar.formDate}" style="transform: scale(0.8);">
													</div>
												</td>
											</c:forEach>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${lectureVO.studentList}" var="studentVO">
											<tr role="row" class="odd" style="border-bottom: 1px solid #f2f3f4; height: 80px!important;" id="trHeight">
												<td style="padding-right: 2px; display: flex; align-items: center; height: 80px; width: 135px;" class="text-center" >
													<div style="width: 60px; height: 70px; position: relative; overflow: hidden; margin-right: 10px;">
														<c:choose>
															<c:when test="${fn:length(studentVO.filesDetailVO.fileSvnm) > 0}">
																<img src="/resources/upload/${studentVO.filesDetailVO.fileSvnm}" style="width: 80px; height: 80px;  object-fit: contain; display:inline; position: absolute; top: 60%; left: 50%; transform: translate(-50%, -50%);">
															</c:when>
															<c:otherwise>
																<img src="/resources/images/unknownperson.jpg" style="width: 80px; height: 80px;  object-fit: contain; display:inline; position: absolute; top: 60%; left: 50%; transform: translate(-50%, -50%);">
															</c:otherwise>
														</c:choose>
													</div>
													<div style="text-align: left;">
														<div style="font-size: 12px; color: #888;">${studentVO.stuCd}</div>
														<div style="font-size: 14px; color: #555;">${studentVO.userVO.userNm}</div>
														<div style="font-size: 12px; color: #888;">${studentVO.departmentVO.depNm}</div>
													</div>
												</td>
												<c:choose>
													<c:when test="${daySize == 1}">
														<c:forEach begin="0" end="${orginSize - 1}" var="i">
															<td style="height: 80px; padding:0;">
																<div style="height: 40px; line-height: 30px; cursor:pointer; font-weight: bold;" class="insertAtt" data-form-date="${lectureVO.calendarList[i].formDate}" data-stu-cd="${studentVO.stuCd}" data-att-yn="${studentVO.attendanceList[i].attYn}">
																	<c:if test="${lectureVO.calendarList[i].formDate eq studentVO.attendanceList[i].formDate}">
																		<c:choose>
																			<c:when test="${studentVO.attendanceList[i].attYn eq 0}">
																				<div style="color: #03c75a;">○</div>
																			</c:when>	
																			<c:when test="${studentVO.attendanceList[i].attYn eq 1}">
																				<div style="color: #ff2929; font-size: 22px;">×</div>
																			</c:when>	
																			<c:when test="${studentVO.attendanceList[i].attYn eq 2}">
																				<div style="color: #39A7FF;">△</div>
																			</c:when>
																		</c:choose>
																	</c:if>
																</div>
															</td>
														</c:forEach>
														<c:set value="0" var="attCnt"/>
														<c:forEach items="${studentVO.attendanceList}" var="att">
															<c:if test="${att.attYn eq 0}">
																<c:set var="attCnt" value="${attCnt + 1}"/>
															</c:if>
														</c:forEach>
													<td class="attNote" style="font-size: 12px; width: 40px;">${attCnt}/${orginSize}</td>
													</c:when>
													<c:when test="${daySize == 2}">
														<c:forEach begin="0" end="${orginSize}" var="i" step="1">
															<td style="height: 80px; padding:0;">
																<div style="height: 40px; line-height: 30px; cursor:pointer; font-weight: bold;" class="insertAtt" data-form-date="${lectureVO.calendarList[i].formDate}" data-stu-cd="${studentVO.stuCd}" data-att-yn="${studentVO.attendanceList[i].attYn}">
																	<c:if test="${lectureVO.calendarList[i].formDate eq studentVO.attendanceList[i].formDate}">
																		<c:choose>
																			<c:when test="${studentVO.attendanceList[i].attYn eq 0}">
																				<div style="color: #03c75a;">○</div>
																			</c:when>	
																			<c:when test="${studentVO.attendanceList[i].attYn eq 1}">
																				<div style="color: #ff2929; font-size: 22px;">×</div>
																			</c:when>	
																			<c:when test="${studentVO.attendanceList[i].attYn eq 2}">
																				<div style="color: #39A7FF;">△</div>
																			</c:when>
																		</c:choose>
																	</c:if>
																</div>
															</td>
														</c:forEach>
														<c:set value="0" var="attCnt"/>
														<c:forEach items="${studentVO.attendanceList}" var="att">
															<c:if test="${att.attYn eq 0}">
																<c:set var="attCnt" value="${attCnt + 1}"/>
															</c:if>
														</c:forEach>
													<td class="attNote" style="font-size: 12px; width: 40px;">${attCnt}/${orginSize}</td>
													</c:when>
												</c:choose>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<div style="display: flex; justify-content: end;">
									<button class="btn-two sky" id="insertAllBtn">일괄 입력</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 																				<svg xmlns="http://www.w3.org/2000/svg" height="24" width="24" viewBox="0 0 448 512"><path fill="#03c75a" d="M438.6 105.4c12.5 12.5 12.5 32.8 0 45.3l-256 256c-12.5 12.5-32.8 12.5-45.3 0l-128-128c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0L160 338.7 393.4 105.4c12.5-12.5 32.8-12.5 45.3 0z"/></svg> -->
<!-- 																				<svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 384 512"><path fill="#ff2929" d="M376.6 84.5c11.3-13.6 9.5-33.8-4.1-45.1s-33.8-9.5-45.1 4.1L192 206 56.6 43.5C45.3 29.9 25.1 28.1 11.5 39.4S-3.9 70.9 7.4 84.5L150.3 256 7.4 427.5c-11.3 13.6-9.5 33.8 4.1 45.1s33.8 9.5 45.1-4.1L192 306 327.4 468.5c11.3 13.6 31.5 15.4 45.1 4.1s15.4-31.5 4.1-45.1L233.7 256 376.6 84.5z"/></svg> -->
<!-- 																				<i class="fa-solid fa-play fa-rotate-270 fa-xl" style="color: #f9bf1f;"></i> -->

<script>
	
	$(function() {
		
		$("#lecNm").text($(".lectureName").text());
		
		const attendance = JSON.parse($("#vo").val());
		
		console.log(attendance);
		
		let formDate = "";
		let stuCd = "";
		
		// 출결 개별 입력
		function insertAttendance() {
			$(".insertAtt").off("click");
			formDate = $(this).data("formDate");
			stuCd = $(this).data("stuCd");
			console.log("formDate = " + formDate + ",  stuCd = " + stuCd);
			
			const childrenNode = $(this).children()[0];
			
			console.log("childrenNode =>", childrenNode);
			
			if (childrenNode != undefined) {
				const tagName = childrenNode.tagName;
				
				console.log("tagName ==> ", tagName);
				
				if (tagName == 'SELECT') {
					return;
				};
				
				if (tagName == 'DIV') {
					Swal.fire({
					title: "출결을 수정하시겠습니까?",
					icon: "question",
					width: 500,
					position: "top",
					showCancelButton: true,
					confirmButtonColor: "#3085d6",
					cancelButtonColor: "#555555",
					confirmButtonText: "수정",
					cancelButtonText: "취소",
				}).then((result) => {
					if (result.isConfirmed) {
						$(this).html(`
							<select class="attUpdate custom-select" style="text-align: center; width: 29px;">
								<option value="">-</option>
								<option value="0">○</option>
								<option value="2">△</option>
								<option value="1">X</option>
							</select>
						`)
					}
				});
					return;
				}
			}
			$(this).html(`
				<select class="attYn custom-select" style="text-align: center; width: 29px;">
					<option value="">-</option>
					<option value="0">○</option>
					<option value="2">△</option>
					<option value="1">X</option>
				</select>
			`)
		}
		
		$(".insertAtt").on("click", insertAttendance)
		
		// 출결 변경
		$(document).on("change", ".attUpdate", function() {
			const attYn = $(this).val();
			$.ajax({
				url: "/professor/lectureAttendance/update",
				contentType: "application/json; charset=UTF-8",
				data: JSON.stringify({
					attDt : formDate,
					stuCd : stuCd,
					attYn : attYn,
					lecsCd : attendance.lectureScheduleVO.lecsCd
				}),
				type: "post",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success : res => {
					if (res == 1) {
						if (attYn == 0) txt = `<div style="color: #03c75a;">○</div>`
						else if (attYn == 1) txt = `<div style="color: #ff2929; font-size: 22px;">×</div>`
						else if (attYn == 2) txt = `<div style="color: #39A7FF;">△</div>`
						$(this).parent().html(txt);
					}
					$(".insertAtt").on("click", insertAttendance);
				}
			})
		})
		
		
		changeSelectBox = function() {
			const attYn = $(this).val();
			
			$.ajax({
				
				url: "/professor/lectureAttendance/insert",
				contentType: "application/json; charset=UTF-8",
				data: JSON.stringify({
					attDt : formDate,
					stuCd : stuCd,
					attYn : attYn,
					lecsCd : attendance.lectureScheduleVO.lecsCd
				}),
				type: "post",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success: res => {
					if (res == 1) {
						let txt = '';
						if (attYn == 0) txt = `<div style="color: #03c75a;">○</div>`
						else if (attYn == 1) txt = `<div style="color: #ff2929; font-size: 22px;">×</div>`
						else if (attYn == 2) txt = `<div style="color: #39A7FF;">△</div>`
						$(this).parent().html(txt);
						$(".insertAtt").on("click", insertAttendance);
					}
				}
			})
		};
		
		// selectBox option 변경 시
		$(document).on("change", ".attYn", changeSelectBox);
		
		
		$(".insertAll").on("change", function() {
			const formDate = $(this).data("formDate");
				
			let selectedNode = $(`div[data-form-date='\${formDate}']`);
			
			// 체크박스를 선택할 때
			if ($(this).is(':checked')) {
				$.each(selectedNode, function(index, item) {
					if ($(item).children().length == 0) {
						$(item).html(`
							<select class="attYn custom-select" style="text-align: center; width: 29px;">
								<option value="0" selected>○</option>
								<option value="2">△</option>
								<option value="1">X</option>
							</select>
						`);
					}
					
				})
				
				
			// 체크박스를 해제할 때
			} else {
				
				$.each(selectedNode, function(index, item) {
					
					if ($(item).children()[0].tagName == "SELECT") {
						$(item).html("");
					}
				})
				
			}
		})
		
		
		$("#insertAllBtn").on("click", function() {
			const checkBoxList = $(".insertAll");
			let cnt = 0;
			let result = 0;
			$.each(checkBoxList, function(index, item) {
				if ($(item).is(":checked")) {
					const formDate = $(item).data("formDate");
					let selectedNode = $(`div[data-form-date='\${formDate}']`);
					$.each(selectedNode, (index, item) => {
						if ($(item).children()[0].tagName == "SELECT") {
							cnt++;
							const attYn = $($(item).children()[0]).val();
							const data = {
								attDt : formDate,
								stuCd : $(item).data("stuCd"),
								attYn : attYn,
								lecsCd : attendance.lectureScheduleVO.lecsCd
							}
							$.ajax({
							url: "/professor/lectureAttendance/insert",
							contentType: "application/json; charset=UTF-8",
							data: JSON.stringify(data),
							type: "post",
							async: false,
							beforeSend:function(xhr){
								xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
							},
							success: res => {
								if (res == 1) {
									result++;
									let txt = '';
									if (attYn == 0) txt = `<div style="color: #03c75a;">○</div>`
									else if (attYn == 1) txt = `<div style="color: #ff2929; font-size: 22px;">×</div>`
									else if (attYn == 2) txt = `<div style="color: #39A7FF;">△</div>`
									$(item).html(txt);
									$(".insertAtt").on("click", insertAttendance);
								}
							}
						})
						}
					})
				}
				if (cnt == result) alertSuccess("출결 일괄 입력이 완료되었습니다.");
				$(item).prop("checked", false);
			})
			
			const noteList = $(".attNote");
			$.each(noteList, function(i, item) {
				
				let cnt = 0;
				
				const childrenNode = $(item).parent().children();
				
				$.each(childrenNode, function(j, children) {
					
					const tdChildren = $(children).children();
					
					const attYn = tdChildren.data("attYn");
					
					console.log("attYn ==>", attYn);
					
					if (attYn === 0) cnt++;
					
				})
				
				console.log(cnt);
				
				let arr = $(item).text().split("/");
				arr[0] = cnt + 1;
				const strArr = arr.join("/");
				console.log(strArr);
				$(item).html(strArr);
				
			})
		})
	})
</script>