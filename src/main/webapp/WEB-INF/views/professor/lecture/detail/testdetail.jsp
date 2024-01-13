<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.listBtn:hover {color: #ffffff !important;}
	.testWrap {
		background-color: #ffffff;
	    border-radius: 15px;
    	box-shadow: 0 0 15px #bcbfc5ed;
    	margin: 30px;
    	padding: 50px;
	}
	.testHeader {
		font-size: 20px;
	    padding-top: 20px;
	    font-weight: 800;
	    display: flex;
		justify-content: space-between;
	}
	.testContent {
	    background-color: #f2f4f7;
    	padding: 30px;
    	height: 300px;
	}
	.testContent p {
		margin-bottom: 10px;
	}
	.testCon1, .testCon2 {
    	display: flex;
	}
	.testCon1 {
    	margin-bottom: 15px;
	}
	.testSelect {
		width: 100px;	
	}
	.testTitle {
		width: 400px;	
	}
	.testDate {
		width: 250px;	
	}
	.testTime {
		width: 100px;	
	}
	.testCon2 {
    	height: 140px;
    	width: 100%;
	}
	.testCon {
		width: 100%;
	}
	.tc {
		margin: 0 10px;
	}
	.testQuestion {
	    margin-top: 25px;
	}
	.questionHeader {
		border-top: 1px solid #dadada;
		border-bottom: 1px solid #dadada;
	    padding: 15px 0;
	    display: flex;
    	align-items: center;
	}
	.questionNo {
   		background: none;
	    width: 30px;
	    text-align: center;
	}
	.questionNo:focus {outline:none;}
	.questionInput {
		border: 1px solid #dadada;
		font-size: 14px;
	    padding: 10px;
	    width: 100%;
	    margin: 3px 0;
	}
	.questionBody {
		padding: 15px 35px;
	}
	input {
		font-size: 14px;
	}
	input:focus, textarea:focus {
		outline: none;
	}
	.minusQuestion {
		margin: 0 25px;
	}
	.btnbar {
		display: flex;
    	justify-content: flex-end;
	}
</style>
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
	<form action="/professor/test/testUpdate?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<input name="lecCd" value="${param.lecCd}" hidden="hidden" />
		<input name="testCd" value="${testVO.testCd}" hidden="hidden" />
		<div class="testHeader">시험 상세
			<div class="testBar">
				<button type="submit" class="testBtn btn-two mini green" id="modBtn" style="margin-right: 0px;">수정</button>
				<a type="button" href="/professor/test/testList?lecCd=${param.lecCd}" class="listBtn btn-two mini sky">목록</a>
			</div>
		</div>
		
		<div class="testBody">
			<div class="testContent">
				<div class="testCon1">
					<div class="tc testSelect">
						<p>시험구분</p>
						<select name="testOpt" style="font-size: 14px; width: 100%; border: none;">
							<c:if test="${testVO.testOpt eq 1}">
								<option value="1" selected="selected">중간고사</option>
								<option value="2">기말고사</option>
							</c:if>
							<c:if test="${testVO.testOpt eq 2}">
								<option value="1">중간고사</option>
								<option value="2"  selected="selected">기말고사</option>
							</c:if>
						</select>
					</div>
					<div class="tc testTitle">
						<p>시험명</p>
						<input type="text" id="testNm" name="testNm" value="${testVO.testNm}" style="width: 100%;" />
					</div>
					<div class="tc testDate">
						<p>시험일시</p>
						<input type="datetime-local" id="testDt" name="testDt" value="${testVO.testDt}" style="width: 100%;" />
					</div>
					<div class="tc testTime">
						<p>제한시간</p>
						<input type="text" id="testLmt" name="testLmt" value="${testVO.testLmt}" style="width: 75%;" /> 분
					</div>
				</div>
				<div class="testCon2">
					<div class="tc testCon">
						<p>내용</p>
						<textarea id="testCon" name="testCon" style="height: 100%; width: 100%; border: none; resize: none;" >${testVO.testCon}</textarea>
					</div>
				</div>
			</div>		
		
			<div class="testQuestion">
				<c:forEach var="tqVO" items="${tqVOList}" varStatus="stat">
				<div class="testNo">
					<div class="questionHeader">
						<input class="questionNo" name="testQuestionVOList[${stat.index}].teqNo" value="${stat.count}" readonly="readonly" />
						<input type="text" name="testQuestionVOList[${stat.index}].teqCon" value="${tqVOList[stat.index].teqCon}" placeholder="문제를 입력하세요." 
						style="width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;" required="required" />
						
					</div>
					<div class="questionBody">
						<input class="questionInput" type="text" name="testQuestionVOList[${stat.index}].teqOp1" value="${tqVOList[stat.index].teqOp1}" placeholder="답안을 입력하세요." />
						<input class="questionInput" type="text" name="testQuestionVOList[${stat.index}].teqOp2" value="${tqVOList[stat.index].teqOp2}" placeholder="답안을 입력하세요." />
						<input class="questionInput" type="text" name="testQuestionVOList[${stat.index}].teqOp3" value="${tqVOList[stat.index].teqOp3}" placeholder="답안을 입력하세요." />
						<input class="questionInput" type="text" name="testQuestionVOList[${stat.index}].teqOp4" value="${tqVOList[stat.index].teqOp4}" placeholder="답안을 입력하세요." />
						<input class="questionInput" type="text" name="testQuestionVOList[${stat.index}].teqOp5" value="${tqVOList[stat.index].teqOp5}" placeholder="답안을 입력하세요." />
						<input class="questionInput" type="text" name="testQuestionVOList[${stat.index}].teqAnswer" value="${tqVOList[stat.index].teqAnswer}" placeholder="정답을 입력하세요." style="width: 80%;" required="required" />
						<input class="questionInput" type="text" name="testQuestionVOList[${stat.index}].teqAllot" value="${tqVOList[stat.index].teqAllot}" placeholder="배점 입력 ex ) 3" style="width: 19.5%;" required="required" />
					</div>				
				</div>
				</c:forEach>
			</div>
			<div class="btnbar">
				<a class="plusQuestion" type="button" style="display: flex; justify-content: flex-end;">
					<svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#333333" d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/></svg>
				</a>
				<a class="minusQuestion" type="button">
					<svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#333333" d="M432 256c0 17.7-14.3 32-32 32L48 288c-17.7 0-32-14.3-32-32s14.3-32 32-32l352 0c17.7 0 32 14.3 32 32z"/></svg>
				</a>
			</div>
		</div>
		<sec:csrfInput/>
	</form>
</div>
<script>
$(function(){
	
	//현재 날짜
	let testDt = "${testVO.testDt}";
	console.log("testDt : ", testDt);
	
	let today = new Date();
	console.log("today : ", today);
	
// 	var year = testDt.getFullYear();
// 	var month = ('0' + (today.getMonth() + 1)).slice(-2);
// 	var day = ('0' + today.getDate()).slice(-2);
// 	let hours = today.getHours();
// 	let minutes = today.getMinutes();
// 	let seconds = today.getSeconds();
// 	let milliseconds = today.getMilliseconds(); /

// 	var dateString = year + '-' + month  + '-' + day;

// 	console.log(dateString);
	
// 	if(today >= "${testVO.testDt}") {
// 		console.log("???");
// 		$("#modBtn").hide();
// 	}

	//현재 시간 구하기
	let dateElement = document.getElementById("testDt");
    let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 16);
    dateElement.value = date;
    dateElement.setAttribute("min", date);
    console.log("date : ", date);
    
    let cntQuestion = "${tqVOList.size()}";
    console.log("cntQuestion : ", cntQuestion);
	if(cntQuestion > 0){
		cntQuestion--;
	}
	
    let cnt = "${tqVOList.size() + 1}";
    console.log("cnt : ", cnt);
	if(cnt > 0){
		cnt--;
	}
	
    //시험 문제 추가
    $(".plusQuestion").on("click", function(){
    	cntQuestion++;
    	cnt++;
		let str = "<div class='testNo'><div class='questionHeader'>";
            str += "<input class='questionNo' name='testQuestionVOList["+cntQuestion+"].teqNo' value='"+cnt+"' readonly='readonly' />";
            str += "<input type='text' name='testQuestionVOList["+cntQuestion+"].teqCon' placeholder='문제를 입력하세요.'";
            str += "style='width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;' required='required' /></div>";
            str += "<div class='questionBody'>";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp1' placeholder='답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp2' placeholder='답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp3' placeholder='답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp4' placeholder='답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp5' placeholder='답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAnswer' placeholder='정답을 입력하세요.' style='width: 80%;' required='required' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAllot' placeholder='배점 입력 ex ) 3' style='width: 19.5%; margin-left: 5px;' required='required' /></div></div>";

		$(".testQuestion").append(str);
    });
    
    //마지막 시험 문제 삭제
    $(".minusQuestion").on("click",function(){
       //.last() : 요소의 마지막 노드 반환
       //.remove() : 지정한 요소 포함, 하위 요소 모두 제거
       if(cntQuestion<1){
          alert("한 개 이상의 문제가 필요합니다.");
          return;
       }
       $(".testQuestion").children().last().remove();
       cntQuestion--;
    });
    
    //자동 입력
    $("#autoBtn").on("click", function(){
    	$("#testNm").val($(".sub_title").text() + " 중간고사");
    	$("#testDt").val("2024-01-10T10:00");
    	$("#testLmt").val("60");
    	$("#testCon").val($(".sub_title").text() + " 중간고사입니다. 어렵지 않은 문제이니 최선을 다해 풀어보세요. 화이팅 !");
    	$("#qt").val("1번 문제 테스트");
    	$("#q1").val("1번 답안");
    	$("#q2").val("2번 답안");
    	$("#q3").val("3번 답안");
    	$("#q4").val("4번 답안");
    	$("#q5").val("5번 답안");
    	$("#qa").val("3");
    	$("#ta").val("5");
    });
})
</script>