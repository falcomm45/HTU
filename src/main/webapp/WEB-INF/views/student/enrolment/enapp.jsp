<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
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
		<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
<!-- 		<span style="font-size:12px; color:#888888;">학사행정</span> -->
<!-- 		<span style="font-size:12px; color:#888888;">></span> -->
		<span style="font-size:12px; color:#888888;"><a href="/student/enrolment/app">수강신청</a></span>
	</div>
	<div style="display:flex; justify-content:space-between;">
		<div class="table_topic">수강신청<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
		<div style="">
			<a href="/student/enrolment/list" class="enapp-link" style="border:2px solid #ccc; transition:0.3s; padding:5px 10px; border-radius:5px;">장바구니바로가기</a>
		</div>
	</div>
	<div class="enlist_content" style="margin-bottom:30px;">
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
	<table style=" width: 100%;">
		<tr class="table_title" style="width: 100%; ">
			<th style="width: 8%; text-align: center;">관심강의</th>
			<th style="text-align: center; width: 8%;">개설학과</th>
			<th style="text-align: center; width: 5%;">학년</th>
			<th style="text-align: center; width: 10%;">과목명</th>
			<th style="text-align: center; width: 5%;">수강인원</th>
			<th style="text-align: center; width: 5%;">수강정원</th>
			<th style="text-align: center; width: 10%;">개설이수구분</th>
			<th style="text-align: center; width: 5%;">학점</th>
			<th style="text-align: center; width: 15%;">강의시간</th>
			<th style="text-align: center; width: 10%;">강의실</th>
			<th style="text-align: center; width: 5%;">담당교수</th>
			<th style="text-align: center; width: 9%;">성적평가방식</th>
			<th style="text-align: center; width: 5%;">강의계획서</th>
		</tr>
		<tbody id="lectureListBody">
			<c:forEach items="${lectureList}" var="vo">
				<input type="hidden" value="${vo.lectureApplyVO.lecaNm}" 						class="lecaNM" />
				<input type="hidden" value="${vo.lectureApplyVO.departmentVO.depNm}" 			class="lecaDepNm" />
				<input type="hidden" value="${vo.lectureApplyVO.professorVO.userVO.userNm}"	 	class="lecaUserNm" />
				<input type="hidden" value="${vo.lectureApplyVO.lecaTrg}" 						class="lecaTrG" />
				<input type="hidden" value="${vo.lectureApplyVO.professorVO.userVO.userTel}" 	class="lecaUserTel" />
				<input type="hidden" value="${vo.lectureApplyVO.lecaYear}" 						class="lecaYeaR" />
				<input type="hidden" value="${vo.lectureApplyVO.lecaSem}" 						class="lecaSeM" />
				<input type="hidden" value="${vo.lectureApplyVO.professorVO.userVO.userMail}" 	class="lecaUserMail" />
				<input type="hidden" value="${vo.lectureApplyVO.lecaCrd}" 						class="lecaCrD" />
				<input type="hidden" value="${vo.lectureApplyVO.lecaBook}" 						class="lecaBooK" />
				<input type="hidden" value="${vo.lectureApplyVO.lecaEva}" 						class="lecaEvA" />
				<input type="hidden" value="${vo.lectureApplyVO.crtrMp}" 						class="lecaMP" />
				<input type="hidden" value="${vo.lectureApplyVO.crtrFp}" 						class="lecaFP" />
				<input type="hidden" value="${vo.lectureApplyVO.crtrTp}" 						class="lecaTP" />
				<input type="hidden" value="${vo.lectureApplyVO.crtrAp}" 						class="lecaAP" />
				<input type="hidden" value="${vo.lectureApplyVO.lecaCon}" 						class="lecaCoN" />
				<input type="hidden" value="${vo.weekplanVOList[0].wpCon}" 						class="w1" />
				<input type="hidden" value="${vo.weekplanVOList[1].wpCon}" 						class="w2" />
				<input type="hidden" value="${vo.weekplanVOList[2].wpCon}" 						class="w3" />
				<input type="hidden" value="${vo.weekplanVOList[3].wpCon}" 						class="w4" />
				<input type="hidden" value="${vo.weekplanVOList[4].wpCon}" 						class="w5" />
				<input type="hidden" value="${vo.weekplanVOList[5].wpCon}" 						class="w6" />
				<input type="hidden" value="${vo.weekplanVOList[6].wpCon}" 						class="w7" />
				<input type="hidden" value="${vo.weekplanVOList[7].wpCon}" 						class="w8" />
				<input type="hidden" value="${vo.weekplanVOList[8].wpCon}" 						class="w9" />
				<input type="hidden" value="${vo.weekplanVOList[9].wpCon}" 						class="w10" />
				<input type="hidden" value="${vo.weekplanVOList[10].wpCon}" 					class="w11" />
				<input type="hidden" value="${vo.weekplanVOList[11].wpCon}" 					class="w12" />
				<input type="hidden" value="${vo.weekplanVOList[12].wpCon}" 					class="w13" />
				<input type="hidden" value="${vo.weekplanVOList[13].wpCon}" 					class="w14" />
				<input type="hidden" value="${vo.weekplanVOList[14].wpCon}" 					class="w15" />
				<input type="hidden" value="${vo.weekplanVOList[15].wpCon}" 					class="w16" />
				<tr id="lectureListLecCd${vo.lecCd}" style="width: 100%;">
					<td style="width: 8%; text-align: center;">
						<c:set value="true" var="flag"/>
						<c:forEach items="${vo.wishLectureList}" var="wishLectureVO">
							<c:if test="${flag and wishLectureVO.stuCd eq userVO.userCd}">
								<button class="btn-two mini dark removeWishBtn" data-lec-cd="${vo.lecCd}">삭제</button>
								<c:set value="false" var="flag"/>
							</c:if>
						</c:forEach>
						<c:forEach items="${vo.enrolmentList}" var="enrolmentVO">
							<c:if test="${flag and enrolmentVO.stuCd eq userVO.userCd}">
								<button class="btn-two mini orange btnCancelEnrolment" data-lec-cd="${vo.lecCd}">신청취소</button>
								<c:set value="false" var="flag"/>
							</c:if>
						</c:forEach>
						<c:if test="${flag}">
							<button class="btn-two mini green addWishBtn" data-lec-cd="${vo.lecCd}">등록</button>
						</c:if>
					</td>
					<td style="width: 8%;">${vo.lectureApplyVO.departmentVO.depNm}</td>
					<td style="width: 5%; text-align: center;">${vo.lectureApplyVO.lecaTrg}</td>
					<td style="width: 10%;">${vo.lectureApplyVO.lecaNm}</td>
					<td style="width: 5%; text-align: center;" class="lecHcnt${vo.lecCd}">${vo.lecHcnt}</td>
					<td style="width: 5%; text-align: center;">${vo.lectureApplyVO.lecaCap}</td>
					<td style="width: 10%; text-align: center;">
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
					<td style="width: 5%; text-align: center;">${vo.lectureApplyVO.lecaCrd}</td>
					<td style="width: 15%;">${vo.lectureScheduleVO.lecDay}   ${vo.lectureApplyVO.lecaStdt} ~ ${vo.lectureApplyVO.lecaEddt}</td>
					<td style="width: 10%; text-align: center;">
						<c:forEach items="${buldCommonList}" var="buildingVO">
							<c:if test="${fn:substring(vo.lectureApplyVO.roomCd, 0,6) eq buildingVO.comdCd}">
								${buildingVO.comdNm} ${fn:substring(vo.lectureApplyVO.roomCd, 6,10)}호
							</c:if>
						</c:forEach>
					</td>
					<td style="width: 5%; text-align: center;">${vo.lectureApplyVO.professorVO.userVO.userNm}</td>
					<td style="width: 9%; text-align: center;">
						<c:choose>
							<c:when test="${vo.lectureApplyVO.lecaEva eq 0}">상대평가</c:when>
							<c:otherwise>절대평가</c:otherwise>
						</c:choose>
					</td>
					<td style="width: 5%;"><a class="btn-two mini sky syllabusButton" href="/resources/upload/게임 프로그래밍 강의계획서.pdf" download="게임 프로그래밍 강의계획서">다운로드</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<table id="enrolTable" style="width: 100%;">
		<tr class="table_title" style="width: 100%;">
			<th style="text-align: center; width: 8%;">수강신청</th>
			<th style="text-align: center; width: 8%;">개설학과</th>
			<th style="text-align: center; width: 5%;">학년</th>
			<th style="text-align: center; width: 10%;">과목명</th>
			<th style="text-align: center; width: 5%;">수강인원</th>
			<th style="text-align: center; width: 5%;">수강정원</th>
			<th style="text-align: center; width: 10%;">개설이수구분</th>
			<th style="text-align: center; width: 5%;">학점</th>
			<th style="text-align: center; width: 15%;">강의시간</th>
			<th style="text-align: center; width: 10%;">강의실</th>
			<th style="text-align: center; width: 5%;">담당교수</th>
			<th style="text-align: center; width: 9%;">성적평가방식</th>
			<th style="text-align: center; width: 5%;">강의계획서</th>
		</tr>
		<tr id="noWishLectureRow"><td colspan="13" style="text-align: center;">관심강의를 먼저 추가해주세요.</td></tr>
<%-- 		<c:forEach items="${lectureList}" var="lectureVO"> --%>
<%-- 			<c:forEach items="${lectureVO.wishLectureList}" var="wishLectureVO"> --%>
<%-- 				<c:if test="${userVO.userCd eq wishLectureVO.stuCd}"> --%>
<%-- 					<tr class="${lectureVO.lecCd}"> --%>
<%-- 						<td><button class="btn-two mini sky insertEnrolBtn" data-lec-cd="${lectureVO.lecCd}">신청</button></td> --%>
<%-- 						<td>${lectureVO.lectureApplyVO.departmentVO.depNm}</td> --%>
<%-- 						<td>${lectureVO.lectureApplyVO.lecaTrg}</td> --%>
<%-- 						<td>${lectureVO.lectureApplyVO.lecaNm}</td> --%>
<%-- 						<td class="lecHcnt${lectureVO.lecCd}">${lectureVO.lecHcnt}</td> --%>
<%-- 						<td>${lectureVO.lectureApplyVO.lecaCap}</td> --%>
<!-- 						<td> -->
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${lectureVO.lectureApplyVO.lecaType eq 0}"> --%>
<!-- 									전공필수 -->
<%-- 								</c:when> --%>
<%-- 								<c:when test="${lectureVO.lectureApplyVO.lecaType eq 1}"> --%>
<!-- 									전공선택 -->
<%-- 								</c:when> --%>
<%-- 								<c:when test="${lectureVO.lectureApplyVO.lecaType eq 2}"> --%>
<!-- 									교양필수 -->
<%-- 								</c:when> --%>
<%-- 								<c:when test="${lectureVO.lectureApplyVO.lecaType eq 3}"> --%>
<!-- 									교양선택 -->
<%-- 								</c:when> --%>
<%-- 							</c:choose> --%>
<!-- 						</td> -->
<%-- 						<td>${lectureVO.lectureApplyVO.lecaCrd}</td> --%>
<%-- 						<td>${lectureVO.lectureScheduleVO.lecDay}   ${lectureVO.lectureApplyVO.lecaStdt} ~ ${lectureVO.lectureApplyVO.lecaEddt}</td> --%>
<!-- 						<td> -->
<%-- 							<c:forEach items="${buldCommonList}" var="buildingVO"> --%>
<%-- 								<c:if test="${fn:substring(lectureVO.lectureApplyVO.roomCd, 0,6) eq buildingVO.comdCd}"> --%>
<%-- 									${buildingVO.comdNm} ${fn:substring(lectureVO.lectureApplyVO.roomCd, 6,10)}호 --%>
<%-- 								</c:if> --%>
<%-- 							</c:forEach> --%>
<!-- 						</td> -->
<%-- 						<td>${lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td> --%>
<!-- 						<td> -->
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${lectureVO.lectureApplyVO.lecaEva eq 0}">상대평가</c:when> --%>
<%-- 								<c:otherwise>절대평가</c:otherwise> --%>
<%-- 							</c:choose> --%>
<!-- 						</td> -->
<!-- 						<td><button class="btn-two mini orange">바로가기</button></td> -->
<!-- 					</tr>					 -->
<%-- 				</c:if> --%>
<%-- 			</c:forEach> --%>
<%-- 		</c:forEach> --%>
		
	</table>
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
				<tr style="width: 100%;">
					<th style="width: 10%;" class="addTimeTable">시간표조회</th>
					<th style="width: 10%;">관심강의</th>
					<th style="width: 20%;">과목명</th>
					<th style="width: 10%;">학점</th>
					<th style="width: 50%;">강의시간</th>
				</tr>
				<c:forEach items="${lectureList}" var="lectureVO">
					<c:forEach items="${lectureVO.wishLectureList}" var="wishLectureVO">
						<c:if test="${userVO.userCd eq wishLectureVO.stuCd}">
							<tr class="${lectureVO.lecCd}" style="width: 100%;">
								<td style="width: 10%;"><input style="width: 100%;" type="checkbox" class="addTimeTable" data-lec-cd="${lectureVO.lecCd}"></td>
								<td style="width: 10%;"><button class="btn-two mini dark removeWishBtn2" data-lec-cd="${lectureVO.lecCd}">삭제</button></td>
								<td style="width: 20%;">${lectureVO.lectureApplyVO.lecaNm}</td>
								<td style="width: 10%;">${lectureVO.lectureApplyVO.lecaCrd}</td>
								<td style="width: 50%;">${lectureVO.lectureApplyVO.lecaSche}   ${lectureVO.lectureApplyVO.lecaStdt} ~ ${lectureVO.lectureApplyVO.lecaEddt}</td>
							</tr>					
						</c:if>
					</c:forEach>
				</c:forEach>
				<c:if test="${fn:length(wishLectureList) eq 0}">
					<tr id="noWishLecture"><td style="text-align: center;" colspan="5">관심강의가 없습니다.</td></tr>
				</c:if>
				<tr>
					<th></th>
					<td>신청가능학점</td>
					<td id="standCredit">${creditVO.stdCredit - sum}</td>
					<td>신청학점</td>
					<td id="currentCredit">0</td>
				</tr>
			</table>
		</div>
	</div>
	
	
</div>

<script>
	
	$(function() {
		getWishLectureList();
		$(document).on('click','.syllabusButton', function(){
			$("[id^=lectureListBody]").each(function (index){
				var lecaNm = $(this).find('.lecaNM').val();
				console.log("@@", lecaNm);
				
				
			});
			
			
			
		});
		
		
	});
	
	const timeTableColor = ["#F2E8E8", "#FFE9E9", "#F9E9D9", "#FFF8CC", "#F0F9CC", "#DAEFE6", "#DCEEF0"];
	const jsonLecture = JSON.parse($("#jsonLecture").val());
	console.log(jsonLecture);
	const jsonUser = JSON.parse($("#jsonUser").val());
	console.log(jsonUser);
	const userCd = jsonUser.userCd;
	const jsonBuldCommonList = JSON.parse($("#jsonBuldCommonList").val());
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
	const keys = Object.keys(timeTableData);
	let wishLectureList =	"";
	
	
	// 전공, 이수구분 변경
	$(".selectClass").on("change", function() {
		const keyword = $(this).val();
		$.ajax({
			url: "/student/enrolment/changeMenu?keyword="+keyword,
			dataType: "json",
			type: "get",
			success: res => {
				$("#lectureListBody").empty();
				console.log("이수구분변경 res=>", res);
				console.log(jsonLecture);
				res.forEach(lecture => {
					let txt = "";
					txt += `
						<tr id="lectureListLecCd\${lecture.lecCd}">
							<td>`
					let flag = false;
					jsonUser.studentVO.wishLectureList.forEach(wishLecture => {
						if (lecture.lecCd == wishLecture.lecCd) {
							txt += `<button class="btn-two mini dark removeWishBtn" data-lec-cd="\${lecture.lecCd}">삭제</button>`
							flag = true;
						};
					});
					if (flag == false) txt += `<button class="btn-two mini green addWishBtn" data-lec-cd="\${lecture.lecCd}">등록</button>`
					txt += `
						</td>
						<td>\${lecture.lectureApplyVO.departmentVO.depNm}</td>
						<td>\${lecture.lectureApplyVO.lecaTrg}</td>
						<td>\${lecture.lectureApplyVO.lecaNm}</td>
						<td class="lecHcnt\${lecture.lecCd}">\${lecture.lecHcnt}</td>
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
							<td>절대평가</td>
						`
					}
					txt += `
						<td><button class="btn-two mini sky syllabusButton" href="/resources/upload/게임 프로그래밍 강의계획서.pdf" download="게임 프로그래밍 강의계획서">다운로드</button></td>
						</tr>
					`
					$("#lectureListBody").append(txt);
				})
				
			}
		})
		
	})
	
	function doTimeRangesOverlap(start1, end1, start2, end2) {
		return !(end1 <= start2 || start1 >= end2);
	}
	
	function getWishLectureList() {
		$.ajax({
			url: "/student/enrolment/getWishLectureList?stuCd="+jsonUser.userCd,
			type: "get",
			dataType: "json",
			success: res => {
				wishLectureList = res;
			}
		})
	}
	
	function renderTimeTable() {
		const enrolmentList = jsonUser.studentVO.enrolmentList;
		console.log(enrolmentList);
		
		console.log("renderTimeTable 시작", timeTableData);
		
		if (enrolmentList.length == 0) {
			return;
		}
		
		$("#timeTableBody").empty();
		
		let newNode = "";
		
		enrolmentList.forEach(enrolment => {
			
			const dayArr = enrolment.lectureVO.lectureApplyVO.lecaSche.split("/");
			const startTime = enrolment.lectureVO.lectureApplyVO.lecaStdt.split(":")[0];
			const endTime = enrolment.lectureVO.lectureApplyVO.lecaEddt.split(":")[0];
			const lectureTime = endTime - startTime;
			const lecNm = enrolment.lectureVO.lectureApplyVO.lecaNm;
			const roomCd = enrolment.lectureVO.lectureApplyVO.roomCd;
			
			for(const key of keys) {
				// 요일 추가
				if (key == startTime) {
					dayArr.forEach(day => {
						timeTableData[key].push({
							day: day,
							lecNm: lecNm,
							roomCd: roomCd,
							startTime: Number(startTime),
							endTime: Number(endTime),
						})
					})
					// 시간 추가
					for(let i = 1; i < lectureTime; i++) {
						dayArr.forEach(day => {
							const keyss = Number(key) + i;
							timeTableData[String(keyss)].push({
								day:day, 
								lecNm:lecNm,
								roomCd:roomCd,
								startTime: Number(startTime),
								endTime: Number(endTime),
							});
						})
					}
				}
				
				// 건물, 호수 추가
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
				
			}
		})
		
		for(const key of keys) {
			if (`\${key}` == 9) {
				newNode = $(`<tr class="thead thead1" id="\${key}" style="height: 70px;"><td class="tTime">0\${key}:00 - 10:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td></tr>`);
			} else {
				let endTime = Number(`\${key}`) + 1;
				newNode = $(`<tr class="thead thead1" id="\${key}"  style="height: 70px;"><td class="tTime">\${key}:00 - \${endTime}:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td></tr>`);
			}
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
		changeColor();
		mergeCells();
		console.log(timeTableData);
	}
	
	renderTimeTable();
	
	$(document).on("click", ".insertEnrolBtn", function() {
		
		const lecCd = $(this).data("lecCd");
		
		console.log(lecCd, userCd);
		const node = $("#lectureListLecCd"+lecCd).children()[0];
		let credit = 0;
		let lecaYear = 0;
		let lecaSem = 0;
		let depFee = 0;
		jsonLecture.forEach(lecture => {
			if (lecture.lecCd == lecCd) {
				credit = lecture.lectureApplyVO.lecaCrd;
				lecaYear = lecture.lectureApplyVO.lecaYear;
				lecaSem = lecture.lectureApplyVO.lecaSem;
				depFee = lecture.lectureApplyVO.departmentVO.depFee
			}
		})
		
		$.ajax({
			url: "/student/enrolment/insertEnrolment",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({
				lecCd:lecCd, 
				stuCd:userCd,
				lectureVO: {
					lectureApplyVO: {
						lecaYear: lecaYear,
						lecaSem: lecaSem,
						departmentVO: {
							depFee: depFee
						}
					}
				}
			}),
			type: "post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: res => {
				console.log(res);
				if (res >= 4) {
					alertSuccess("수강신청을 완료했습니다.")
					$(`tr[class=\${lecCd}]`).remove();
					$(node).html(`<button class="btn-two mini orange btnCancelEnrolment" data-lec-cd="\${lecCd}">신청취소</button>`)
					const preVal = Number($("#currentCredit").text());
					$("#currentCredit").text(preVal - credit);
					const val = Number($("#standCredit").text());
					$("#standCredit").text(val - credit);
					const val2 = Number($("#topStandCredit").val());
					$("#topStandCredit").val(val2 - credit);
					sendEnrolmentToServer("lecCd="+lecCd);
				} else {
					Swal.fire({
						html: "수강신청 가능 인원을<br>초과하였습니다.",
						icon: "warning",
						width: 300,
						confirmButtonColor: "#3085d6",
						confirmButtonText: "확인",
					}).then(result => {
						if (result.isConfirmed) {
							location.reload();
						}
					});
					$(`tr[class=\${lecCd}]`).remove();
					if ($("#enrolTable tbody").children().length == 2 || $("#enrolTable tbody").children().length == 1) $("#enrolTable tbody").append(`<tr id="noWishLectureRow"><td colspan="13" style="text-align: center;">관심강의를 먼저 추가해주세요.</td></tr>`);
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
								getWishLectureList();
								$(`.removeWishBtn[data-lec-cd=\${lecCd}]`).parent().html(`<button class="btn-two mini green addWishBtn" data-lec-cd="\${lecCd}">등록</button>`)
								if ($("#subTable tbody tr").length == 2) {
									let txt = `<tr id="noWishLecture"><td style="text-align: center;" colspan="5">관심강의가 없습니다.</td></tr>`
									$("#subTable tr:first").after(txt);
								};
							}
						}
					})
				}
			}
		})
		
		
	})
	
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
						<tr class="\${lecture.lecCd}">
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
						<td class="lecHcnt\${lecture.lecCd}">\${lecture.lecHcnt}</td>
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
							<td>절대평가</td>
						`
					}
					txt += `
						<td><button class="btn-two mini sky syllabusButton" href="/resources/upload/게임 프로그래밍 강의계획서.pdf" download="게임 프로그래밍 강의계획서">다운로드</button></td>
						</tr>
					`
					$("#lectureListBody").append(txt);
				})
				
				
			}
		})
		
	});
	
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
				if (res == 1){
					alertSuccess("관심강의 추가 완료.");
					getWishLectureList();
					$(this).parent().html(`<button class="btn-two mini dark removeWishBtn" data-lec-cd="\${lecCd}">삭제</button>`);
					
					let txt = "";
					jsonLecture.forEach(lecture => {
						if (lecture.lecCd == lecCd) {
							txt += `
							<tr class="\${lecCd}">
								<td><input type="checkbox" class="addTimeTable" data-lec-cd="\${lecture.lecCd}"></td>
								<td><button class="btn-two mini dark removeWishBtn2" data-lec-cd="\${lecture.lecCd}">삭제</button></td>
								<td>\${lecture.lectureApplyVO.lecaNm}</td>
								<td>\${lecture.lectureApplyVO.lecaCrd}</td>
								<td>\${lecture.lectureApplyVO.lecaSche}   \${lecture.lectureApplyVO.lecaStdt} ~ \${lecture.lectureApplyVO.lecaEddt}</td>
							</tr>
							`
						}
					})
					$("#noWishLecture").remove();
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
					getWishLectureList();
					$(this).parent().html(`<button class="btn-two mini green addWishBtn" data-lec-cd="\${lecCd}">등록</button>`);
					$(`tr[class=\${lecCd}]`).remove();
					if ($("#subTable tbody tr").length == 2) {
						let txt = `<tr id="noWishLecture"><td style="text-align: center;" colspan="5">관심강의가 없습니다.</td></tr>`
						$("#subTable tr:first").after(txt);
					};
				}
			}
		})
		
	})
	
	$(document).on("click", ".btnCancelEnrolment", function() {
		
		const lecCd = $(this).data("lecCd");
		
		$.ajax({
			url: "/student/enrolment/cancelEnrolment",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({lecCd: lecCd, stuCd: userCd}),
			type: "post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: res => {
				if (res > 2) {
					alertSuccess("수강신청이 취소되었습니다.");
					$(this).parent().html(`<button class="btn-two mini green addWishBtn" data-lec-cd="\${lecCd}">등록</button>`);
					sendEnrolmentToServer("lecCd="+lecCd);
				}
			}
		})
		
		
		
	})
	
	$(document).on("click", ".removeWishBtn2", function() {
		
		const lecCd = $(this).data("lecCd");
		
		const checkbox = $(this).parent().prev().children()[0];
		if ($(checkbox).is(":checked")) {
			alertError("체크를 해제 후 다시 시도해주세요.")
			return;
		}
		
		
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
					getWishLectureList();
					// $(this).parent().parent().remove();
					$(`tr[class=\${lecCd}]`).remove();
					$(`button[data-lec-cd=\${lecCd}]`).parent().html(`
					<button class="btn-two mini green addWishBtn" data-lec-cd="\${lecCd}">등록</button>
					`)
					if ($("#subTable tbody tr").length == 2) {
						let txt = `<tr id="noWishLecture"><td style="text-align: center;" colspan="5">관심강의가 없습니다.</td></tr>`
						$("#subTable tr:first").after(txt);
					}
				}
			}
		})
	})
	
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
					newNode = $(`<tr class="thead" id="\${key}" style="height: 70px;"><td class="tTime">0\${key}:00 - 10:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td></tr>`);
				} else {
					let endTime = Number(`\${key}`) + 1;
					newNode = $(`<tr class="thead" id="\${key}" style="height: 70px;"><td class="tTime">\${key}:00 - \${endTime}:00</td><td class="monday"></td><td class="tuesday"></td><td class="wednesday"></td><td class="thursday"></td><td class="friday"></td></tr>`);
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
			let txt = "";
			jsonLecture.forEach(lecture => {
				if (lecture.lecCd == lecCd) {
					txt += `
						<tr class="\${lecCd}" style="width:100%;">
							<td style="width: 8%; text-align: center;">`
					txt += `<button class="btn-two mini sky insertEnrolBtn" data-lec-cd="\${lecture.lecCd}">신청</button>`
					txt += `
						</td>
						<td style="width: 8%;">\${lecture.lectureApplyVO.departmentVO.depNm}</td>
						<td style="width: 5%; text-align: center;">\${lecture.lectureApplyVO.lecaTrg}</td>
						<td style="width: 10%;">\${lecture.lectureApplyVO.lecaNm}</td>
						<td style="width: 5%; text-align: center;" class="lecHcnt\${lecture.lecCd}">\${lecture.lecHcnt}</td>
						<td style="width: 5%; text-align: center;">\${lecture.lectureApplyVO.lecaCap}</td>`
					if (lecture.lectureApplyVO.lecaType == 0) {
						txt += `<td style="width: 10%; text-align: center;">전공필수</td>`
					} else if (lecture.lectureApplyVO.lecaType == 1) {
						txt += `<td style="width: 10%; text-align: center;">전공선택</td>`
					} else if (lecture.lectureApplyVO.lecaType == 2) {
						txt += `<td style="width: 10%; text-align: center;">교양필수</td>`
					} else if (lecture.lectureApplyVO.lecaType == 3) {
						txt += `<td style="width: 10%; text-align: center;">교양선택</td>`
					}
					txt += `
						<td style="width: 5%; text-align: center;">\${lecture.lectureApplyVO.lecaCrd}</td>
						<td style="width: 15%;">\${lecture.lectureScheduleVO.lecDay}  \${lecture.lectureApplyVO.lecaStdt} ~ \${lecture.lectureApplyVO.lecaEddt}</td>`
					jsonBuldCommonList.forEach(building => {
						const buildCd = lecture.lectureApplyVO.roomCd.substr(0,6);
						const roomNo = lecture.lectureApplyVO.roomCd.substr(6,10);
						if (buildCd == building.comdCd) txt += `<td style="text-align: center; width: 10%;">\${building.comdNm} \${roomNo}호</td>`
					});
					if (lecture.lectureApplyVO.lecaEva == 0) {
						txt += `
							<td style="width: 5%; text-align: center;">\${lecture.lectureApplyVO.professorVO.userVO.userNm}</td>
							<td style="width: 9%; text-align: center;">상대평가</td>
						`
					} else {
						txt += `
							<td style="width: 5%; text-align: center;">\${lecture.lectureApplyVO.professorVO.userVO.userNm}</td>
							<td style="width: 9%; text-align: center;">절대평가</td>
						`
					}
					txt += `
						<td style="width: 5% text-align: center;"><button class="btn-two mini sky syllabusButton" href="/resources/upload/게임 프로그래밍 강의계획서.pdf" download="게임 프로그래밍 강의계획서">다운로드</button></td>
						</tr>
					`
				}
			})
			$("#noWishLectureRow").remove();
			$("#enrolTable tr:first").after(txt);
			
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
					console.log($("#enrolTable tbody").children().length);	
					if ($("#enrolTable tbody").children().length == 2) $("#enrolTable tbody").append(`<tr id="noWishLectureRow"><td colspan="13" style="text-align: center;">관심강의를 먼저 추가해주세요.</td></tr>`);
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
			
			$(`#enrolTable tbody tr[class=\${lecCd}]`).remove();
			const preVal = Number($("#currentCredit").text());
			$("#currentCredit").text(preVal - credit);
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
<!-- <script src="/resources/js/enrolmentNotification.js"></script> -->