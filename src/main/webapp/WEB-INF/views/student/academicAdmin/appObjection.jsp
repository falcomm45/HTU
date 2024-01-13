<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
	/* 여기 스타일 전부 가져다가 복붙하셔야해요  
	본인이 만든 페이지 내용 제일 바깥쪽에 div하나 만들고 "counsel_box" 이런식으로 특별한?클래스이름을 붙여주세요*/
	.grade_box{width:100%; height:100%; padding:40px; background-color:#ffffff;}
	/* 상단에 있는 제목 (여기서는 상담내역) css입니다
		그대로 복붙하시고 해당div에  .table_topic값 주세요*/
	.grade_box .table_topic{font-size: 20px; padding-bottom:30px;}
	.grade_box .table_topic i{margin-left:10px;}
	/* table입니다 */
	.grade_box table{font-size:14px; width:100%; text-align:center;}
	.grade_box tr{height:40px;}
	/* 각자 만든 td개수만큼만쓰고 총 합이 100이 되도록 잘 분배해서 쓰세요 이부분 제일 신경써서 해주세요*/
	.grade_box tr td:nth-child(1){width:10%;}
	.grade_box tr td:nth-child(2){width:10%;}
	.grade_box tr td:nth-child(3){width:10%;}
	.grade_box tr td:nth-child(4){width:10%;}
	.grade_box tr td:nth-child(5){width:10%;}
	.grade_box tr td:nth-child(6){width:10%;}
	.grade_box tr td:nth-child(7){width:10%;}
	.grade_box tr td:nth-child(8){width:10%;}
	.grade_box tr td:nth-child(9){width:10%;}
	
	/* 테이블의 시작부분 타이틀입니다 */
	.table_title{font-size:13px; border-top:1px solid #333333!important; border-bottom:1px solid #333333!important; height:32px; line-height:32px;}
	/* /////////////////여기가 수정시작!!  */
	.grade_box tr{height:40px; border-bottom:1px solid #ebebeb;}
	.grade_box .table_title2{background-color:#EEF1F6;}
	.grade_box tr:hover{background-color:#f2f3f4;}
	.grade_box .table_title2:hover{background-color:#EEF1F6;}
	/* /////////////////여기가 수정끝!!  */
	
	.grade_box{width:100%; padding:40px; background-color:#ffffff;}
	.grade_form{border:1px solid #d1d0d0; padding:30px; width:100%; border-radius:5px; position:relative;}
	.grade_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
	.grade_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
	.grade_form_title select, .grade_form_title input{font-size:14px; border: 1px solid #d1d0d0; border-radius:3px; padding:5px 15px;}
	.grade_form a:hover{color:#ffffff!important;}
	.grade_form_title input{border: none;}
	.grade_form input:focus{outline:none;}
	.grade_form textarea{resize:none;}
	.grade_form1 table th, .grade_form1 table td{border:1px solid #888888; padding:7px; font-size:14px;}
	.grade_form1 table td{text-wrap:nowrap;}
	.grade_form1 table th{text-align:center; background-color:#ebebeb; padding:3px;}
  .close_bt:hover {background-color: #333;}
  select{-webkit-appearance: none; -moz-appearance: none; appearance: none; height: 32px;}
</style>

<sec:authentication property="principal.userVO" var="userVO"/>
<div class="grade_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/grade/gradeList">성적관리</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/grade/objectionList">성적이의신청</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/student/grade/appObjection">이의신청</a></span>
	</div>
	<div class="table_topic">성적이의신청<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	<div class="grade_form">
		<div class="grade_form_title">
			<div style="display: flex; justify-content: space-around;">
				<div>
					<p style="font-size:15px;">소속</p>
					<input value='${creditVO.colNm} ${userVO.studentVO.departmentVO.depNm}' style="font-size: 16px; color:#333333; border:1px solid #ddd;" readonly>
				</div>
				<div>
					<p style="font-size:15px;">학번</p>
					<input value='${userVO.userCd}' style="font-size: 16px; color:#333333; border:1px solid #ddd;" readonly>
				</div>
				<div>
					<p style="font-size:15px;">성명</p>
					<input value='${userVO.userNm}' style="font-size: 16px; color:#333333; border:1px solid #ddd;" readonly>
				</div>
			</div>
		</div>
		<div class="grade_form_title">
			<div style="display: flex; justify-content: space-around;">
				<div>
					<p>수강년도</p>
					<select id="lecaYear" style="width:400px!important;" disabled>
					</select>
				</div>
				<div>
					<p>수강학기</p>
					<select id="lecaSem" style="width:400px!important;" disabled>
						<option value="1">1</option>
						<option value="2">2</option>
					</select>
				</div>
			</div>
		</div>
	</div>
	<table style="margin-top: 20px;">
		<tr class="table_title table_title2">
			<td>수강년도</td>
			<td>수강학기</td>
			<td>강의명</td>
			<td>이수구분</td>
			<td>학점</td>
			<td>담당교수</td>
			<td>등급</td>
			<td>평점</td>
			<td>비고</td>
		</tr>
		<tbody id="gradeTbody">
			
		</tbody>
	</table>
	
	<div class="registModal reg-modal-bg" style="display: none; position: fixed; z-index: 998; top: 0; left: 0; background: rgba(0, 0, 0, 0.4); width: 100%; height: 100%; overflow-y: hidden;">
		<div class="registModal" style="position: absolute; padding: 30px; padding-top: 60px; z-index: 999; width: 800px; height: 800px; background: #ffffff; top: 50%; left: 50%; transform: translate(-50%, -50%);">
			<button type="button" class="btn-two gray mini close_bt" onclick="closeRegistModal()" style="padding:5px 10px; margin-bottom:20px; margin-right: 0; position:fixed; z-index: 999; right: 30px; top:20px; transition:.3s;">닫기 <i class="fa-solid fa-xmark" style="color: #ffffff;"></i></button>
			<div style="width: 600px; height: 100%; margin: 0 auto">
				<div style="height:100%; width:100%; margin: 0 auto;">
					<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
						<span><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></span>
						<span style="font-size:12px; color:#888888;">></span>
						<span style="font-size:12px; color:#888888;">성적관리</span>
						<span style="font-size:12px; color:#888888;">></span>
						<span style="font-size:12px; color:#888888;">학기별 성적조회</span>
					</div>
					<div class="table_topic" style="display: flex; justify-content: space-between;">
						<span>성적이의신청</span>
						<button class="btn-two gray mini" id="btnAuto">자동완성</button>
					</div>
					<div class="grade_form">
						<div class="grade_form_title">
							<div style="display: flex; justify-content: space-around;">
								<div>
									<p>강의명</p>
									<input id="lecaNm" value='' style="width:100%;text-align: left;font-size: 14px;color:#333333;" readonly>
								</div>
								<div>
									<p>담당교수</p>
									<input id="proNm" value='' style="width:100%;text-align: left;font-size: 14px;color:#333333;" readonly>
									<input type="hidden" id="proCd">
								</div>
								<div>
									<p>이수구분</p>
									<input id="lecaType" value='' style="width:100%;text-align: left;font-size: 14px;color:#333333;" readonly>
								</div>
							</div>
						</div>
						<div class="grade_form_title">
							<div style="display: flex;">
								<div>
									<p>학점</p>
									<input id="lecaCrd" value='' style="width:100%;text-align: left;font-size: 14px;color:#333333;" readonly>
								</div>
								<div>
									<p>등급</p>
									<input id="lecGrade" value='' style="width:100%;text-align: left;font-size: 14px;color:#333333;" readonly>
								</div>
								<div>
									<p>평점</p>
									<input id="lecScore" value='' style="width:100%;text-align: left;font-size: 14px;color:#333333;" readonly>
								</div>
							</div>
						</div>
						<div class="grade_form_title">
							<p>이의신청 사유</p>
							<textarea id="objCon" cols="30" rows="10"></textarea>
							<input id="crtrCd" value="" type="hidden">
						</div>
						<div style="display: flex; justify-content: center;">
							<button class="btn-reg sky" id="objectionAppBtn" style="width: 110px; height: 30px; margin-left: 0px; margin-top: 50px; font-size: 13px;">이의신청</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	
	let str = '${jsonGradeList}'.replaceAll("\n", "ddd");
	console.log(str);
  const jsonGradeList = JSON.parse(str);
	
	console.log(jsonGradeList);
	const jsonUserVO = JSON.parse('${jsonUserVO}');
	console.log(jsonUserVO);
  
  let year = new Date().getFullYear();
  let sem = jsonUserVO.studentVO.stuSem;
	const month = new Date().getMonth();
	if (month < 3) year--; sem = 2;
	
  $("#lecaYear").html(`<option value="\${year}" selected>\${year}</option>`);
  $("#lecaSem").val(`\${sem}`);
	
	// 총점을 등급으로
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
	
	// 등급을 평점으로
	function getScore(grade) {
		if (grade == "A+") return 4.5;
		else if (grade == "A") return 4.0;
		else if (grade == "B+") return 3.5;
		else if (grade == "B") return 3.0;
		else if (grade == "C+") return 2.5;
		else if (grade == "C") return 2.0;
		else if (grade == "D+") return 1.5;
		else if (grade == "D") return 1;
		else if (grade == "F") return 0;
		else if (grade == "-") return "-";
	};
	
	// 이수구분
	function getType(lecaType) {
		if (lecaType == 0) return `전공필수`;
		else if (lecaType == 1) return `전공선택`;
		else if (lecaType == 2) return `교양필수`;
		else if (lecaType == 3) return `교양선택`;
	}
	
	let txt = "";
	
	jsonGradeList.forEach(grade => {
		// 진짜
		if (grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaYear == year && grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaSem == sem && grade.objectionVO.appCd == null) {
		// 가짜
		// if (grade.objectionVO.appCd == null) {
			txt += `
				<tr>
					<td>\${grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaYear}</td>
					<td>\${grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaSem}</td>
					<td>\${grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaNm}</td>
					<td>\${getType(grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaType)}</td>
					<td>\${grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaCrd}</td>
					<td>\${grade.gradeCriteriaVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm}</td>
					<td>\${getGrade(grade.lecgSum)}</td>
					<td>\${getScore(getGrade(grade.lecgSum))}</td>
					<td><button style="margin-left:27px;" class="objectionBtn btn-reg pink mini" data-lec-cd="\${grade.gradeCriteriaVO.lecCd}">이의신청</button></td>
				</tr>
				`;
		}
	})
	if (txt.length < 1) {
		txt = '<tr><td colspan="9">이의신청 가능한 강의가 없습니다.</td></tr>';
	}
	$("#gradeTbody").html(txt);
	
	$("#btnAuto").on("click", function() {
		$("#objCon").val(`교수님 안녕하세요. 21학번 전유빈입니다.\n다름이 아니라 제가 생각했던 성적과 조금 달라 문의 드립니다.\n확인 부탁드립니다. 감사합니다.`)
	});
	
	
	// 성적이의신청 버튼
	$(document).on("click", ".objectionBtn", function() {
		const lecCd = $(this).data("lecCd");
		
		jsonGradeList.forEach(grade => {
			if (grade.gradeCriteriaVO.lecCd == lecCd) {
				$("#lecaNm").val(grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaNm);
				$("#proNm").val(grade.gradeCriteriaVO.lectureVO.lectureApplyVO.professorVO.userVO.userNm);
				$("#lecaType").val(getType(grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaType));
				$("#lecaCrd").val(grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaCrd);
				$("#lecGrade").val(getGrade(grade.lecgSum));
				$("#lecScore").val(getScore(getGrade(grade.lecgSum)));
				$("#crtrCd").val(grade.crtrCd);
				$("#proCd").val(grade.gradeCriteriaVO.lectureVO.lectureApplyVO.professorVO.proCd);
			}
		})
		$(".registModal").show();
	});
	
	// 성적이의신청 제출
	$("#objectionAppBtn").on("click", function() {
		
		if ($("#objCon").val().length < 1) {
			alertError("이의신청 사유를 입력해주세요.");
			return;
		}
		
		$.ajax({
			url: "/student/grade/appObjection",
			contentType: "application/json; charset=UTF-8",
			data: JSON.stringify({
				crtrCd: $("#crtrCd").val(),
				objCon: $("#objCon").val(),
				appCd: $("#proCd").val()
			}),
			type: "post",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: res => {
				if (res == 3) {
					closeRegistModal();
					alertSuccess("이의신청을 완료했습니다.", "/student/grade/objectionList");
				}
			}
		})
	})
	// 모달 닫기
	function closeRegistModal() {
		$(".registModal").hide();
	};
</script>