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
	    padding-top: 20px;
	    font-weight: 800;
	    display: flex;
		justify-content: space-between;
		margin-bottom: 10px;
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
		<span><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">강의목록</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">${lectureNm}</span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;">시험</span>
	</div>
	<form action="/professor/test/testCreatePost?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<input name="lecCd" value="${param.lecCd}" hidden="hidden" />
		<div class="testHeader">시험 등록
<!-- 			<div class="testBar"> -->
<!-- 				<button type="submit" class="testBtn btn-reg bur">등록</button> -->
<!-- 			</div> -->
		</div>
		
		<div class="testBody">
			<div class="testContent">
				<div class="testCon1">
					<div class="tc testSelect">
						<p>시험구분</p>
						<select name="testOpt" id="testOpt" style="font-size: 14px; width: 100%; border: none;">
							<option value="1">중간고사</option>
							<option value="2">기말고사</option>
						</select>
					</div>
					<div class="tc testTitle">
						<p>시험명</p>
						<input type="text" id="testNm" name="testNm" style="width: 100%;" required="required" />
					</div>
					<div class="tc testDate">
						<p>시험일시</p>
						<input type="datetime-local" id="testDt" name="testDt" style="width: 100%;" required="required" />
					</div>
					<div class="tc testTime">
						<p>제한시간</p>
						<input type="text" id="testLmt" name="testLmt" style="width: 75%;" required="required" /> 분
					</div>
					<button type="button" id="autoBtn" class="btn-two mini gray">자동 입력</button>
				</div>
				<div class="testCon2">
					<div class="tc testCon">
						<p>내용</p>
						<textarea id="testCon" name="testCon" style="height: 100%; width: 100%; border: none; resize: none;" ></textarea>
					</div>
				</div>
			</div>		
		
			<div class="testQuestion">
				<div class="testNo">
					<div class="questionHeader">
					<c:set var="cnt" value="1" />
						<input class="questionNo" name="testQuestionVOList[0].teqNo" value="${cnt}" readonly="readonly" />
						<input type="text" id="qt" name="testQuestionVOList[0].teqCon" placeholder="문제를 입력하세요." 
						style="width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;" required="required" />
						
					</div>
					<div class="questionBody">
						<input class="questionInput" id="q1" type="text" name="testQuestionVOList[0].teqOp1" placeholder="1번 답안을 입력하세요." />
						<input class="questionInput" id="q2" type="text" name="testQuestionVOList[0].teqOp2" placeholder="2번 답안을 입력하세요." />
						<input class="questionInput" id="q3" type="text" name="testQuestionVOList[0].teqOp3" placeholder="3번 답안을 입력하세요." />
						<input class="questionInput" id="q4" type="text" name="testQuestionVOList[0].teqOp4" placeholder="4번 답안을 입력하세요." />
						<input class="questionInput" id="q5" type="text" name="testQuestionVOList[0].teqOp5" placeholder="5번 답안을 입력하세요." />
						<input class="questionInput" id="qa" type="text" name="testQuestionVOList[0].teqAnswer" placeholder="정답을 입력하세요." style="width: 80%;" required="required" />
						<input class="questionInput" id="ta" type="text" name="testQuestionVOList[0].teqAllot" placeholder="배점 입력 ex ) 3" style="width: 19.5%;" required="required" />
					</div>				
				</div>
			</div>
			<div class="btnbar">
				<a class="plusQuestion" type="button" style="display: flex; justify-content: flex-end;">
					<svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#333333" d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/></svg>
				</a>
				<a class="minusQuestion" type="button">
					<svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#333333" d="M432 256c0 17.7-14.3 32-32 32L48 288c-17.7 0-32-14.3-32-32s14.3-32 32-32l352 0c17.7 0 32 14.3 32 32z"/></svg>
				</a>
			</div>
			<div class="testBar" style="margin: 30px 0 0 1150px;">
				<button type="submit" class="testBtn btn-reg bur">등록</button>
			</div>
		</div>
		<sec:csrfInput/>
	</form>
</div>

<script>
$(function(){
	
	//현재 시간 구하기
	let dateElement = document.getElementById("testDt");
    let date = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, 16);
    dateElement.value = date;
    dateElement.setAttribute("min", date);
    
    let cntQuestion = 0;
    let cnt = 1;
    
    //시험 문제 추가
    $(".plusQuestion").on("click", function(){
    	cntQuestion++;
    	cnt++;
		let str = "<div class='testNo'><div class='questionHeader'>";
            str += "<input class='questionNo' name='testQuestionVOList["+cntQuestion+"].teqNo' value='"+cnt+"' readonly='readonly' />";
            str += "<input type='text' name='testQuestionVOList["+cntQuestion+"].teqCon' placeholder='문제를 입력하세요.'";
            str += "style='width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;' required='required' /></div>";
            str += "<div class='questionBody'>";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp1' placeholder='1번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp2' placeholder='2번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp3' placeholder='3번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp4' placeholder='4번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp5' placeholder='5번 답안을 입력하세요.' />";
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
       cnt--;
    });
    
    function autoPlusQ(){
    	cntQuestion++;
    	cnt++;
		let str = "<div class='testNo'><div class='questionHeader'>";
            str += "<input class='questionNo' name='testQuestionVOList["+cntQuestion+"].teqNo' value='"+cnt+"' readonly='readonly' />";
            str += "<input type='text' name='testQuestionVOList["+cntQuestion+"].teqCon' value='주식별자의 특징으로 가장 적절하지 않은 것은?'";
            str += "style='width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;' required='required' /></div>";
            str += "<div class='questionBody'>";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp1' placeholder='1번 답안을 입력하세요.' value='유일성 : 주식별자에 의해 엔터티내에서 모든 인스터스들을 유일하게 구분함' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp2' placeholder='2번 답안을 입력하세요.' value='최소성 : 주식별자를 구성하는 속성의 수는 유일성을 만족하는 최소의 수가 되어야 함' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp3' placeholder='3번 답안을 입력하세요.' value='불변성 : 주식별자가 한 번 특정 엔터티에 지정되면 그 식별자의 값은 변하지 않아야 함' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp4' placeholder='4번 답안을 입력하세요.' value='존재성 : 주식별자가 지정되면 데이터 값이 존재하지 않을 수 있음 (NULL 허용)' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp5' placeholder='답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAnswer' placeholder='정답을 입력하세요.' value='4' style='width: 80%;' required='required' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAllot' placeholder='배점 입력 ex ) 3' value='10' style='width: 19.5%; margin-left: 5px;' required='required' /></div></div>";
            cntQuestion++;
        	cnt++;
            str += "<div class='testNo'><div class='questionHeader'>";
            str += "<input class='questionNo' name='testQuestionVOList["+cntQuestion+"].teqNo' value='"+cnt+"' readonly='readonly' />";
            str += "<input type='text' name='testQuestionVOList["+cntQuestion+"].teqCon' value='속성의 특징으로 가장 올바른 것은?'";
            str += "style='width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;' required='required' /></div>";
            str += "<div class='questionBody'>";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp1' placeholder='1번 답안을 입력하세요.' value='엔터티는 한 개의 속성만으로 구성될 수 있다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp2' placeholder='2번 답안을 입력하세요.' value='엔터티를 설명하고 인스턴스의 구성요소가 된다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp3' placeholder='3번 답안을 입력하세요.' value='하나의 속성에는 여러개의 속성값을 가질 수 있다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp4' placeholder='4번 답안을 입력하세요.' value='속성의 특성에 따른 분류에는 PK 속성, FK 속성, 일반 속성이 있다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp5' placeholder='5번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAnswer' placeholder='정답을 입력하세요.' value='2' style='width: 80%;' required='required' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAllot' placeholder='배점 입력 ex ) 3' value='10' style='width: 19.5%; margin-left: 5px;' required='required' /></div></div>";
            cntQuestion++;
        	cnt++;
            str += "<div class='testNo'><div class='questionHeader'>";
            str += "<input class='questionNo' name='testQuestionVOList["+cntQuestion+"].teqNo' value='"+cnt+"' readonly='readonly' />";
            str += "<input type='text' name='testQuestionVOList["+cntQuestion+"].teqCon' value='TRUNCATE TABLE 명령어의 특징으로 가장 적절한 것은?'";
            str += "style='width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;' required='required' /></div>";
            str += "<div class='questionBody'>";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp1' placeholder='1번 답안을 입력하세요.' value='테이블 자체를 삭제하는 명령어로 DROP TABLE과 동일한 명령어이다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp2' placeholder='2번 답안을 입력하세요.' value='특정 로우를 선택하여 지울 수 없다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp3' placeholder='3번 답안을 입력하세요.' value='DELETE TABLE과는 다르게 TRUNCATE TABLE의 경우 정상적인 복구가 가능하다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp4' placeholder='4번 답안을 입력하세요.' value='DELETE TABLE보다 시스템 부하가 더 크다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp5' placeholder='5번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAnswer' placeholder='정답을 입력하세요.' value='2' style='width: 80%;' required='required' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAllot' placeholder='배점 입력 ex ) 3' value='10' style='width: 19.5%; margin-left: 5px;' required='required' /></div></div>";
            cntQuestion++;
        	cnt++;
            str += "<div class='testNo'><div class='questionHeader'>";
            str += "<input class='questionNo' name='testQuestionVOList["+cntQuestion+"].teqNo' value='"+cnt+"' readonly='readonly' />";
            str += "<input type='text' name='testQuestionVOList["+cntQuestion+"].teqCon' value='PLAYER 테이블에서 선수명과 팀명은 오름차순, 연봉은 내림차순으로 조회하는 SQL로 바른것은?'";
            str += "style='width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;' required='required' /></div>";
            str += "<div class='questionBody'>";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp1' placeholder='1번 답안을 입력하세요.' value='SELECT 선수명, 팀명, 연봉 FROM ORDER BY 선수명 DESC, 팀명 DESC, 연봉 ASC' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp2' placeholder='2번 답안을 입력하세요.' value='SELECT 선수명, 팀명, 연봉 FROM ORDER BY 선수명 ASC, 팀명 ASC , 연봉' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp3' placeholder='3번 답안을 입력하세요.' value='SELECT 선수명, 팀명, 연봉 FROM ORDER BY 선수명 ASC, 팀명, 3 DESC' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp4' placeholder='4번 답안을 입력하세요.' value='SELECT 선수명, 팀명, 연봉 FROM ORDER BY 선수명, 팀명, DESC 연봉' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp5' placeholder='5번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAnswer' placeholder='정답을 입력하세요.' value='3' style='width: 80%;' required='required' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAllot' placeholder='배점 입력 ex ) 3' value='10' style='width: 19.5%; margin-left: 5px;' required='required' /></div></div>";
            cntQuestion++;
        	cnt++;
            str += "<div class='testNo'><div class='questionHeader'>";
            str += "<input class='questionNo' name='testQuestionVOList["+cntQuestion+"].teqNo' value='"+cnt+"' readonly='readonly' />";
            str += "<input type='text' name='testQuestionVOList["+cntQuestion+"].teqCon' value='아래의 SQL에서 NULL을 반환하는 SQL은 어떤것인가?'";
            str += "style='width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;' required='required' /></div>";
            str += "<div class='questionBody'>";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp1' placeholder='1번 답안을 입력하세요.' value='SELECT COALESCE(NULL,'2') FROM DUAL' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp2' placeholder='2번 답안을 입력하세요.' value='SELECT NULLIF('A','A') FROM DUAL' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp3' placeholder='3번 답안을 입력하세요.' value='SELECT NVL(NULL,0) + 10 FROM DUAL' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp4' placeholder='4번 답안을 입력하세요.' value='SELECT NVL(NULL,'A') FROM DUAL' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp5' placeholder='5번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAnswer' placeholder='정답을 입력하세요.' value='2' style='width: 80%;' required='required' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAllot' placeholder='배점 입력 ex ) 3' value='10' style='width: 19.5%; margin-left: 5px;' required='required' /></div></div>";
            cntQuestion++;
        	cnt++;
            str += "<div class='testNo'><div class='questionHeader'>";
            str += "<input class='questionNo' name='testQuestionVOList["+cntQuestion+"].teqNo' value='"+cnt+"' readonly='readonly' />";
            str += "<input type='text' name='testQuestionVOList["+cntQuestion+"].teqCon' value='GROUP 함수예 대한 설명으로 가장 적절한 것은?'";
            str += "style='width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;' required='required' /></div>";
            str += "<div class='questionBody'>";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp1' placeholder='1번 답안을 입력하세요.' value='CUBE는 결합 가능한 모든 값에 대하여 다차원 집계를 생성한다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp2' placeholder='2번 답안을 입력하세요.' value='ROLLUP 은 계층구조가 평등한 관계이므로 인수의 순서가 바뀌어도 결과는 같다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp3' placeholder='3번 답안을 입력하세요.' value='ROLLUP, CUBE, GROUPING SETS 은 특정 컬럼에 대한 정렬은 가능하나 계층간 정렬은 불가능하다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp4' placeholder='4번 답안을 입력하세요.' value='ROLLUP은 CUBE에 비해 시스템에 많은 부담을 주므로 사용에 주의해야 한다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp5' placeholder='5번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAnswer' placeholder='정답을 입력하세요.' value='1' style='width: 80%;' required='required' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAllot' placeholder='배점 입력 ex ) 3' value='10' style='width: 19.5%; margin-left: 5px;' required='required' /></div></div>";
            cntQuestion++;
        	cnt++;
            str += "<div class='testNo'><div class='questionHeader'>";
            str += "<input class='questionNo' name='testQuestionVOList["+cntQuestion+"].teqNo' value='"+cnt+"' readonly='readonly' />";
            str += "<input type='text' name='testQuestionVOList["+cntQuestion+"].teqCon' value='ORDER BY의 특징으로 가장 적절하지 않은 것은?'";
            str += "style='width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;' required='required' /></div>";
            str += "<div class='questionBody'>";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp1' placeholder='1번 답안을 입력하세요.' value='ORDER BY의 기본 정렬은 내림차순이다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp2' placeholder='2번 답안을 입력하세요.' value='SELECT 구문에 사용되지 않은 컬럼도 OERDER BY 구문에서 사용할 수 있다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp3' placeholder='3번 답안을 입력하세요.' value='ORDER BY 1, COL1 과 같이 숫자와 컬럼을 혼용하여 사용할 수 있다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp4' placeholder='4번 답안을 입력하세요.' value='ORACLE은 NULL을 가장 큰 값으로 취급하여 ORDER BY 시 맨 뒤로 정렬되고 SQL SERVER는 반대로 가장 앞으로 정렬한다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp5' placeholder='5번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAnswer' placeholder='정답을 입력하세요.' value='1' style='width: 80%;' required='required' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAllot' placeholder='배점 입력 ex ) 3' value='10' style='width: 19.5%; margin-left: 5px;' required='required' /></div></div>";
            cntQuestion++;
        	cnt++;
            str += "<div class='testNo'><div class='questionHeader'>";
            str += "<input class='questionNo' name='testQuestionVOList["+cntQuestion+"].teqNo' value='"+cnt+"' readonly='readonly' />";
            str += "<input type='text' name='testQuestionVOList["+cntQuestion+"].teqCon' value='SQL 집합 연산자 INTERSECT에 대한 설명 중 올바른 것은?'";
            str += "style='width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;' required='required' /></div>";
            str += "<div class='questionBody'>";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp1' placeholder='1번 답안을 입력하세요.' value='결과의 합집합으로 중복된 행을 모두 포함한다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp2' placeholder='2번 답안을 입력하세요.' value='결과의 합집합으로 중복된 행은 하나의 행으로 표시한다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp3' placeholder='3번 답안을 입력하세요.' value='결과의 교집합으로 중복된 행을 하나의 행으로 표시한다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp4' placeholder='4번 답안을 입력하세요.' value='결과의 교집합으로 중복된 행을 모두 포함한다.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp5' placeholder='5번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAnswer' placeholder='정답을 입력하세요.' value='3' style='width: 80%;' required='required' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAllot' placeholder='배점 입력 ex ) 3' value='10' style='width: 19.5%; margin-left: 5px;' required='required' /></div></div>";
            cntQuestion++;
        	cnt++;
            str += "<div class='testNo'><div class='questionHeader'>";
            str += "<input class='questionNo' name='testQuestionVOList["+cntQuestion+"].teqNo' value='"+cnt+"' readonly='readonly' />";
            str += "<input type='text' name='testQuestionVOList["+cntQuestion+"].teqCon' value='SELECT UPPER(sqldeveloper) FROM DUAL의 결과를 적으시오.'";
            str += "style='width: 95%; border: 1px solid #dadada; font-size: 14px; padding: 10px;' required='required' /></div>";
            str += "<div class='questionBody'>";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp1' placeholder='1번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp2' placeholder='2번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp3' placeholder='3번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp4' placeholder='4번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqOp5' placeholder='5번 답안을 입력하세요.' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAnswer' placeholder='정답을 입력하세요.' value='SQLDEVELOPER' style='width: 80%;' required='required' />";
            str += "<input class='questionInput' type='text' name='testQuestionVOList["+cntQuestion+"].teqAllot' placeholder='배점 입력 ex ) 3' value='10' style='width: 19.5%; margin-left: 5px;' required='required' /></div></div>";

		$(".testQuestion").append(str);
    }
    
	//자동 입력
    $("#autoBtn").on("click", function(){
    	$("#testOpt").val("2");
    	$("#testNm").val("데이터베이스 실습 기말고사");
    	$("#testDt").val("2024-01-23T14:00");
    	$("#testLmt").val("60");
    	$("#testCon").val("데이터베이스 실습 기말고사입니다. 어렵지 않은 문제이니 최선을 다해 풀어보세요. 화이팅 !");
    	$("#qt").val("도메인의 특징으로 알맞지 않은 것은?");
    	$("#q1").val("엔터티 내에서 속성에 대한 데이터 타입과 크기를 지정한다.");
    	$("#q2").val("엔터티 내에서 속성에 대한 NOT NULL을 지정한다.");
    	$("#q3").val("엔터티 내에서 속성에 대한 Check 조건을 지정한다");
    	$("#q4").val("테이블 속성 간 FK 제약 조건을 지정한다.");
    	$("#qa").val("4");
    	$("#ta").val("10");
    	autoPlusQ();
    });
})
</script>