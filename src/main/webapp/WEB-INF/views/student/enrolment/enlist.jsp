<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
.enrolment_box{width:100%; padding:40px; background-color:#ffffff;}
.enrolment_box .table_topic{font-size: 20px; padding-bottom:30px;}
.enrolment_box .table_topic i{margin-left:10px;}
.enrolment_box table{font-size:13px; width:100%; text-align:center;}
.table_title{font-size:13px; border-top:1px solid #d1d0d0; border-bottom:1px solid #d1d0d0; height:32px; line-height:32px;}
.enrolment_box tr{}
.enlist_box{
	display: flex; justify-content:space-between;
    padding: 20px;
    background-color: #EEF5FF;
    border-radius: 10px;
}

.enlist_box1{display:flex; align-items:center;}

.enlist_box input {
	width:120px; text-align:center;
	border: 1px solid #9EB8D9;
	border-radius: 6px;
	font-size: 14px;
}
.enlist_box input:focus{outline:none;}

.enlist_box span{font-size: 14px; margin-right:5px;}
.enlist_content {
	display: flex;
    flex-direction: column;
    gap: 40px;
}

.enlist_box select{
	border: 1px solid #9EB8D9;
	border-radius: 6px;
	width: 200px; font-size:14px;
}


.enlist_innerbox{
	display: flex; 
	align-items: center;
}

.enlist_label {
    font-size:14px;
    margin-right: 5px;
}


table {
  width: 50%;
  border-collapse: collapse;
  margin-top: 20px;
  background-color: white;
}
th, td {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
  text-wrap: nowrap;
}
table th {
  background-color: #f2f2f2;
}

#subTable tr td:nth-child(2){width: 20%;}

.addTimeTable {
	width: 50px!important;
}

.tTime{
	width: 10%;
}

.enapp-link:hover{background-color:#ccc; color:#fff;}

.enrolment_box .thead1{width: 8%;}
.enrolment_box .thead1 td:nth-child(1){width: 8%;}
.enrolment_box .thead1 td{width: calc(92% / 5);}
</style>

<sec:authentication property="principal.userVO" var="userVO"/>
<div class="enrolment_box">
	<input type="text" id="jsonLecture" value='${jsonLecture}' style="display: none;">
	<input type="text" id="jsonUser" value='${jsonUser}' style="display: none;">
	<input type="text" id="jsonBuldCommonList" value='${jsonBuldCommonList}' style="display: none;">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">수강신청</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">장바구니</span>
	</div>
	<div style="display:flex; justify-content:space-between;">
		<div class="table_topic">장바구니<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
		<div style="">
			<a href="/student/enrolment/app" style="border:2px solid #ccc; transition:0.3s; padding:5px 10px; border-radius:5px;">수강신청바로가기</a>
		</div>
	</div>
	<div class="enlist_content">
		<div class="enlist_box" >
			<div>소속대학
				<input type="text" value="${creditVO.colNm}" readonly>
			</div>
			<div>학과
				<input type="text"  value="${userVO.studentVO.departmentVO.depNm}" readonly>
			</div>
			<div>신청가능학점
				<c:set value="0" var="sum"/>
				<c:forEach items="${userVO.studentVO.enrolmentList}" var="enrolmentVO">
					<c:set value="${sum + enrolmentVO.lectureVO.lectureApplyVO.lecaCrd}" var="sum"/>
				</c:forEach>
				<input id="topStandCredit" type="number" value="${creditVO.stdCredit - sum}" readonly>
			</div>
			<div>학년
				<input type="text"  value="${userVO.studentVO.stuYear}학년 ${userVO.studentVO.stuSem}학기" readonly>
			</div>
		</div>
		
		<div class="enlist_box enlist_box2" style="flex-direction: column;">
			<div style="display: flex; justify-content:space-between;">
				<div class="enlist_innerbox">
					<div class="enlist_label">년도</div>
					<input type="text" value="2024" readonly>
				</div>
				<div class="enlist_innerbox"><div class="enlist_label">학기</div>
					<input type="text" value="1" readonly>
				</div>
				<div class="enlist_innerbox"><div class="enlist_label">학과전공</div>
					<select class="selectClass">
						<option value="ALL" selected>전체</option>
						<option value="${userVO.studentVO.departmentVO.depCd}">${userVO.studentVO.departmentVO.depNm}</option>
					</select>
				</div>
			</div>
			<div class="mt-4" style="display: flex; justify-content:space-between;">
				<div class="enlist_innerbox"><div class="enlist_label">이수구분</div>
					<select class="selectClass">
						<option value="ALL">전체</option>
						<option value="0">전공필수</option>
						<option value="1">전공선택</option>
						<option value="2">교양필수</option>
						<option value="3">교양선택</option>
					</select>
				</div>
				<div class="enlist_innerbox" style=" margin-right: 150px;"><div class="enlist_label">과목명</div>
					<input type="text" id="searchBar" style="width: 500px;" onkeyup="searchFunction(event)">
					<button type="button" class="btn-two green mini" id="searchBtn">검색</button>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top: 30px; height:400px; overflow-y:scroll;">
	<table style="margin-top: 30px;">
		<tr class="table_title">
			<th>관심강의</th>
			<th>개설학과</th>
			<th>학년</th>
			<th>과목명</th>
			<th>수강정원</th>
			<th>수강인원</th>
			<th>개설이수구분</th>
			<th>학점</th>
			<th>강의시간</th>
			<th>강의실</th>
			<th>담당교수</th>
			<th>성적평가방식</th>
			<th>강의계획서</th>
		</tr>
		<tbody id="lectureListBody">
			<c:forEach items="${lectureList}" var="vo">
				<tr>
					<td>
						<c:set value="true" var="flag"/>
						<c:forEach items="${vo.wishLectureList}" var="wishLectureVO">
							<c:if test="${flag and wishLectureVO.stuCd eq userVO.userCd}">
								<button class="btn-two mini dark removeWishBtn" data-lec-cd="${vo.lecCd}">삭제</button>
								<c:set value="false" var="flag"/>
							</c:if>
						</c:forEach>
						<c:if test="${flag}">
							<button class="btn-two mini green addWishBtn" data-lec-cd="${vo.lecCd}">등록</button>
						</c:if>
					</td>
					<td>${vo.lectureApplyVO.departmentVO.depNm}</td>
					<td>${vo.lectureApplyVO.lecaTrg}</td>
					<td>${vo.lectureApplyVO.lecaNm}</td>
					<td>${vo.lecHcnt}</td>
					<td>${vo.lectureApplyVO.lecaCap}</td>
					<td>
						<c:choose>
							<c:when test="${vo.lectureApplyVO.lecaType eq 0}">
								전공필수
							</c:when>
							<c:when test="${vo.lectureApplyVO.lecaType eq 1}">
								전공선택
							</c:when>
							<c:when test="${vo.lectureApplyVO.lecaType eq 2}">
								교양필수
							</c:when>
							<c:when test="${vo.lectureApplyVO.lecaType eq 3}">
								교양선택
							</c:when>
						</c:choose>
					</td>
					<td>${vo.lectureApplyVO.lecaCrd}</td>
					<td>${vo.lectureScheduleVO.lecDay}   ${vo.lectureApplyVO.lecaStdt} ~ ${vo.lectureApplyVO.lecaEddt}</td>
					<td>
						<c:forEach items="${buldCommonList}" var="buildingVO">
							<c:if test="${fn:substring(vo.lectureApplyVO.roomCd, 0,6) eq buildingVO.comdCd}">
								${buildingVO.comdNm} ${fn:substring(vo.lectureApplyVO.roomCd, 6,10)}호
							</c:if>
						</c:forEach>
					</td>
					<td>${vo.lectureApplyVO.professorVO.userVO.userNm}</td>
					<td>
						<c:choose>
							<c:when test="${vo.lectureApplyVO.lecaEva eq 0}">상대평가</c:when>
							<c:otherwise>절대평가</c:otherwise>
						</c:choose>
					</td>
					<td><a class="btn-two mini sky" href="/resources/upload/${vo.lectureApplyVO.lecaNm} 강의계획서.pdf" download="${vo.lectureApplyVO.lecaNm} 강의계획서">다운로드</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<div style="display: flex;">
		<div style="width: 60%;">
			<table>
				<tr>
					<th style="width: 8%;">시간</th>
					<th style="width: calc(92% / 5);">월요일</th>
					<th style="width: calc(92% / 5);">화요일</th>
					<th style="width: calc(92% / 5);">수요일</th>
					<th style="width: calc(92% / 5);">목요일</th>
					<th style="width: calc(92% / 5);">금요일</th>
				</tr>
				<tbody id="timeTableBody">
					<tr class="thead thead1" id="9" style="height: 70px;">
						<td class="tTime">09:00 - 10:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td>
					</tr>
					<tr class="thead thead1" id="10" style="height: 70px;">
						<td class="tTime">10:00 - 11:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td>
					</tr>
					<tr class="thead thead1" id="11" style="height: 70px;">
						<td class="tTime">11:00 - 12:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td>
					</tr>
					<tr class="thead thead1" id="12" style="height: 70px;">
						<td class="tTime">12:00 - 13:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td>
					</tr>
					<tr class="thead thead1" id="13" style="height: 70px;">
						<td class="tTime">13:00 - 14:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td>
					</tr>
					<tr class="thead thead1" id="14" style="height: 70px;">
						<td class="tTime">14:00 - 15:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td>
					</tr>
					<tr class="thead thead1" id="15" style="height: 70px;">
						<td class="tTime">15:00 - 16:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td>
					</tr>
					<tr class="thead thead1" id="16" style="height: 70px;">
						<td class="tTime">16:00 - 17:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td>
					</tr>
					<tr class="thead thead1" id="17" style="height: 70px;">
						<td class="tTime">17:00 - 18:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div style="width: 40%; margin-left: 10px;">
			<table id="subTable">
				<tr>
					<th>시간표조회</th>
					<th>관심강의</th>
					<th>과목명</th>
					<th>학점</th>
					<th>강의시간</th>
				</tr>
				<c:forEach items="${lectureList}" var="lectureVO">
					<c:forEach items="${lectureVO.wishLectureList}" var="wishLectureVO">
						<c:if test="${userVO.userCd eq wishLectureVO.stuCd}">
							<tr id="${lectureVO.lecCd}">
								<td><input type="checkbox" class="addTimeTable" data-lec-cd="${lectureVO.lecCd}"></td>
								<td>
									<button class="btn-two mini dark removeWishBtn2" data-lec-cd="${lectureVO.lecCd}">삭제</button>
								</td>
								<td>${lectureVO.lectureApplyVO.lecaNm}</td>
								<td>${lectureVO.lectureApplyVO.lecaCrd}</td>
								<td>${lectureVO.lectureApplyVO.lecaSche}   ${lectureVO.lectureApplyVO.lecaStdt} ~ ${lectureVO.lectureApplyVO.lecaEddt}</td>
							</tr>					
						</c:if>
					</c:forEach>
				</c:forEach>
				<tr>
					<th></th>
					<td>신청가능학점</td>
					<td>${creditVO.stdCredit}</td>
					<td>신청학점</td>
					<td id="currentCredit">0</td>
				</tr>
			</table>
		</div>
	</div>
	
	
</div>

<script>
	
	const timeTableColor = ["#F2E8E8", "#FFE9E9", "#F9E9D9", "#FFF8CC", "#F0F9CC", "#DAEFE6", "#DCEEF0"];
	const jsonLecture = JSON.parse($("#jsonLecture").val());
	console.log(jsonLecture);
	const jsonUser = JSON.parse($("#jsonUser").val());
	console.log(jsonUser);
	const userCd = jsonUser.userCd;
	const jsonBuldCommonList = JSON.parse($("#jsonBuldCommonList").val());
	console.log(jsonBuldCommonList);
	
	function searchFunction(event) {
		if (event.keyCode == 13) $("#searchBtn").click();
	}
	
	
	$("#searchBtn").on("click", function() {
		
		const keyword = $("#searchBar").val();
		
		console.log(keyword);
		
		$.ajax({
			url: "/student/enrolment/searchLecture?lecNm="+keyword,
			dataType: "json",
			type: "get",
			success: res => {
				console.log(res);
				$("#lectureListBody").empty();
				res.forEach(lecture => {
					let txt = "";
					txt += `
						<tr>
							<td>`
					let flag = false;
					jsonUser.studentVO.wishLectureList.forEach(wishLecture => {
						if (lecture.lecCd == wishLecture.lecCd) {
							txt += `<button class="btn-two mini dark removeWishBtn" data-lec-cd="\${lecture.lecCd}">삭제</button>`
							flag = true;
						}
					});
					if (flag == false) txt += `<button class="btn-two mini green addWishBtn" data-lec-cd="\${lecture.lecCd}">등록</button>`
					txt += `
						</td>
						<td>\${lecture.lectureApplyVO.departmentVO.depNm}</td>
						<td>\${lecture.lectureApplyVO.lecaTrg}</td>
						<td>\${lecture.lectureApplyVO.lecaNm}</td>
						<td>\${lecture.lecHcnt}</td>
						<td>\${lecture.lectureApplyVO.lecaCap}</td>`
					if (lecture.lectureApplyVO.lecaType == 0) {
						txt += `<td>전공필수</td>`
					} else if (lecture.lectureApplyVO.lecaType == 1) {
						txt += `<td>전공선택</td>`
					} else if (lecture.lectureApplyVO.lecaType == 2) {
						txt += `<td>교양필수</td>`
					} else if (lecture.lectureApplyVO.lecaType == 3) {
						txt += `<td>교양선택</td>`
					}
					txt += `
						<td>\${lecture.lectureApplyVO.lecaCrd}</td>
						<td>\${lecture.lectureScheduleVO.lecDay}  \${lecture.lectureApplyVO.lecaStdt} ~ \${lecture.lectureApplyVO.lecaEddt}</td>`
					jsonBuldCommonList.forEach(building => {
						const buildCd = lecture.lectureApplyVO.roomCd.substr(0,6);
						const roomNo = lecture.lectureApplyVO.roomCd.substr(6,10);
						if (buildCd == building.comdCd) txt += `<td>\${building.comdNm} \${roomNo}호</td>`
					});
					if (lecture.lectureApplyVO.lecaEva == 0) {
						txt += `
							<td>\${lecture.lectureApplyVO.professorVO.userVO.userNm}</td>
							<td>상대평가</td>
						`
					} else {
						txt += `
							<td>\${lecture.lectureApplyVO.professorVO.userVO.userNm}</td>
							<td>상대평가</td>
						`
					}
					txt += `
						<td><a class="btn-two mini sky">다운로드</a></td>
						</tr>
					`
					$("#lectureListBody").append(txt);
				})
				
				
			},
			error: xhr => {
				console.log(xhr);
			}
		})
		
	});
	
	function doTimeRangesOverlap(start1, end1, start2, end2) {
		return !(end1 <= start2 || start1 >= end2);
	}
	
	$(document).on("click", ".addWishBtn", function() {
		
		const lecCd = $(this).data("lecCd");
		
		console.log(lecCd, userCd);
		
		$.ajax({
			url: "/student/enrolment/addWishLecture",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({lecCd: lecCd, stuCd: userCd}),
			type: "post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: res => {
				if (res == 1) {
					alertSuccess("관심강의 추가 완료.");
					$(this).parent().html(`<button class="btn-two mini dark removeWishBtn" data-lec-cd="\${lecCd}">삭제</button>`);
					
					let txt = "";
					jsonLecture.forEach(lecture => {
						if (lecture.lecCd == lecCd) {
							txt += `
							<tr id="\${lecCd}">
								<td><input type="checkbox" class="addTimeTable" data-lec-cd="\${lecture.lecCd}"></td>
								<td><button class="btn-two mini dark removeWishBtn2" data-lec-cd="\${lecture.lecCd}">삭제</button></td>
								<td>\${lecture.lectureApplyVO.lecaNm}</td>
								<td>\${lecture.lectureApplyVO.lecaCrd}</td>
								<td>\${lecture.lectureApplyVO.lecaSche}   \${lecture.lectureApplyVO.lecaStdt} ~ \${lecture.lectureApplyVO.lecaEddt}</td>
							</tr>
							`
						}
					})
					$("#subTable tr:first").after(txt);
				}
			}
		})
	});
	
	$(document).on("click", ".removeWishBtn", function() {
		
		const lecCd = $(this).data("lecCd");
		
		console.log(lecCd, userCd);
		
		$.ajax({
			url: "/student/enrolment/removeWishLecture",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({lecCd: lecCd, stuCd: userCd}),
			type: "post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: res => {
				if (res == 1) {
					alertSuccess("관심강의 삭제 완료")
					$(this).parent().html(`<button class="btn-two mini green addWishBtn" data-lec-cd="\${lecCd}">등록</button>`);
					$(`tr[id=\${lecCd}]`).remove();
				}
			}
		})
		
	})
	
	$(document).on("click", ".removeWishBtn2", function() {
		
		const lecCd = $(this).data("lecCd");
		
		$.ajax({
			url: "/student/enrolment/removeWishLecture",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({lecCd: lecCd, stuCd: userCd}),
			type: "post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: res => {
				if (res == 1) {
					alertSuccess("관심강의 삭제 완료")
					$(this).parent().parent().remove();
					
					$(`button[data-lec-cd=\${lecCd}]`).parent().html(`
						<button class="btn-two mini green addWishBtn" data-lec-cd="\${lecCd}">등록</button>
					`)
					
				}
			}
		})
	})
	const timeTableData = {
		"9" : [],
		"10" : [],
		"11" : [],
		"12" : [],
		"13" : [],
		"14" : [],
		"15" : [],
		"16" : [],
		"17" : [],
	};
	
	$(document).on("click", ".addTimeTable", function() {
		
		const lecCd = $(this).data("lecCd");
		
		
		let dayArr = [];
		let startTime = "";
		let endTime = "";
		let lecNm = "";
		let lectureTime = "";
		let roomCd = "";
		let credit = "";
		
		jsonLecture.forEach(lecture => {
			
			if (lecture.lecCd == lecCd) {
				dayArr = lecture.lectureScheduleVO.lecDay.split("/");
				startTime = new Date(lecture.lectureScheduleVO.lecsStdt).getHours();
				endTime = new Date(lecture.lectureScheduleVO.lecsEddt).getHours();
				lecNm = lecture.lectureApplyVO.lecaNm;
				roomCd = lecture.lectureApplyVO.roomCd;
				lectureTime = endTime - startTime;
				credit = lecture.lectureApplyVO.lecaCrd;
			}
		})
		
		const keys = Object.keys(timeTableData);
		
		if ($(this).is(":checked")) {
			
			let flag = false;
			
			for(const key of keys) {
				if (dayArr.length == 1) {
					timeTableData[key].forEach(time => {
						console.log("ket =>", key," value =>", timeTableData[key]);
						if (time.day == dayArr[0] && doTimeRangesOverlap(time.startTime, time.endTime, startTime, endTime)) {
							alertError("시간표가 중복된 강의입니다.");
							$(this).prop("checked", false);
							flag = true;
						}
						
					})
				} else {
					timeTableData[key].forEach(time => {
						if ((time.day == dayArr[0] && doTimeRangesOverlap(time.startTime, time.endTime, startTime, endTime)) || 
							(time.day == dayArr[1] && doTimeRangesOverlap(time.startTime, time.endTime, startTime, endTime)))	{
							alertError("시간표가 중복된 강의입니다.");
							$(this).prop("checked", false);
							flag = true;
						}
						
					})
				}
			}
			
			if (flag) return;
			
			$("#timeTableBody").empty();
			
			for(const key of keys) {
				if (key == startTime) {
					dayArr.forEach(day => {
						timeTableData[key].push({
							day:day, 
							lecNm:lecNm,
							roomCd:roomCd,
							startTime:startTime,
							endTime:endTime
						});
					})
					for(let i = 1; i < lectureTime; i++) {
						dayArr.forEach(day => {
							const keyss = Number(key) + i;
							timeTableData[String(keyss)].push({
								day:day, 
								lecNm:lecNm,
								roomCd:roomCd,
								startTime:startTime,
								endTime:endTime
							});
						})
					}
				}
				let newNode = "";
				if (`\${key}` == 9) {
					newNode = $(`<tr class="thead" id="\${key}"><td class="tTime">0\${key}:00 - 10:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td></tr>`);
				} else {
					let endTime = Number(`\${key}`) + 1;
					newNode = $(`<tr class="thead" id="\${key}"><td class="tTime">\${key}:00 - \${endTime}:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td></tr>`);
				}
				
				timeTableData[key].forEach(time => {
					
					jsonBuldCommonList.forEach(jsonItem => {
						
						const subStr = time.roomCd.substr(0,6);
						const roomNo = time.roomCd.substr(6,10);
						
						if (subStr == jsonItem.comdCd) {
							time.buldNm = jsonItem.comdNm;
							time.roomCd = `\${roomNo}호`
						}
						
					})
					
				})
				
				
				timeTableData[key].forEach(time => {
					if (time.day == "월요일") {
						newNode.children().eq(1).html(`<div style="font-weight: 600;">\${time.lecNm}\n</div><br>\${time.buldNm}<br>\${time.roomCd}`);
					} else if (time.day == "화요일") {
						newNode.children().eq(2).html(`<div style="font-weight: 600;">\${time.lecNm}\n</div><br>\${time.buldNm}<br>\${time.roomCd}`);
					} else if (time.day == "수요일") {
						newNode.children().eq(3).html(`<div style="font-weight: 600;">\${time.lecNm}\n</div><br>\${time.buldNm}<br>\${time.roomCd}`);
					} else if (time.day == "목요일") {
						newNode.children().eq(4).html(`<div style="font-weight: 600;">\${time.lecNm}\n</div><br>\${time.buldNm}<br>\${time.roomCd}`);
					} else if (time.day == "금요일") {
						newNode.children().eq(5).html(`<div style="font-weight: 600;">\${time.lecNm}\n</div><br>\${time.buldNm}<br>\${time.roomCd}`);
					}
				})
				$("#timeTableBody").append(newNode);
			}
			const preVal = Number($("#currentCredit").text());
			$("#currentCredit").text(preVal + credit);
		} else {
			
			const allTds = $("#timeTableBody td");
			
			let j = 0;
			allTds.each(function() {
				
				const lecName = $(this).text().split("\n")[0];
				if (lecNm == lecName) {
					
					let startTimeId = $(this).parent().attr("id");
					
					let rowspan = "";
					let end = "";
					
					if ($(this)[0].hasAttribute("rowspan")) {
						rowspan = $(this)[0].attributes["rowspan"].value;
						end = startTime + Number(rowspan);
					} else {
						rowspan = 1;
						end = startTime + 1;
					}
					
					for(let i = startTimeId; i < end; i++) {
						let day = dayArr[j];
						console.log(i + " == " + day);
						if (day == "월요일") {
							$("#"+i).append(`<td class="monday"></td>`)
						} else if (day == "화요일") {
							$("#"+i).append(`<td class="tuesday"></td>`)
						} else if (day == "수요일") {
							$("#"+i).append(`<td class="wednesday"></td>`)
						} else if (day == "목요일") {
							$("#"+i).append(`<td class="thursday"></td>`)
						} else if (day == "금요일") {
							$("#"+i).append(`<td class="friday"></td>`)
						}
					}
					j++;
					
					$(this).remove();
				}
			})
			
			for(key of keys) {
				
				const lecture = timeTableData[key];
				
				for(let i = lecture.length - 1; i >= 0; i--) {
					
					const lec = lecture[i];
					
					if (lec.lecNm == lecNm) {
						lecture.splice(i,1);
					}
					
				}
				
			}
			
		}
		console.log(timeTableData);
		mergeCells();
		changeColor();
	})
	
	function mergeCells() {
		mergeCell("monday");
		mergeCell("tuesday");
		mergeCell("wednesday");
		mergeCell("thursday");
		mergeCell("friday");
	}
	
	
	function mergeCell(className) {
		$("."+className).each(function() {
			const tempString = $(this).text();
			const rows = $("."+className).filter(function() {
				return $(this).text() == tempString;
			});
			if ($(this).text() != "") {
				if (rows.length > 1) {
					rows.eq(0).attr("rowspan", rows.length);
					rows.not(":eq(0)").remove();
				}
			}
		})
	}
	
	function changeColor() {
		let cnt = 0;
		const allTds = $("#timeTableBody td");
		allTds.each(function() {
			
			const currentText = $(this).text();
			let tdsWithSameText = null;
			
			if (currentText != "") {
				tdsWithSameText = allTds.filter(function() {
					return $(this).text() == currentText;
				})
				if (!tdsWithSameText.hasClass("tTime") && !tdsWithSameText.hasClass("already")) {
					tdsWithSameText.css("background-color", timeTableColor[cnt++]);
					tdsWithSameText.addClass("already")
				}
			}
		})
	}
	
</script>