<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.testBtn:hover, .appBtn:hover {color: #ffffff !important;}
	.testWrap {
		background-color: #ffffff;
	    border-radius: 15px;
    	padding: 40px;
    	height: 100%
	}
	.testHeader {
		font-size: 20px;
	    display: flex;
	    padding-bottom: 20px;
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
	.lecture_menu a{border:1px solid #ebebeb; box-sizing:border-bos; background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; box-sizing: border-box; border:1px solid #ffffff;}
</style>
<div style="display:flex;" class="lecture_menu">
	<a href="/professor/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a ">홈</a>
	<a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a ">공지사항</a>
    <a href="/professor/task/list?lecCd=${param.lecCd}" class="sub_menu_a">과제</a>
    <a href="/professor/test/testList?lecCd=${param.lecCd}" class="sub_menu_a effect">시험</a>
    <a href="/professor/lectureAttendance?lecCd=${param.lecCd}" class="sub_menu_a">출결관리</a>
    <a href="/professor/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
    <a href="/professor/objection/list?lecCd=${param.lecCd}" class="sub_menu_a">성적이의신청</a>
</div>
<div class="testWrap">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/list" style="font-size:12px; color:#888888;">강의실</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/detail?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">${lectureNm}</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/test/testList?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">시험</a></span>
	</div>
	<div class="testHeader" style="margin-bottom:15px;">시험<i class="fa-solid fa-circle-info" style="color: #333333; position: absolute; left: 110px;"></i>
		<div class="testBar">
			<div style="position:relative;"><a href="/professor/test/testCreate?lecCd=${param.lecCd}" class="appBtn btn-reg bur" style="position:absolute; top:15px; right:0;">등록</a></div>
		</div>
	</div>
	<div class="testBody">
		<div class="testInfo">
			<div class="testInfoHeader">
				시험 출제자 안내 사항			
			</div>
			<div class="testInfoBody">
				<p>※ 시험 문제가 유출되지 않도록 주의하시어 시험을 등록하십시오.</p><br>
				<div>
					<p>1. 시험 기간을 준수하여 시험을 등록하십시오.</p><br>
					<div class="infoList">
						<p>- 기간에 알맞게 중간고사와 기말고사를 선택하십시오.</p><br>
						<p>- 시험 일시와 제한 시간을 정확하게 입력하십시오.</p><br>
					</div>
				</div>
				<br>
				<div>
					<p>2. 문제는 객관식 혹은 주관식으로 등록하실 수 있습니다.</p><br>
					<div class="infoList">
						<p>- 답안은 최대 5개까지 입력하실 수 있습니다.</p><br>
						<p>- 주관식 문제의 경우 답안은 공백으로 등록하십시오.</p><br>
					</div>
				</div>
				<br>			  
				<div>
					<p>3. 문제의 배점을 정확히 입력하십시오.</p><br>
					<div class="infoList">
						<p>- 배점은 소수점 없이 정수로만 입력해야 하며, 총점이 100점이 되도록 문제당 배점을 적절히 부여하십시오.</p><br>
						<p>예) 배점이 3점인 경우 : 3</p><br>
					</div>
				</div>
			</div>
		</div>
		<div class="test_box">
			<table class="testTbl">
				<tr class="table_title">
					<th>NO</th>
					<th>제목</th>
					<th>시험일시</th>
					<th>제한시간</th>
					<th>등록일</th>
					<th>제출현황</th>
				</tr>
				<c:choose>
					<c:when test="${!empty testVOList}">
						<c:forEach var="test" items="${testVOList}" varStatus="stat">
							<tr>
								<td>${stat.count}</td>
								<td>
									<a class="testTitle"
									href="/professor/test/testDetail?lecCd=${test.lecCd}&testCd=${test.testCd}">${test.testNm}</a>
								</td>
								<td>
									<fmt:formatDate value="${test.testDt}" pattern="MM.dd HH:mm"/>
								</td>
								<td>${test.testLmt}분</td>
								<td>
									<fmt:formatDate value="${test.testReg}" pattern="yyyy.MM.dd"/>
								</td>
								<td>
									<a href="/professor/test/testResultList?lecCd=${test.lecCd}&testCd=${test.testCd}" class="testBtn btn-two mini sky">보기</a>
								</td>
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