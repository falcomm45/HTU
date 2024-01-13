<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.crewDetail {width: 100%; height: 100%;}
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
	.crewInfoTbl {width: 100%; height: 70%; font-size: 14px;}
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
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
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
</style>
<sec:authentication property="principal.userVO" var="userVO"/>
<input id="crCd" value="${crewVO.crCd}" hidden />
<div class="crewDetail">
	<div class="crewHeader">
		${crewVO.crNm}
		<c:if test="${crewVO.crLeader eq userVO.userCd}">
			<button type="button" class="btn-reg sky" id="appBtn" style="width: 120px;">가입 신청 확인</button>
		</c:if>
		<c:if test="${crewVO.crLeader ne userVO.userCd}">
			<c:choose>
			    <c:when test="${crVO ne null and not empty crVO}">
	                <button type="button" id="btnQuit" class="btn-reg gray">탈퇴</button>
			    </c:when>
			    <c:otherwise>
	            	<button type="button" id="btnApply" data-stu-cd="${crewVO.stuCd}" class="btn-reg green">가입</button>
			    </c:otherwise>
			</c:choose>
		</c:if>
	</div>
	<div class="crewIndex">
		<div class="crewDivbox">
			<div class="crewDiv1">
				<div class="crewInfo">
					<div class="crewInfoHeader">
						<p>동아리 소개</p>
					</div>
					<table class="crewInfoTbl">
						<tr>
							<td class="crewInfoTbl-title">동아리 목적</td>
							<td>${crewVO.crCon}</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">동아리실</td>
							<td>학생회관 ${crewVO.roomNm}</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">인원</td>
							<td>${crewVO.crPs}</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">회장</td>
							<td>${crewVO.ldrNm}</td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">전화번호</td>
							<td>${crewVO.userVO.userTel}</td>
						</tr>
					</table>
					<a type="button" style="padding-right: 20px; margin: 10px 0;">Instagram <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#333333" d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"/></svg></a>
					<a type="button" style="margin: 10px 0;">Youtube <svg xmlns="http://www.w3.org/2000/svg" height="20" width="20" viewBox="0 0 576 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#333333" d="M549.7 124.1c-6.3-23.7-24.8-42.3-48.3-48.6C458.8 64 288 64 288 64S117.2 64 74.6 75.5c-23.5 6.3-42 24.9-48.3 48.6-11.4 42.9-11.4 132.3-11.4 132.3s0 89.4 11.4 132.3c6.3 23.7 24.8 41.5 48.3 47.8C117.2 448 288 448 288 448s170.8 0 213.4-11.5c23.5-6.3 42-24.2 48.3-47.8 11.4-42.9 11.4-132.3 11.4-132.3s0-89.4-11.4-132.3zm-317.5 213.5V175.2l142.7 81.2-142.7 81.2z"/></svg></a>
					<c:if test="${crewVO.crLeader eq userVO.userCd}">
						<div>
							<a href="/student/crew/crewUpdate?crCd=${crewVO.crCd}">
								<img class="crewModBtn" src="/resources/images/gear.png" alt="crewManage" />
							</a>
						</div>
					</c:if>
				</div>
			</div>
			<div class="crew_box">
				<div class="table_topic">동아리원</div>
				<div class="crTb">
					<table>
						<tr class="table_title">
							<th>no</th>
							<th>학번</th>
							<th>학과</th>
							<th>이름</th>
						</tr>
						<c:forEach var="crewPerson" items="${crewPersonnelList}" varStatus="stat">
							<tr>
								<td>${stat.count}</td>
								<td>${crewPerson.stuCd}</td>
								<td>${crewPerson.depNm}</td>
								<td>${crewPerson.stuNm}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
			
		<div class="crewContent">
			<div class="crewContentTab">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">HOME</li>
					<li class="tab-link" data-tab="tab-2">동아리 활동</li>
				</ul>
				
				<div id="tab-1" class="tab-content current" style="text-align: center;">
					<div class="crewfiles">
						<c:if test="${empty crewVO.filesDetailVOList}">
							<div style="text-align: center; padding-top: 75px; color: #333333; font-size: 14px;">동아리 사진이 없습니다.</div>
						</c:if>
						<c:forEach var="fileDetail" items="${crewVO.filesDetailVOList}">
							<img alt="" src="/resources/upload/${fileDetail.fileSvnm}">
			    		</c:forEach>
					</div>
				</div>
				<div id="tab-2" class="tab-content">
					<div class="crewActivity">
						<div class="crewActivityHeader">
							동아리 활동
							<a type="button" id="craAddBtn"><img src="/resources/images/plus.png" style="width: 20px; height: 20px; left: 10px;"/></a>
						</div>
						<c:forEach var="actVO" items="${crewActVOList}"> 
							<div class="crewAct">
								<c:choose>
									<c:when test="${actVO.filesDetailVOList ne null and not empty actVO.filesDetailVOList}">
										<a type="button" style="font-weight: bold;" class="actBtn" data-cra-cd="${actVO.craCd}">${actVO.craCon}</a>
										<svg xmlns="http://www.w3.org/2000/svg" height="14" width="12" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#686868" d="M364.2 83.8c-24.4-24.4-64-24.4-88.4 0l-184 184c-42.1 42.1-42.1 110.3 0 152.4s110.3 42.1 152.4 0l152-152c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-152 152c-64 64-167.6 64-231.6 0s-64-167.6 0-231.6l184-184c46.3-46.3 121.3-46.3 167.6 0s46.3 121.3 0 167.6l-176 176c-28.6 28.6-75 28.6-103.6 0s-28.6-75 0-103.6l144-144c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-144 144c-6.7 6.7-6.7 17.7 0 24.4s17.7 6.7 24.4 0l176-176c24.4-24.4 24.4-64 0-88.4z"/></svg>
									</c:when>
									<c:otherwise>
										<p style="font-weight: bold;">${actVO.craCon}</p>
									</c:otherwise>
								</c:choose>
								<p>${actVO.stuNm}</p>
								<p><fmt:formatDate value="${actVO.craStdt}" pattern="yyyy년 MM월 dd일 HH시 mm분"/> - 
								<fmt:formatDate value="${actVO.craEddt}" pattern="yyyy년 MM월 dd일 HH시 mm분"/></p>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- ///////////////////////////////////////// MODAL ///////////////////////////////////////// -->	
<!-- 가입 신청 내역 모달 -->
<div class="crewmodal modal-bg"  style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
	<div class="crew_box" style="overflow: auto; position:absolute; z-index: 999; width: 600px; height: 500px; border-radius:10px; padding:30px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
		<button type="button" class="btn-two gray mini close_bt" onclick="closeModal()" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>
		<div style="padding-bottom: 20px;"> 
			<p class="joinApp">동아리 가입 신청</p>
		</div>
		<table class="joinAppTbl" style="font-size:14px; width:100%; text-align:center;">
			<tr style="height:40px; border-bottom:1px solid #ebebeb; background-color:#EEF1F6;">
				<td>학번</td>
				<td>이름</td>
				<td>가입승인</td>
			</tr>
			<c:if test="${empty approvalVOList}">
				<tr style="height: 350px; border: none;"><td colspan="3">확인하지 않은 가입 신청이 없습니다.</td></tr>
			</c:if>
			<c:forEach var="approvalVO" items="${approvalVOList}">
			    <tr style="height:40px; border-bottom:1px solid #ebebeb;">
			        <td>${approvalVO.approvalVO.userCd}</td>
			        <td>${approvalVO.stuNm}</td>
		            <td>
		            	<button type="button" class="btnApp btn-two mini sky" data-app-cd="${approvalVO.appCd}" data-user-cd="${approvalVO.approvalVO.userCd}">승인</button>
		            	<button type="button" class="btnRet btn-two mini orange" data-app-cd="${approvalVO.appCd}" data-user-cd="${approvalVO.approvalVO.userCd}">반려</button>
		            </td>
			    </tr>
			</c:forEach>
		</table>
	</div>
</div>

<!-- 동아리 활동 추가 모달 -->
<div class="cramodal modal-bg"  style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
	<div id="craModal" style="overflow: auto; position:absolute; z-index: 999; width: 600px; height: 500px; border-radius:10px; padding:30px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
		<button type="button" class="btn-two gray mini close_bt" onclick="closeModal()" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>
		<form name="frm" action="/student/crew/addCrewActivity?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
			<input name="crCd" value="${crewVO.crCd}" hidden />
			<div class="craModal-content">
				<div class="crew_form_title">
					<p>시작 시간</p>
					<div>
						<input type="datetime-local" pattern="yyyy-MM-ddTHH:mm" name="craStdt" id="craStdt" style="height: 30px;" />
					</div>
				</div>
				<div class="crew_form_title">
					<p>종료 시간</p>
					<div>
						<input type="datetime-local" pattern="yyyy-MM-ddTHH:mm" name="craEddt" id="craEddt" style="height: 30px;" />
					</div>
				</div>
				<div class="crew_form_title">
					<p>첨부파일</p>
					<input type="file" id="uploadFiles" name="uploadFiles" multiple="multiple" />
				</div>
				<div class="crew_form_title">
					<p>활동 내용</p>
					<textarea id="craCon" name="craCon" maxlength=1000 required="required" style="resize: none; height: 130px;"></textarea>
				</div>
				<div style="justify-content: right; display: flex;">
					<button type="submit" class="craBtn btn-reg bur" id="craBtn">등록</button>
				</div>
			</div>
			<sec:csrfInput />
		</form>
	</div>
</div>

<!-- 동아리 활동 상세 모달 -->
<div class="crafilemodal modal-bg"  style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
	<div id="craModal" style="overflow: auto; position:absolute; z-index: 999; width: 700px; height: 700px; border-radius:10px; padding:30px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
		<button type="button" class="btn-two gray mini close_bt" onclick="closeModal()" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>
		<div class="craModal-content">
			<div class="crew_form_title">
				<input class="craTitle" style="font-weight: bold; outline: none; border: none;" readonly="readonly">
			</div>
			<div class="crew_form_title">
				<img class="craFile">
			</div>
		</div>
	</div>
</div>
<!-- ///////////////////////////////////////// MODAL ///////////////////////////////////////// -->
<script>
$(function(){
	
	//등록 버튼 클릭 시
    $(".actBtn").on("click", function(){
    	let craCd = $(this).data("craCd");
    	console.log("craCd : " + craCd);
		
		$.ajax({
			url:"/student/crew/crewActivityDetail?craCd="+craCd,
			dataType: 'json',
 			type:"get",
 			beforeSend:function(xhr){
 				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
 			},
			success:function(res){
				console.log(res);
					$(".craTitle").val(res.craCon);
					$(".craFile").attr({ src: "/resources/upload/"+res.filesDetailVOList[0].fileSvnm });
					$(".crafilemodal").fadeIn();
			}
		});
		
		$(".close_bt").on("click", function(){
         	$(".crafilemodal").fadeOut();
        });
	});
	
	//동아리 가입 승인 내역
	$("#appBtn").on("click", function(){
		
		$(".crewModBtn").css("display", "none");
		$(".crewPersonTbl th").css("position", "static");
		$(".crewInfo").css("position", "static");

		$(".crewmodal").fadeIn();

        $(".close_bt").on("click", function(){
        	$(".crewmodal").fadeOut();
        	$(".crewPersonTbl th").css("position", "sticky");
    		$(".crewInfo").css("position", "relative");
    		$(".crewModBtn").css("display", "");
        });
        
		//승인 버튼 클릭 시
		$(".btnApp").on("click", function(){
			let appCd = $(this).data("appCd");
			let userCd = $(this).data("userCd");
			let crCd = "${crewVO.crCd}";
			
			console.log("appCd : ", appCd);
			console.log("userCd : ", userCd);
			console.log("crCd : ", crCd);
	        
			$.ajax({
				url:"/student/crew/crewJoinApp",
				data:{
					appYn : 1,
					appCd : appCd,
					userCd : userCd,
					crCd : crCd
				},
				type:"post",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success:function(res){
					$("#appModal").fadeOut();
					$(".crewPersonTbl th").css("position", "sticky");
		    		$(".crewInfo").css("position", "relative");
		    		$(".crewModBtn").css("display", "");
					alertSuccess('승인되었습니다.', '/student/crew/crewDetail?crCd='+crCd);
				}
			});
		});
		
		//반려 버튼 클릭 시
	 	$(".btnRet").on("click", function(){
			
	 		let appCd = $(this).data("appCd");
	 		let userCd = $(this).data("userCd");
	 		let crCd = "${crewVO.crCd}";
	 		
	 		console.log("appCd : ", appCd);
			console.log("userCd : ", userCd);
			console.log("crCd : ", crCd);

			Swal.fire({
	    		  text: "반려사유를 기입해주세요.",
	    		  input: "text",
	    		  inputAttributes: {
	    		    autocapitalize: "off"
	    		  },
	    		  showCancelButton: true,
	    		  confirmButtonText: "입력",
	    		  cancelButtonText: "취소",
	    		  confirmButtonColor: "#3085d6",
				  cancelButtonColor: "#555555",
	    	}).then((result) => {
	    		if(result.isConfirmed){
	    			const appRet = result.value;
	    			
					let data = {
		    			"appYn" : 2,
		    			"appCd" : appCd,
		    			"userCd" : userCd,
		    			"appRet" : appRet,
		    		}
					
	    			console.log("data : ", data);
	    			
					$.ajax({
		                 url: "/student/crew/crewReturn",
		                 data: {
		                     appYn: 2,
		                     appCd : appCd,
		                     userCd: userCd,
		                     crCd: crCd,
		                     appRet: appRet
		                 },
		                 type: "post",
		                 beforeSend: function(xhr) {
		                     xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		                 },
		                 success: function(res) {
		 		             $(".crewmodal").fadeOut();
		 		             $(".crewPersonTbl th").css("position", "sticky");
		 		    		 $(".crewInfo").css("position", "relative");
		                     alertSuccess('반려 처리되었습니다.', '/student/crew/crewDetail?crCd='+crCd);
		                 }
		             });
	    		}
	    	});
	     });
    });
	
	//탭
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	});
	
	//가입 버튼
	$("#btnApply").on("click", function(){
		let stuCd = "${userVO.userCd}";
		let crCd = $("#crCd").val();
		let crLeader = "${crewVO.crLeader}";
		
		console.log("stuCd : " + stuCd);
		console.log("crCd : " + crCd);
		console.log("crLeader : " + crLeader);
		
		Swal.fire({
			text: "동아리 가입을 신청하시겠습니까?",
			icon: 'question',
			width: 400,
			position:'top',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '신청',
			cancelButtonText:  '취소',
		}).then((result) => {
		 	console.log(result);
		 	if (result.isConfirmed) {
		 		$.ajax({
					url:"/student/crew/crewJoin",
					data:{
						stuCd: stuCd,
						crCd: crCd,
						crLeader: crLeader
					},
					type:"post",
					beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
					success:function(res){
						alertSuccess('신청되었습니다.', '/student/crew/myJoinAppList');
					}
				});
		    }
		});
	});
	
	//탈퇴 버튼
	$("#btnQuit").on("click", function(){
		let stuCd = "${userVO.userCd}";
		let crCd = $("#crCd").val();
		
		console.log("stuCd : " + stuCd);
		console.log("crCd : " + crCd);
		
		Swal.fire({
			text: "동아리를 탈퇴하시겠습니까?",
			icon: 'question',
			width: 400,
			position:'top',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '탈퇴',
			cancelButtonText:  '취소',
		}).then((result) => {
		 	console.log(result);
		 	if (result.isConfirmed) {
		 		$.ajax({
					url:"/student/crew/crewQuit",
					data:{
						stuCd:stuCd,
						crCd:crCd
					},
					type:"post",
					beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
					success:function(res){
						alertSuccess('정상적으로 탈퇴 처리되었습니다.', '/student/crew/myCrew');
					}
				});
		    }
		});
		
	});
	
	//동아리 활동 추가
	$("#craAddBtn").on("click", function(){
		
		$(".crewModBtn").css("display", "none");
		$(".crewPersonTbl th").css("position", "static");
		$(".crewInfo").css("position", "static");

        $(".cramodal").fadeIn();

        $(".close_bt").on("click", function(){
        	$(".cramodal").fadeOut();
        	$(".crewPersonTbl th").css("position", "sticky");
    		$(".crewInfo").css("position", "relative");
    		$(".crewModBtn").css("display", "");
        });
	});
});
</script>