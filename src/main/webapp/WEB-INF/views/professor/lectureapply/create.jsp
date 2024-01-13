<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!-- <style> -->
<!-- /* .counsel_box{width:100%; padding:40px; background-color:#ffffff;} */ -->
<!-- /* .table_topic{font-size: 20px; padding-bottom:30px;} */ -->

<!-- /* .counsel_form{border:1px solid #d1d0d0; padding:30px; width:80%; border-radius:5px; position:relative;} */ -->
<!-- /* .counsel_form_title{display:flex; flex-direction:column; margin-bottom:30px;} */ -->
<!-- /* .counsel_form_title p{width:120px; font-size:16px; margin-bottom:15px;} */ -->
<!-- /* .counsel_form_title select, .counsel_form_title input{font-size:14px; border: 1px solid #d1d0d0; border-radius:3px; padding:5px 15px;} */ -->
<!-- /* .counsel_margin_left{margin-left:5px;} */ -->
<!-- /* .counsel_form a:hover{color:#ffffff!important;} */ -->
<!-- </style> -->

<style>
.record_box{width:950px; height:1000px; padding:40px; background-color:#ffffff;}
.table_topic{font-size: 20px; padding-bottom:30px;}

.record_form{border:1px solid #d1d0d0; padding:30px; width:100%; height:calc(100% - 35px); border-radius:5px; position:relative;}
.record_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
/* .record_form_title p{width:120px; font-size:16px; margin-bottom:15px;} */
/* .record_form_title select, .counsel_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;} */
.record_form a:hover{color:#ffffff!important;}
.record_form input:focus{outline:none;}
.record_form textarea{resize:none;}
.record_form table th, .record_form table td{border:1px solid #888888; padding:7px; font-size:15px;}
.record_form table th{text-align:center; background-color:#ebebeb;}
select{
	outline: none;
}
</style>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>

<%-- ${roomVOList} --%>
<div class="record_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href=/professor/lecture/list>강의</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/professor/lectureapply/create">강의계획신청</a></span>
	</div>
<form name="frm" id="applyFrm" action="/professor/lectureapply/create?${_csrf.parameterName}=${_csrf.token}" method="post" class="record_form">
	<div class="table_topic" style="margin-bottom:40px; padding-bottom:15px; border-bottom:1px solid #d1d0d0;display: flex;">
		<div style="flex: 1;">강의계획신청</div>
		<div style="flex: 1;text-align: right;"><button type="button" id="btnAuto" class="btn-two mini gray" style="width: 100px;">자동완성</button></div>
	</div>
	<input type="hidden" id="userCd" name="approvalVO.userCd" value="${userVO.userCd}" /> 
	<input type="hidden" id="lecaTemp" name="lecaTemp" class="form-control" value="0" />
	<input type="hidden" id="lecaCd" name="lecaCd"  value=""/>
	
	<div class="record_form_title">
		<div style="margin-bottom:10px;"></div>
		<table style="margin-bottom:40px;">
			<tr>
				<th>강의명</th>
				<td colspan="3"><input id="lecaNm" type="text" name="lecaNm" value="" style="width:400px; font-size:15px; border:0;"/></td>
				<th>개설학년</th>
				<td><select id="lecaTrg"  name="lecaTrg" style="width:100px; font-size:15px; border:0;"><option value="1" selected="selected">1학년</option><option value="2">2학년</option><option value="3">3학년</option><option value="4">4학년</option><option value="5">공통</option></select></td>
			</tr>
			<tr>
				<th>년도</th>
				<td><input id="lecaYear" type="number" name="lecaYear" value="" style="width:100px; font-size:15px; border:0;"/></td>
				<th>학기</th>
				<td><input id="lecaSem" type="number"  name="lecaSem" value="" style="width:100px; font-size:15px; border:0;" /></td>
				<th>대상학과</th>
				<td><select id="depCd"  name="depCd" style="width:150px; font-size:15px; border:0"><c:forEach var="departmentVO" items="${departmentVOList}"><option value="${departmentVO.depCd}">${departmentVO.depNm}</option></c:forEach></select></td>
			</tr>
			<tr>
				<th>정원</th>
				<td><input id="lecaCap" type="number" name="lecaCap" value="" style="width:100px; font-size:15px; border:0;"/></td>
				<th>학점</th>
				<td><input id="lecaCrd" type="number"  name="lecaCrd" value="" style="width:100px; font-size:15px; border:0;" /></td>
				<th>강의시수</th>
				<td><input id="lecaPer" type="number"  name="lecaPer" value="" style="width:100px; font-size:15px; border:0;" /></td>
			</tr>
			<tr>
				<th>평가구분</th>
				<td><select id="lecaEva"  name="lecaEva" style="width:150px; font-size:15px; border:0;"><option value="0" selected="selected">상대평가</option><option value="1">절대평가</option></select></td>
				<th>전공유형</th>
				<td><select id="lecaType"  name="lecaType" style="width:150px; font-size:15px; border:0;"><option value="0" selected="selected">전공필수</option><option value="1">전공선택</option><option value="2">교양필수</option><option value="3">교양선택</option></select></td>
				<th>강의실</th>
				<td><select id="roomCd"  name="roomCd" style="width:150px; font-size:15px; border:0;"><c:forEach var="roomVO" items="${roomVOList}"><option value="${roomVO.roomCd}">${roomVO.roomNm}</option></c:forEach></select></td>
			</tr>
			<tr>
				<th>시작시간</th>
				<td><select id="lecaStdt"  name="lecaStdt" style="width:100px; font-size:15px; border:0;"><option value="9:00">9:00</option><option value="10:00">10:00</option><option value="11:00">11:00</option><option value="12:00">12:00</option><option value="13:00">13:00</option><option value="14:00">14:00</option><option value="15:00">15:00</option><option value="16:00">16:00</option><option value="17:00">17:00</option><option value="18:00">18:00</option></select></td>
				<th>종료시간</th>
				<td><select id="lecaEddt"  name="lecaEddt" style="width:100px; font-size:15px; border:0;"><option value="9:00">9:00</option><option value="10:00">10:00</option><option value="11:00">11:00</option><option value="12:00">12:00</option><option value="13:00">13:00</option><option value="14:00">14:00</option><option value="15:00">15:00</option><option value="16:00">16:00</option><option value="17:00">17:00</option><option value="18:00">18:00</option></select></td>
				<th>작성자</th>
				<td>${userVO.userNm}<input type="hidden" id="approvalVO.appTarget" name="approvalVO.appTarget" value="1001"/></td>
			</tr>
			<tr>
				<th>교재 및 참고서</th>
				<td colspan="5"><input id="lecaBook" type="text" name="lecaBook" value="" style="width:600px; font-size:15px; border:0;"/></td>
			</tr>
			<tr>
				<th>비고</th>
				<td colspan="5"><input id="lecaNote" type="text" name="lecaNote" value="" style="width:600px; font-size:15px; border:0;"/></td>
			</tr>
		</table>
		<div style="margin-bottom:20px; display: flex;">
			<span>희망요일 &nbsp;:&nbsp;&nbsp;</span><span>
			<input type="checkbox" name="lecaScheC" id="lecaScheC" value="월요일"  />월
			<input type="checkbox" name="lecaScheC" id="lecaScheC" value="화요일"  />화
			<input type="checkbox" name="lecaScheC" id="lecaScheC" value="수요일"  />수
			<input type="checkbox" name="lecaScheC" id="lecaScheC" value="목요일"  />목
			<input type="checkbox" name="lecaScheC" id="lecaScheC" value="금요일"  />금
			<input type="hidden" id="lecaSche" name="lecaSche" value="" /></span>
		</div>
		<div style="margin-bottom:10px;">
			<span>성적처리기준</span>
			<p style="font-size:12px; color:#333333; text-wrap:nowrap; display:block; margin:5px 0 0 5px!important;"> * 비율을 입력해주세요.<p>
		</div>
	    <div style="display:flex; margin-bottom:40px; align-items: center;">
	 	<div style="flex:1; display:flex; align-items: center;">
			<input type="number" name="crtrMp" id="crtrMp" style="width:160px; font-size:15px; border:1px solid #888888;text-align: center;"placeholder="중간고사"/>
		</div>
		<div style="flex:1; display:flex; align-items: center;">
			<input type="number" name="crtrFp" id="crtrFp" style="width:160px; font-size:15px; border:1px solid #888888;text-align: center;"placeholder="기말고사"/>
		</div>
		<div style="flex:1; display:flex; align-items: center;">
			<input type="number" name="crtrTp" id="crtrTp" style="width:160px; font-size:15px; border:1px solid #888888;text-align: center;"placeholder="과제"/>
		</div>
		<div style="flex:1; display:flex; align-items: center;">
			<input type="number" name="crtrAp" id="crtrAp" style="width:160px; font-size:15px; border:1px solid #888888;text-align: center;"placeholder="출결"/>
		</div>
	  </div>	
	  <div style="display:flex; flex-direction:column; margin-bottom:40px; margin-top:10px;">
	  	<p style="margin-bottom:10px;">교과목 개요</p>
	  	<textarea id="lecaCon" name="lecaCon" style="height:230px; padding:10px; line-height:20px; font-size:14px;"></textarea>
	  </div>
	</div>
	
	<div style="display:flex; justify-content:end; margin-top:40px; position:absolute; bottom:-35px; right:30px;">
			<button class="btn-reg bur" id="realSubmitForm" type="button">신청</button>
		<button class="cancel btn-reg back" id="noSubmitForm" type="button" style="margin-left:10px;">취소</button>
	</div>
	<sec:csrfInput />
</form>	
</div>

<script type="text/javascript">

logout = function() {
	$("#logoutForm").submit();
}
$(function(){
	$("#realSubmitForm").on("click", function(){
			var selectedDays = [];

		    var checkboxes = document.getElementsByName('lecaScheC');

		    for (var i = 0; i < checkboxes.length; i++) {
		        if (checkboxes[i].checked) {
		            selectedDays.push(checkboxes[i].value);
		        }
		    }

		    var result = selectedDays.join('/');
		    
		    document.getElementById('lecaSche').value = result;
		    console.log("값1",$("#cetrMp").val());
		    console.log("값2",$("#cetrFp").val());
		    console.log("값3",$("#cetrTp").val());
		    console.log("값4",$("#cetrAp").val());
			sweetConfirmCreate();
	});
	
	function sweetConfirmCreate() {
	    Swal.fire({
	        text: "강의계획 신청을 하시겠습니까?",
	        icon: "question",
	        width: 300,
	        showCancelButton: true,
	        confirmButtonColor: "#3085d6",
	        cancelButtonColor: "#d33",
	        confirmButtonText: "네",
	        cancelButtonText: "아니오"
	    }).then((result) => {
	        console.log(result);
	        if (result.isConfirmed) {
	            // "네"를 클릭했을 때의 동작
	        	$("#applyFrm").submit();
	        } else {
	            // "아니오"를 클릭했을 때의 동작
	            alertError('신청을 취소하였습니다.');
	        }
	    });
	}
	
	$("#noSubmitForm").on("click", function(){
		alertError('신청을 취소하였습니다.');
		setTimeout(() => location.href="/professor/mypage", 500);
	});
	
	// 자동완성버튼
	$('#btnAuto').on('click', function(){
		// 강의명
		$('#lecaNm').val("인터넷 보안과 프라이버시");
		// 개설학년
		$('#lecaTrg').val(4);
		// 년도
		$('#lecaYear').val(2024);
		// 학기
		$('#lecaSem').val(1);
		//대상학과
		$('#depCd').val("COLE0201");
		// 정원
		$('#lecaCap').val(30);
		// 학점
		$('#lecaCrd').val(3);
		// 강의시수
		$('#lecaPer').val(3);
		// 평가구분
		$('#lecaEva').val(1);
		// 전공유형
		$('#lecaType').val(1);
		// 강의실
		$('#roomCd').val("BULD02105");
		// 시작시간
		$('#lecaStdt').val("9:00");
		// 종료시간
		$('#lecaEddt').val("11:00");
		// 교재 및 참고서
		$('#lecaBook').val("U-컴퓨팅 보안과 프라이버시");
		// 비고
		$('#lecaNote').val("시큐리티에 관한 수업입니다.");
		// 희망요일
		var selectedDays = [];
	    var checkboxes = document.getElementsByName('lecaScheC');
	    for (var i = 0; i < 2; i++) {
	        checkboxes[i].checked = true;
	        if (checkboxes[i].checked) {
	            selectedDays.push(checkboxes[i].value);
	        }
	    }
	    var result = selectedDays.join('/');
	    document.getElementById('lecaSche').value = result;
		// 성적처리기준
		$('#crtrMp').val(35);
		$('#crtrFp').val(35);
		$('#crtrTp').val(20);
		$('#crtrAp').val(10);
		// 교과목개요
		$('#lecaCon').val("인터넷에서의 보안과 프라이버시는 점점 더 중요해지고 있다. 이공계생들 뿐만 아니라 모든 전공의 학부생들도 인터넷 서비스를 사용함에 있어서 어떤 보안 사항들이 이슈가 되고 어떤 프라이버시가 노출되는 위협이 있는지 기본 원리와 대처 방안들을 이해하는 것은 필수적이라 할 수 있다. 본 강의는 모든 전공의 학생들이 들을 수 있도록 쉽게 구성될 것이다. 본 교과목은 크게 보안과 프라이버시 두 개의 영역으로 구성된다. 보안 분야에서는 보안의 기본 성질 및 개념, 암호화/복호화의 기초, 인증, 보안 장비, 웹의 보안 위협들을 설명한다. 프라이버시 분야에서는 개인 민감정보들을 소셜네트워크에서 어떻게 유출이 가능한지 설명하고, 또한 법적으로 프라이버시가 어떻게 정의되고 어떤 이슈가 있는지 다룬다. 또한 Tor등 익명화 기법을 포함한 프라이버시 강화 기법들을 설명한다. 끝으로 암호화폐와 디지털 포렌식을 다룬다.");
		
		
	});
	
	
});

</script>














