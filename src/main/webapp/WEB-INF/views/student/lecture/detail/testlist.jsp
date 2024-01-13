<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.testWrap {
		background-color: #ffffff;
/* 	    border-radius: 15px; */
/*     	box-shadow: 0 0 15px #bcbfc5ed; */
    	margin: 2px;
    	padding: 40px;margin-top:5px;
	}
	.testHeader {
		font-size: 20px;
	    padding-bottom: 20px;
/* 	    font-weight: 800; */
	    display: flex;
		justify-content: space-between;
	}
	.testInfo {
		background-color: #fbfbfb;
		padding: 20px;
		height: 400px;
	    margin-bottom: 20px;
	}
	.testInfoHeader {
		margin: 20px;
	}
	.testInfoBody {
		margin-left: 30px;
		font-size: 13px;
	}
	.infoList {
		padding-left: 20px;
	}
	.testTbl {
		text-align: center;
		font-size: 14px;
		width: 100%;
	}
	.test_box{width:100%;}
	.test_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.test_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.test_box tr:first-child{background-color:#EEF1F6;}
	.test_box tr:hover{background-color:#f2f3f4;}
	.test_box tr:first-child:hover{background-color:#EEF1F6;}
	.test_box tr td:nth-child(1){width:5%;}
	.test_box tr td:nth-child(2){width:30%;}
	.test_box tr td:nth-child(3){width:20%;}
	.test_box tr td:nth-child(4){width:10%;}
	.test_box tr td:nth-child(5){width:20%;}
	.test_box tr td:nth-child(5){width:15%;}
	.lecture_menu{height:30px; align-items:center;}
	.lecture_menu a{border:1px solid #eeeeee;background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; border:1px solid #ffffff;}
</style>
<sec:authentication property="principal.userVO" var="userVO" />
<div class="lecture_menu" style="display:flex;">
	<a href="/student/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a ">홈</a>
	<a href="/student/lecture/syllabus?lecCd=${param.lecCd}" class="sub_menu_a">강의계획서</a>
	<a href="/student/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a ">공지사항</a>
	<a href="/student/task/list?lecCd=${param.lecCd}" class="sub_menu_a ">과제</a>
	<a href="/student/test/testList?lecCd=${param.lecCd}" class="sub_menu_a effect">시험</a>
	<a href="/student/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
	<a href="" class="sub_menu_a" style="color: transparent; pointer-events: none;">-</a>
</div>
<div class="testWrap">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/student/lecture/list" style="font-size:12px; color:#888888;">내 강의실</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/student/lecture/detail?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">${lectureNm}</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/student/test/testList?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">시험</a></span>
	</div>
	<div class="testHeader">시험<i class="fa-solid fa-circle-info" style="color: #333333; position: absolute; left: 113px; top: 135px;"></i></div>
	<div class="testBody">
		<div class="testInfo">
			<div class="testInfoHeader">
				시험 응시자 안내 사항			
			</div>
			<div class="testInfoBody">
				<p>※ 시험 중 발생하는 부정 행위에 대한 모든 책임은 응시자에게 부여됩니다.</p><br>
				<div>
					<p>1. 시험 클릭 시 시험이 시작되므로 신중히 클릭하십시오.</p><br>
				</div>
				<div>
					<p>2. 시험 시작 시간과 제한 시간을 준수하여 시험을 응시하십시오.</p><br>
					<div class="infoList">
						<p>- 상단의 남은 시간을 확인하며 문제를 푸시는 것을 권장합니다.</p><br>
						<p>- 시간이 종료되면 시험이 자동으로 종료되며 그 전까지 작성한 답안은 저장되어 제출됩니다.</p><br>
						<p>- 이에 대해 발생하는 불이익은 학교에서 책임지지 않습니다.</p><br>
					</div>
				</div>
				<br>
				<div>
					<p>3. 문제 유형은 객관식 혹은 주관식으로 구분됩니다.</p><br>
					<div class="infoList">
						<p>- 문제의 유형에 맞게 답안을 작성하십시오.</p><br>
						<p>- 답안을 작성하지 않고 제출할 경우 해당 문제의 점수가 0점 처리 되오니 꼭 답안을 작성하시길 바랍니다.</p><br>
					</div>
				</div>
				<br>			  
				<div>
					<p>4. 부정 행위 방지를 위하여 시험 응시 이후 다른 페이지로의 이동을 제한합니다.</p><br>
				</div>
			</div>
		</div>
		<div class="test_box">
			<table class="testTbl">
				<tr class="table_title">
					<th>no</th>
					<th>제목</th>
					<th>시험일시</th>
					<th>제한시간</th>
					<th>등록일</th>
					<th>응시여부</th>
				</tr>
				<c:choose>
					<c:when test="${!empty testVOList}">
						<c:forEach var="test" items="${testVOList}" varStatus="stat">
							<tr>
								<td>${stat.count}</td>
								<c:if test = "${fn:contains(test, userVO.userCd)}">
									<td>
										<a class="testTitle"
										href="/student/test/testResult?lecCd=${test.lecCd}&testCd=${test.testCd}&stuCd=${userVO.userCd}">${test.testNm}</a>
									</td>
								</c:if>
								<c:if test = "${not fn:contains(test, userVO.userCd)}">
									<td>
										<a class="testTitle"
										href="/student/test/testDetail?lecCd=${test.lecCd}&testCd=${test.testCd}">${test.testNm}</a>
									</td>
								</c:if>
								<td>
									<fmt:formatDate value="${test.testDt}" pattern="MM.dd HH:mm"/>
								</td>
								<td>${test.testLmt}분</td>
								<td>
									<fmt:formatDate value="${test.testReg}" pattern="yyyy.MM.dd"/>
								</td>
								<c:if test = "${fn:contains(test, userVO.userCd)}">
									<td>응시</td>
								</c:if>
								<c:if test = "${not fn:contains(test, userVO.userCd)}">
									<td style="color: red;">미응시</td>
								</c:if>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="6"><div style="color: #333333; margin: 30px 0; font-size: 14px;">등록된 시험이 없습니다.</div></td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
	</div>
</div>
