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
	.input-radio:checked{background: #749fbb;}
	.testBtn:hover{color:#ffffff!important;}
</style>
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
		<input name="testCd" value="${testVO.testCd}" hidden="hidden" />
		<div class="testHeader">${testVO.testNm}
			<div>
				<label for="Timer">점수 : ${testApplyVO.teaScore} / 100</label>
			</div>
		</div>
		<div class="tc testCon">
			<input id="testCon" value="${testVO.testCon}" style="height: 100%; width: 100%; border: none; " />
		</div>
		<div class="testBody">
			<div class="testQuestion">
				<c:forEach var="tqVO" items="${testApplyVO.testQuestionVOList}" varStatus="stat">
					<div class="testNo">
						<div class="questionHeader">
							<input class="questionNo" name="teqNo" value="${tqVO.teqNo}." readonly="readonly" />
							<input type="text" value="${tqVO.teqCon} (${tqVO.teqAllot}점)" style="width: 95%; font-size: 14px; padding: 10px;" readonly="readonly"/>
						</div>
						<div class="questionBody">
							<c:if test="${!empty tqVO.teqOp1}">
								<div style='<c:if test="${tqVO.teqAnswer eq 1}">background-color: #e6ffe2;</c:if>'>
									<input class="questionInput" type="radio" value="1" 
									<c:if test="${testApplyVO.testDetailVOList[stat.index].tedAnswer eq 1}">checked</c:if>
									onclick="return(false);" />${tqVO.teqOp1}<br>
								</div>
							</c:if>
							<c:if test="${!empty tqVO.teqOp2}">
								<div style='<c:if test="${tqVO.teqAnswer eq 2}">background-color: #e6ffe2;</c:if>'>
									<input class="questionInput" type="radio" value="2"
									<c:if test="${testApplyVO.testDetailVOList[stat.index].tedAnswer eq 2}">checked</c:if>
									 onclick="return(false);" />${tqVO.teqOp2}<br>
								</div>
							</c:if>
							<c:if test="${!empty tqVO.teqOp3}">
								<div style='<c:if test="${tqVO.teqAnswer eq 3}">background-color: #e6ffe2;</c:if>'>
									<input class="questionInput" type="radio" value="3" 
									<c:if test="${testApplyVO.testDetailVOList[stat.index].tedAnswer eq 3}">checked</c:if>
									onclick="return(false);" />${tqVO.teqOp3}<br>
								</div>
							</c:if>
							<c:if test="${!empty tqVO.teqOp4}">
								<div style='<c:if test="${tqVO.teqAnswer eq 4}">background-color: #e6ffe2;</c:if>'>
									<input class="questionInput" type="radio" value="4" 
									<c:if test="${testApplyVO.testDetailVOList[stat.index].tedAnswer eq 4}">checked</c:if>
									onclick="return(false);" />${tqVO.teqOp4}<br>
								</div>
							</c:if>
							<c:if test="${!empty tqVO.teqOp5}">
								<div style='<c:if test="${tqVO.teqAnswer eq 5}">background-color: #e6ffe2;</c:if>'>
									<input class="questionInput" type="radio" value="5" 
									<c:if test="${testApplyVO.testDetailVOList[stat.index].tedAnswer eq 5}">checked</c:if>
									onclick="return(false);" />${tqVO.teqOp5}<br>
								</div>
							</c:if>
							<c:if test="${empty tqVO.teqOp1}">
								<p style="color: blue; padding-bottom: 15px;">정답 : ${tqVO.teqAnswer}</p>
								답 : <input class="questionInputText" type="text" value="${testApplyVO.testDetailVOList[stat.index].tedAnswer}" readonly="readonly" />
							</c:if>
						</div>				
					</div>
				</c:forEach>
			</div>
			<div class="btnbar">
				<a href="/student/test/testList?lecCd=${testVO.lecCd}" class="testBtn btn-reg sky" style="margin-right: 0px;">목록</a>
			</div>
		</div>
</div>
