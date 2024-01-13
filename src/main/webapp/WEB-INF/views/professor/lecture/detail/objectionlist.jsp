<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
	/* 여기 스타일 전부 가져다가 복붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "counsel_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
	.objection_box{width:100%; height:100%; padding:40px; background-color:#ffffff;}
	/* 상단에 있는 제목 (여기서는 상담내역) css입니다
    그대로 복붙하시고 해당div에  .table_topic값 주세요*/
	.objection_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.objection_box .table_topic i{margin-left:10px;}
	/* table입니다 */
	.objection_box table{font-size:14px; width:100%; text-align:center;}
	/* 테이블의 시작부분 타이틀입니다 */
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	
	/* /////////////////여기가 수정시작!!  */
	.objection_box tr{height:40px!important; border-bottom:1px solid #ebebeb;}
	.objection_box tr:first-child{background-color:#EEF1F6;}
	.objection_box tr:hover{background-color:#f2f3f4;}
	.objection_box tr:first-child:hover{background-color:#EEF1F6;}
	/* /////////////////여기가 수정끝!!  */
	
	/* 각자 만든 td개수만큼만쓰고 총 합이 100이 되도록 잘 분배해서 쓰세요 이부분 제일 신경써서 해주세요*/
	.objection_box tr td:nth-child(1){width:10%;}
	.objection_box tr td:nth-child(2){width:10%;}
	.objection_box tr td:nth-child(3){width:10%;}
	.objection_box tr td:nth-child(4){width:10%;}
	.objection_box tr td:nth-child(5){width:40%;}
	.objection_box tr td:nth-child(6){width:10%;} 
	.objection_box tr td:nth-child(7){width:10%;} 
	.objection_form{border:1px solid #d1d0d0; padding:30px; width:100%; border-radius:5px; position:relative;}
	.objection_form_title{display:flex; flex-direction:column; justify-content:space-between; margin-bottom:30px;}
	.objection_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
	.objection_form_title select, .objection_form_title input{font-size:14px; border: 1px solid #d1d0d0; border-radius:3px; padding:5px 15px;}
	.counsel_margin_left{margin-left:5px;}
	.objection_form a:hover{color:#ffffff!important;}
	.objection_form_title input{border: none;}
	
	.objection_box input{border:1px solid #f2f3f4; padding:5px 10px!important; width:100px!important;}
	.objection_box input:focus{outline:none;}
	.objection_box p{width:40px; font-size:12px; margin-bottom:0; margin-right:10px; line-height: 30px; text-align: end;}
	.objection_box .start{width:50px!important; text-align:start!important; margin-left:5px;}
	
	.lecture_menu{height:30px; align-items:center;}
	.lecture_menu a{border:1px solid #ebebeb; box-sizing:border-bos; background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; box-sizing: border-box; border:1px solid #ffffff;}
</style>

<div style="display:flex;" class="lecture_menu">
	<a href="/professor/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a ">홈</a>
	<a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a ">공지사항</a>
    <a href="/professor/task/list?lecCd=${param.lecCd}" class="sub_menu_a">과제</a>
    <a href="/professor/test/testList?lecCd=${param.lecCd}" class="sub_menu_a ">시험</a>
    <a href="/professor/lectureAttendance?lecCd=${param.lecCd}" class="sub_menu_a ">출결관리</a>
    <a href="/professor/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a ">자료실</a>
    <a href="/professor/objection/list?lecCd=${param.lecCd}" class="sub_menu_a effect">성적이의신청</a>
</div>

<div class="objection_box">
  <div style="font-size:12px; color:#888888; margin-bottom: 20px;">
    <span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/list" style="font-size:12px; color:#888888;">강의실</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/lecture/detail?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;" id="lecNm"></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span><a href="/professor/objection/list?lecCd=${param.lecCd}" style="font-size:12px; color:#888888;">성적이의신청</a></span>
  </div>
  <div class="table_topic">성적이의신청<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
  <table>
    <tr class="table_title">
      <td>no</td>
      <td>학번</td>
      <td>성명</td>
      <td>이의신청일</td>
      <td>사유</td>
      <td>승인여부</td>
    </tr>
    <c:forEach items="${objectionList}" var="objectionVO" varStatus="cnt">
			<tr>
				<td>${cnt.count}</td>
				<td>${objectionVO.studentVO.stuCd}</td>
				<td>${objectionVO.studentVO.userVO.userNm}</td>
				<td><fmt:formatDate value="${objectionVO.approvalVO.appReg}" pattern="yy.MM.dd"/></td>
				<td>
					<c:choose>
						<c:when test="${fn:length(objectionVO.objCon) > 40}">
							<span class="objContent" style="cursor: pointer;" data-lec-cd="${objectionVO.lectureGradeVO.gradeCriteriaVO.lecCd}" data-stu-cd="${objectionVO.stuCd}">${fn:substring(objectionVO.objCon, 0, 40)} ...</span>
						</c:when>
						<c:otherwise>
							${objectionVO.objCon}    	        
						</c:otherwise>
					</c:choose>
				</td>
				<td>
					<c:choose>
						<c:when test="${objectionVO.approvalVO.appYn eq 0}"><button class="btn-two mini green btnWaiting" data-crtr-cd="${objectionVO.crtrCd}" data-stu-cd="${objectionVO.stuCd}" data-app-cd="${objectionVO.approvalVO.appCd}">대기</button></c:when>
						<c:when test="${objectionVO.approvalVO.appYn eq 1}"><button class="btn-two mini sky btnApproval" data-crtr-cd="${objectionVO.crtrCd}" data-stu-cd="${objectionVO.stuCd}">승인</button></c:when>
						<c:when test="${objectionVO.approvalVO.appYn eq 2}"><button class="btn-two mini orange btnCompanion" data-crtr-cd="${objectionVO.crtrCd}" data-stu-cd="${objectionVO.stuCd}">반려</button></c:when>
					</c:choose>
				</td>
			</tr>
    </c:forEach>
  </table>
  
</div>
<div class="objectionModal reg-modal-bg" style="display: none; position: fixed; z-index: 998; top: 0; left: 0; background: rgba(0, 0, 0, 0.4); width: 100%; height: 100%; overflow: hidden;">
	<div class="objectionModal" style="position: absolute; padding: 30px; padding-top: 60px; z-index: 999; width: 600px; height: 650px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%);">
		<button type="button" class="btn-two gray mini close_bt" onclick="closeObjectionModal()" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>
		<div style="width: 100%; height: 100%; margin: 0 auto">
			<div style="height:100%; width:100%; overflow: hidden; margin: 0 auto;">
				<div class="table_topic" style="margin-left: 30px; font-weight: 600">성적 이의신청</div>
				<div class="objection_box">
					<div class="objection_form_title" style="margin-bottom:30px;"> 
						<div style="display: flex;">
							<!-- <div style="display: flex; flex:1;">
								<p>소속</p>
								<input type="text" value="소속" readonly>
							</div> -->
							<div style="display: flex; flex:1;">
								<p>학번</p>
								<input id="stuCd" type="text" value="학번" readonly>
							</div>
							<div style="display: flex; flex:1;">
								<p>성명</p>
								<input id="userNm" type="text" value="성명" readonly>
							</div>
						</div>
					</div>
					<div class="objection_form_title">
						<div style="display: flex; justify-content:space-around">
							<div>
								<p class="start">중간고사</p>
								<input id="lecgMs" type="text" value="중간점수" readonly>
							</div>
							<div>
								<p class="start">기말고사</p>
								<input id="lecgFs" type="text" value="기말점수" readonly>
							</div>
							<div>
								<p class="start">과제</p>
								<input id="lecgTs" type="text" value="과제점수" readonly>
							</div>
							<div>
								<p class="start">출결</p>
								<input id="lecgAs" type="text" value="출결점수" readonly>
							</div>
						</div>
					</div>
					<div class="objection_form_title">
						<p style="width: 60px!important;">신청 사유</p>
						<textarea id="objCon" cols="30" rows="10" readonly style="resize: none; border: 1px solid #f2f3f4; padding: 15px;"></textarea>
					</div>
					<div class="objection_form_title">
						<div style="display: flex;">
							<div style="display: flex; flex:1; height:30px;">
								<p>등급</p>
								<input id="lecgGrade" type="text" value="이전등급" readonly>
							</div>
							<div style="display: flex; flex:1;">
								<p style="width: 50px!important;">변경등급</p>
								<select id="newGrade">
									<option value="">== 등급선택 ==</option>
									<option value="A+">A+</option>
									<option value="A">A</option>
									<option value="B+">B+</option>
									<option value="B">B</option>
									<option value="C+">C+</option>
									<option value="C">C</option>
									<option value="D+">D+</option>
									<option value="D">D</option>
									<option value="F">F</option>
								</select>
							</div>
						</div>
						<input type="hidden" id="appCd">
						<input type="hidden" id="crtrCd">
					<div style="display: flex; justify-content: space-around; margin-top: 20px;">
						<button id="recognizeObjection" class="btn-reg sky">승인</button>
						<button id="companionObjection" class="btn-reg bur">반려</button>
					</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<script>
	let str = `${jsonObjectionList}`.replaceAll("\n", "ddd");
  const jsonObjectionList = JSON.parse(str);
  console.log(jsonObjectionList);
	
	function closeObjectionModal() {
		$(".objectionModal").hide();
	}
	
	function getGrade(lecgSum) {
		if (lecgSum == null) return "-"
		else {
			if (lecgSum >= 95) return "A+";
			else if (lecgSum >= 90) return "A";
			else if (lecgSum >= 85) return "B+";
			else if (lecgSum >= 80) return "B";
			else if (lecgSum >= 75) return "C+";
			else if (lecgSum >= 70) return "C";
			else if (lecgSum >= 65) return "D+";
			else if (lecgSum >= 60) return "D";
			else return "F";
		}
	};
  
	
  $(".btnWaiting").on("click", function() {
		
		const stuCd = $(this).data("stuCd");
		const crtrCd = $(this).data("crtrCd");
		const appCd = $(this).data("appCd");
		
		
		jsonObjectionList.forEach(objection => {
			if (objection.stuCd == stuCd && objection.crtrCd == crtrCd) {
				$("#stuCd").val(stuCd);
				$("#userNm").val(objection.studentVO.userVO.userNm);
				$("#lecgMs").val(objection.lectureGradeVO.lecgMs);
				$("#lecgFs").val(objection.lectureGradeVO.lecgFs);
				$("#lecgTs").val(objection.lectureGradeVO.lecgTs);
				$("#lecgAs").val(objection.lectureGradeVO.lecgAs);
				$("#lecgGrade").val(getGrade(objection.lectureGradeVO.lecgSum));
				$("#objCon").val(objection.objCon.replaceAll("ddd", "\n"));
				$("#appCd").val(objection.approvalVO.appCd);
				$("#crtrCd").val(crtrCd);
			};
		});
		$(".objectionModal").show();
	});
  
	$("#recognizeObjection").on("click", function() {
		const newGrade = $("#newGrade").val()
		if (newGrade.length > 0) {
			$.ajax({
				url: "/professor/objection/recognizeObjection",
				contentType: "application/json; charset=UTF-8",
				type: "post",
				data: JSON.stringify({
					appCd: $("#appCd").val(),
					stuCd: $("#stuCd").val(),
					approvalVO: {appYn: 1} ,
					lectureGradeVO: {lecgGrade:newGrade},
					crtrCd: $("#crtrCd").val(),
				}),
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success: res => {
					if (res > 1) {
						alertSuccess("이의신청이 승인되었습니다.", "/professor/objection/list?lecCd="+jsonObjectionList[0].lectureGradeVO.lecCd);
						$(".objectionModal").hide();
					}
				}
			})
		} else {
			alertError("변경하실 등급을 선택해주세요.");
		}
	});
	
	$("#companionObjection").on("click", function() {
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
				
				if (appRet.length < 1) {
					alertError("반려사유를 입력해주세요.");
					return;
				}
				
				$.ajax({
					url: "/professor/objection/companionObjection",
					contentType: "application/json; charset=UTF-8",
					data: JSON.stringify({
						approvalVO: {appCd: $("#appCd").val(), appYn: 2, appRet: appRet},
						appCd: $("#appCd").val(),
						stuCd: $("#stuCd").val(),
						crtrCd: $("#crtrCd").val(),
						objRpl: appRet
					}),
					type: "post",
					beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
					success: res => {
						if (res > 0) {
							alertSuccess("이의신청이 반려되었습니다.", "/professor/objection/list?lecCd="+jsonObjectionList[0].lectureGradeVO.lecCd);
							$(".objectionModal").hide();
						}
					}
				})
			}
		});
	});
	
  $(function() {
		$("#lecNm").text($(".lectureName").text());
  });
</script>