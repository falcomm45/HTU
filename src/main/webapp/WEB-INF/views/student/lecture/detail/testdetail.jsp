<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.testWrap {
		background-color: #ffffff;
	    border-radius: 15px;
    	box-shadow: 0 0 15px #bcbfc5ed;
    	margin: 30px;
    	padding: 50px;
	}
	.testHeader {
		font-size: 20px;
	    padding: 20px 0 13px 0;
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
	    padding: 5px 0;
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
	    margin: 10px;
	}
	.questionInputText {
		border: 1px solid #dadada;
		font-size: 14px;
	    width: 95%;
	    padding: 7px;
	}
	.questionBody {
		padding: 15px 35px;
	}
	input {
		font-size: 14px;
	}
	input:focus {
		outline: none;
	}
	.questionInputText:focus {
		outline-color: #333333;
	}
	.minusQuestion {
		margin: 0 25px;
	}
	.btnbar {
		display: flex;
    	justify-content: flex-end;
    	margin-top: 20px;
	}
	.testWrap a:hover{color:#ffffff!important;}
</style>
<div class="testWrap">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">강의목록</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">${lectureNm}</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">시험</span>
	</div>
	<form id="frm" action="/student/test/testApply?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<input name="lecCd" value="${param.lecCd}" hidden="hidden" />
		<input name="testCd" value="${testVO.testCd}" hidden="hidden" />
		<div class="testHeader">${testVO.testNm}
			<div>
				<label for="Timer">남은 시간 :</label>
				<input id="Timer" type="text" value="" style="font-size: 20px; vertical-align: middle; width: 60px;" readonly/>
			</div>
		</div>
		<div class="tc testCon">
			<input id="testCon" value="${testVO.testCon}" style="height: 100%; width: 100%; border: none; " />
		</div>
		<div class="testBody">
			<div class="testQuestion">
				<c:forEach var="tqVO" items="${tqVOList}" varStatus="stat">
					<input name="testDetailVOList[${stat.index}].teqCd" value="${tqVO.teqCd}" hidden="hidden" />
					<input name="testQuestionVOList[${stat.index}].teqCd" value="${tqVO.teqCd}" hidden="hidden" />
					<input name="testQuestionVOList[${stat.index}].teqAnswer" value="${tqVO.teqAnswer}" hidden="hidden" />
					<input name="testQuestionVOList[${stat.index}].teqAllot" value="${tqVO.teqAllot}" hidden="hidden" />
					<div class="testNo">
						<div class="questionHeader">
							<input class="questionNo" name="teqNo" value="${tqVO.teqNo}." readonly="readonly" />
							<input type="text" value="${tqVO.teqCon} (${tqVO.teqAllot}점)" style="width: 95%; font-size: 14px; padding: 10px;" readonly="readonly"/>
						</div>
						<div class="questionBody">
							<c:if test="${!empty tqVO.teqOp1}">
								<label for="${stat.index}"><input class="questionInput" type="radio" id="${stat.index}" name="testDetailVOList[${stat.index}].tedAnswer" value="1" />${tqVOList[stat.index].teqOp1}</label><br>
							</c:if>
							<c:if test="${!empty tqVO.teqOp2}">
								<label for="${stat.index}"><input class="questionInput" type="radio" id="${stat.index}" name="testDetailVOList[${stat.index}].tedAnswer" value="2" />${tqVOList[stat.index].teqOp2}</label><br>
							</c:if>
							<c:if test="${!empty tqVO.teqOp3}">
								<label for="${stat.index}"><input class="questionInput" type="radio" id="${stat.index}" name="testDetailVOList[${stat.index}].tedAnswer" value="3" />${tqVOList[stat.index].teqOp3}</label><br>
							</c:if>
							<c:if test="${!empty tqVO.teqOp4}">
								<label for="${stat.index}"><input class="questionInput" type="radio" id="${stat.index}" name="testDetailVOList[${stat.index}].tedAnswer" value="4" />${tqVOList[stat.index].teqOp4}</label><br>
							</c:if>
							<c:if test="${!empty tqVO.teqOp5}">
								<label for="${stat.index}"><input class="questionInput" type="radio" id="${stat.index}" name="testDetailVOList[${stat.index}].tedAnswer" value="5" />${tqVOList[stat.index].teqOp5}</label><br>
							</c:if>
							<c:if test="${empty tqVO.teqOp1}">
								답 : <label for="${stat.index}"><input class="questionInputText" type="text" id="${stat.index}" name="testDetailVOList[${stat.index}].tedAnswer" placeholder="정답을 입력하세요." /></label>
							</c:if>
						</div>				
					</div>
				</c:forEach>
			</div>
			<div class="btnbar">
				<button type="submit" class="testBtn btn-reg sky" style="margin-right: 0px;">제출</button>
			</div>
		</div>
		<sec:csrfInput/>
	</form>
</div>
<script>
$("html").click(function(e) {   
	var container = $(".testWrap");
	if (!container.is(event.target) && !container.has(event.target).length) {
		$(".sub_menu_a").attr("href", "javascript:void(0)");
		alertError("시험 중 다른 페이지로 이동할 수 없습니다.");
	}
});
$(function(){
	
    $(".myPage_btn").off();
    $(".alarm_btn").off();
    $(".logout").off();
	$("a").removeAttr("href");
	
	
});
const Timer = document.getElementById('Timer');
let time = "${testVO.testLmt}" * 60000;
let min ="${testVO.testLmt}";
let sec = 60;


Timer.value = min + ":" + '00'; 

function TIMER(){
    PlAYTIME = setInterval(function(){
        time = time - 1000; //1초씩 줄어듦
        min = time / (60 * 1000); //초를 분으로

       if(sec > 0){ //sec=60 에서 1씩 빼서 출력
            sec = sec - 1;
            Timer.value = Math.floor(min) + ':' + sec; //실수로 계산되기 때문에 소수점 아래 버림
           
        }
        if(sec === 0){
         	// 0에서 -1을 하면 -59가 출력
            // 그래서 0이 되면 바로 sec을 60으로 돌려주고 value에는 0을 출력하도록 함
            sec = 60;
            Timer.value = Math.floor(min) + ':' + '00'
        }     
   
    }, 1000); //1초마다 
}


TIMER();
setTimeout(function(){
    clearInterval(PlAYTIME);
	alertSuccess('시험이 종료되었습니다.');
	setTimeout(() => {
	    $("#frm").submit();
	}, 2300);
    
},time);
</script>