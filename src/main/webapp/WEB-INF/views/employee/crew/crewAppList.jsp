<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="/resources/js/jquery.min.js"></script>
<style>
	.crew_box{width:100%; height:100%; overflow-y:scroll; padding:40px; background-color:#ffffff;}
	.crew_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.crew_box table{font-size:14px; width:100%; text-align:center;}
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	.crew_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.crew_box tr:first-child{background-color:#EEF1F6;}
	.crew_box tr:hover{background-color:#f2f3f4;}
	.crew_box tr:first-child:hover{background-color:#EEF1F6;}
	.crew_box tr td:nth-child(1){width:5%;}
	.crew_box tr td:nth-child(2){width:15%;}
	.crew_box tr td:nth-child(3){width:20%;}
	.crew_box tr td:nth-child(4){width:15%;}
	.crew_box tr td:nth-child(5){width:15%;}
	.crew_box tr td:nth-child(6){width:15%;}
	.crew_box tr td:nth-child(7){width:15%;}
	.newCrewHeader, .appList{font-size: 16px; padding-bottom:10px;}
	
	.crew_form{border:1px solid #d1d0d0; padding:30px; width:80%; border-radius:5px; position:relative;}
	.crew_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
	.crew_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
	.crew_form_title select, .crew_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
	.crew_margin_left{margin-left:5px;}
	.crew_form a:hover{color:#ffffff!important;}

	.newCrewList {height: 50%; margin-bottom: 30px;}
	.crewList {height: 50%;}
</style>
<div class="crew_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/employee/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/lectureapproval/list">결재</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/crew/crewList">동아리관리</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/employee/crew/crewAppList">동아리 개설 승인</a></span>
	</div>
	<div class="table_topic">동아리 개설 승인</div>
	<div class="newCrewList">
		<div class="newCrewHeader">미확인 신청</div>
				<div class="newCrewTableWrqp">
					<table>
						<tr class="table_title">
							<th style="width: 5%;">no</th>
							<th style="width: 15%;">신청인</th>
							<th style="width: 15%;">동아리명</th>
							<th style="width: 20%;">동아리소개</th>
							<th style="width: 15%;">희망동아리실</th>
							<th style="width: 15%;">신청일</th>
							<th style="width: 15%;">상세</th>
						</tr>
						<c:choose>
							<c:when test="${!empty newAppVOList}">
								<c:forEach var="appVO" items="${newAppVOList}" varStatus="stat">
									<input class="crCd" value="${appVO.crCd}" hidden />
									<tr>
										<td>${stat.count}</td>
										<td>${appVO.stuNm}</td>
										<td>${appVO.crNm}</td>
										<td>${appVO.crCon}</td>
										<td>학생회관 ${appVO.roomNm}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd" value="${appVO.approvalVO.appReg}"></fmt:formatDate></td>
										<td>
								            <button type="button" class="formBtn btn-two mini green app-btn" data-cr-cd="${appVO.crCd}">보기</button>
								        </td>
						        	</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="7"><div style="color: #333333; font-size: 14px;">미확인 신청 내역이 없습니다.</div></td>
								</tr>
							</c:otherwise>
						</c:choose>
					</table>
				</div>
	</div>
	<div class="crewList">
		<div class="appList">
			<p>승인 내역</p>
		</div>
		<div class="crTb">
			<table>
				<tr class="table_title">
					<th>no</th>
					<th>신청인</th>
					<th>동아리명</th>
					<th>신청일</th>
					<th>처리일</th>
					<th>승인여부</th>
					<th>비고</th>
				</tr>
				<c:forEach var="appVO" items="${appVOList}" varStatus="stat">
					<input class="crCd" value="${appVO.crCd}" hidden />
					<c:if test="${appVO.approvalVO.appYn eq 1}">
						<tr>
							<td>${stat.count}</td>
							<td>${appVO.stuNm}</td>
							<td>${appVO.crNm}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${appVO.approvalVO.appReg}"></fmt:formatDate></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${appVO.approvalVO.appProdt}"></fmt:formatDate></td>
					        <td>승인</td>
							<td></td>
			        	</tr>
			        </c:if>
			        <c:if test="${appVO.approvalVO.appYn eq 2}">
						<tr>
							<td>${stat.count}</td>
							<td>${appVO.stuNm}</td>
							<td>${appVO.crNm}</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${appVO.approvalVO.appReg}"></fmt:formatDate></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd" value="${appVO.approvalVO.appProdt}"></fmt:formatDate></td>
					        <td>반려</td>
<%-- 							<td>${appVO.approvalVO.appRet}</td> --%>
							<td>
								<button class="btn-two gray mini btnCompanion" data-app-ret="${appVO.approvalVO.appRet}">반려사유</button>
							</td>
			        	</tr>
			        </c:if>
				</c:forEach>
			</table>
		</div>
	</div>
</div>

<!-- 신청서 모달 -->
<div class="crewmodal modal-bg" style="display:none; position:fixed; z-index: 999; top:0; left:0; width:100%; height:100%; background: rgba(0, 0, 0, 0.4);">
	<div class="crew_box" style="overflow: auto; position:absolute; z-index: 999; width: 1000px; height: 900px; border-radius:10px; padding:30px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%); ">
		<button type="button" class="btn-two gray mini close_bt" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>
		<div class="appModal-content">
			<div class="crew_form_title">
				<p>동아리명</p>
				<input type="text" id="crNm" readonly="readonly"/>
			</div>
			<div class="crew_form_title">
				<p>동아리 목적</p>
				<input type="text" id="crCon" readonly="readonly"/>
			</div>
			<div class="crew_form_title">
				<p>동아리장</p>
				<input type="text" id="crLeader" readonly="readonly"/>
			</div>
			<div class="crew_form_title">
				<p>동아리실</p>
				<input type="text" id="roomNm" readonly="readonly"/>
			</div>
			<div class="crew_form_title" style="margin-bottom:100px;">
				<p>첨부파일</p>
				<img id="file">
			</div>
			<div style="display:flex; justify-content: flex-end;">
				<button type="button" id="btnApp" class="btnApp btn-reg bur">승인</button>
				<button type="button" id="btnRet" class="btnRet btn-reg back" style="margin-left:10px;">반려</button>
			</div>
		</div>
	</div>
</div>
<script>
$(function(){
	
	$(".btnCompanion").on("click", function() {
		const appRet = $(this).data("appRet");
		console.log("appRet : ", appRet);
		alertInfo(appRet);
	})

	function alertInfo(appRet) {
		appRet = appRet.slice(0,30) + "<br>" + appRet.slice(30);
		Swal.fire({
			html: '<i class="fa-solid fa-circle-info" style="color: #333333;"></i>  반려사유 : ' + appRet,
			width: 600,
			padding: 30,
			position: "center",
			confirmButtonColor: "#333333",
			confirmButtonText: "확인",
		});
	}

	//보기 버튼 클릭 시
	$(".formBtn").on("click", function(){
		let crCd = $(this).data("crCd");
        
		console.log("crCd : " + crCd);
		
 		$.ajax({
 			url:"/employee/crew/crewAppForm?crCd="+crCd,
 			dataType: 'json',
 			type:"get",
 			beforeSend:function(xhr){
 				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
 			},
 			success:function(res){
				console.log(res);
				console.log(res.filesDetailVOList[0].fileSvnm);
				$("#crNm").val(res.crNm);
				$("#crCon").val(res.crCon);
				$("#crLeader").val(res.stuNm);
				$("#roomNm").val("학생회관 " + res.roomNm);
				$("#file").attr({ src: "/resources/upload/"+res.filesDetailVOList[0].fileSvnm });
				$(".crewmodal").fadeIn();
				
				//승인 버튼 클릭 시
				$(".btnApp").on("click", function(){
					let crCd = res.crCd
					let appCd = res.appCd
					let stuCd = res.stuCd
			        
					console.log("crCd : " + crCd);
					console.log("appCd : " + appCd);
					console.log("stuCd : " + stuCd);
					
					let data = {
						"crCd" : crCd,
						"appCd" : appCd,
						"stuCd" : stuCd
					}
					
			 		$.ajax({
			 			url:"/employee/crew/crewApp",
			 			contentType:"application/json;charset=utf-8",
			 			data:JSON.stringify(data),
			 			type:"post",
			 			beforeSend:function(xhr){
			 				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			 			},
			 			success:function(res){
			 				alertSuccess('승인되었습니다.', '/employee/crew/crewAppList');
			 			}
			 		});
				});
				
				//반려 버튼 클릭 시
				$(".btnRet").on("click", function(){
					let crCd = res.crCd;
					let appCd = res.appCd;
					let userCd = res.stuCd;
			        
					console.log("crCd : " + crCd);
					console.log("appCd : " + appCd);
					console.log("userCd : " + userCd);
					
					
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
		    			      url:"/employee/crew/crewAppReturn", 
		    			      contentType:"application/json;charset=utf-8",
		                      data:JSON.stringify(data),
		    			      type:"post",
		    			      beforeSend: function(xhr) {
 			                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
 			                  },
		    			      success: function(response) {
		    			        console.log("Data sent successfully", response);
				                alertSuccess("동아리 개설이 반려되었습니다.", "/employee/crew/crewAppList");
		    			      },
		    			      error: function(error) {
		    			        console.error("Error sending data", error);
		    			      }
		    			    });
			    		}
			    	});
			    });
				
				$(".close_bt").on("click", function(){
		         	$(".crewmodal").fadeOut();
		        });
 			}
 		});
	});
});
</script>