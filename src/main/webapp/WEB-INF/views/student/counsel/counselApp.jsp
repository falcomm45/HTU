<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<!-- style.css -->
<!-- <link href="/resources/css/counsel.css" rel="stylesheet" type="text/css"> -->
<style>
.counsel_box{width:800px; height:1000px; padding:40px; background-color:#ffffff;}
.table_topic{font-size: 20px; padding-bottom:30px;}

.counsel_form{border:1px solid #d1d0d0; padding:30px; width:100%; height: calc(100% - 35px); border-radius:5px; position:relative;}
.counsel_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
.counsel_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
.counsel_form_title select, .counsel_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
.counsel_margin_left{margin-left:5px;}
.counsel_form a:hover{color:#ffffff!important;}
</style>

<!-- 단과대리스트출력 -->
<input type="text" value='${jsonColeCommonList}' id="jsonColeCommonList" style="display: none;" />
<!-- 학과리스트출력 -->
<input type="text" value='${jsonDepartmentList}' id="jsonDepartmentList" style="display: none;" />
<!-- 교수리스트출력 -->
<input type="text" value='${jsonCounselProList}' id="jsonCounselProList" style="display: none;" />

<div class="counsel_box">
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/counsel/counselList">상담</a></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;"><a href="/student/counsel/counselApp">상담신청</a></span>
	</div>
<form name="frm"
	action="/student/counsel/counselAppPost?${_csrf.parameterName}=${_csrf.token}"
	method="post" enctype="multipart/form-data" class="counsel_form" id="counsel_form">
	<div class="table_topic" style="margin-bottom:40px; padding-bottom:15px; border-bottom:1px solid #d1d0d0;">상담신청</div>
	<!-- 내학번 -->
	<sec:authentication property="principal.userVO" var="userVO" />
	<input type="text" name="stuCd" hidden="hidden"
		value="${userVO.userCd}"> 
	<input type="text" name="appCd"
		hidden="hidden" value="${counselVO.appCd}">
	<input value="${userVO.studentVO.departmentVO.depCd}" id="userDepCd" hidden="hidden">

	<div class="counsel_form_title">
		<p>상담종류</p>
		<select name="comdCd" id="comdCd" value="comdCd">
			<option value="">상담종류선택</option>
			<option value="COUN01">취업상담</option>
			<option value="COUN02">성적상담</option>
			<option value="COUN03">기타상담</option>
		</select>
	</div>
	<div class="counsel_form_title">
		<p>상담교수선택</p>
		<p style="font-size:12px; color:#333333; text-wrap:nowrap; display:block; margin:5px 0 0 5px!important;"> * 단과대, 학과, 교수 순으로 선택해주세요.<p>
		<div style="display:flex;">
			<select id="colNm" name="" style="flex:1;">
                <option value="">단과대학선택</option>
                <c:forEach items="${coleCommonList}" var="collegeVO">
                  <c:if test="${collegeVO.comdCd != 'COLE09' and collegeVO.comdCd != 'COLE99'}">
                    <option value="${collegeVO.comdCd}" 
                    	<c:if test="${collegeVO.comdCd == userVO.studentVO.departmentVO.colCd}">selected</c:if>
                    >${collegeVO.comdNm}</option>
                  </c:if>
                </c:forEach>
              </select>
			
			<select id="depSelect" style="flex:1;" class="counsel_margin_left">
<%--                 <option value="${dep.depCd}">${userVO.studentVO.departmentVO.depNm}</option> --%>
              </select>
			<select name="proCd" id="proSelect" class="counsel_margin_left" style="flex:1;">
				
<!-- 				<option value="none">교수선택</option> -->
			</select>
		</div>
	</div>
	
	<!-- 컨트롤러에서 받아온 오늘날짜 -->
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />

	<div class="counsel_form_title">
		<p>상담희망일자</p>
			<!-- 상담희망일자는 다음날부터 한달이내로만 가능 --> 
			<input type="date" min="${today}" max=""
			required="required" id="cnslDate"
			style="width:222.1px!important;">
	</div>
	<div class="counsel_form_title" style="margin-bottom:100px;">
		<p>상담희망시간</p>
		<select name="" id="cnslTime">
			<option value="none">시간선택</option>
			<option value="09:00">09:00-10:00</option>
			<option value="10:00">10:00-11:00</option>
			<option value="11:00">11:00-12:00</option>
			<option value="13:00">13:00-14:00</option>
			<option value="14:00">14:00-15:00</option>
			<option value="15:00">15:00-16:00</option>
			<option value="16:00">16:00-17:00</option>
			<option value="17:00">17:00-18:00</option>
		</select>
		<input type="text" value="" name="cnslDt" id="cnslDt" style="display:none;"/>
	</div>
	<div class="counsel_form_title" style="margin-bottom:0; margin-top:20px; position:absolute; right:30px; bottom:30px;">
		<!-- btn-reg로 버튼을 두개이상만들때는 두개를 감싸는 div를 만들고 display:flex 꼭 해주세요 -->
		<div style="display:flex;">
			<button class="btn-reg bur" id="form-btn" type="button" onClick="validate();">상담신청</button>
			<a href="/student/counsel/counselList" class="cancel btn-reg back" style="margin-left:10px;">취소</a>
		</div>
	</div>
	<sec:csrfInput />
</form>
</div>
<script>
// $(document).ready(function() {    
// 	$('#form-btn').validate({            
// 		rules: {                
// 			colNm: { required: true },                
// 			depSelect: { required: true },                
// 			proSelect: { required: true },                
// 			cnslDate: { required: true},            
// 		},            
// 		messages: {                
// 			user_id: { required: "단과대를 선택해주세요" },  
// 			depSelect: { required: "학과를 선택해주세요" },                
// 			proSelect: { required: "교수를 선택해주세요" },                
// 			cnslDate: {	required: "희망일자를 선택해주세요" },            
// 		},        
// 		submitHandler: function(){
//             // form 전송 ajax 처리
//         }    
// 						      
// 	});    
// 	});
	
// function validate(){
//     $("#form-btn").validate();
// }

$(document).on("click","#form-btn",function(){
	const cnslDate = $("#cnslDate").val();
	const cnslTime = $("#cnslTime").val();
	$("#cnslDt").val(`\${cnslDate}T\${cnslTime}`);
	console.log(`\${cnslDate}T\${cnslTime}`);
	
	$("#counsel_form").submit();
	
});

//단과대리스트 (input/textarea는 val)
const jsonColeCommonList = JSON.parse($("#jsonColeCommonList").val());
//학과리스트
const jsonDepartmentList = JSON.parse($("#jsonDepartmentList").val());
//교수리스트
const jsonCounselProList = JSON.parse($("#jsonCounselProList").val());
console.log("jsonCounselProList",jsonCounselProList);

// 		function handleChange(event) {
// 	        const colCd = $(event.target).val();
// 	        let appendText = '';
// 	        appendText += `<option value="none"></option>`;
// 	        jsonDepartmentList.forEach(dept => {
// 	            if (dept.colCd == colCd) {
// 	                appendText += `<option value="\${dept.depCd}">\${dept.depNm}</option>`
// 	            }
// 	        })
// 	        $("#selectDept").html("");
// 	        $("#selectDept").append(appendText);
			
// 	    }
$(document).ready(function(){
	function renderDepartment() {
		const colCd = $('#colNm').val();
	    const userDepCd = $('#userDepCd').val();
// 	    console.log(userDepCd);
	    
	    let txt = "";
	    jsonDepartmentList.forEach(dep => {
	      if (dep.colCd == colCd) {
	        txt += `<option value="\${dep.depCd}"
	        `
	        if(dep.depCd == userDepCd){
	        txt += `selected`	
	        }
	        txt += `
	        >\${dep.depNm}</option>`
	      }
	    });
	    $("#depSelect").html(txt);
	}
	renderDepartment();
	
	function renderProfessor() {
		const userDepCd = $('#userDepCd').val();
// 	    console.log(userDepCd);
		    
		    let txt = "";
		    txt+=`<option value="">==교수선택==</option>`
		    jsonCounselProList.forEach(pro => {
		      if (pro.depCd == userDepCd) {
		        txt += `<option value="\${pro.proCd}">\${pro.userVO.userNm}</option>`
		      }
		    });
		    $("#proSelect").html(txt);
	}
	renderProfessor();
});

			$("#colNm").on("change", function() {
			    const colCd = $(this).val();
			    console.log(colCd);
			    
			    let txt = "";
			    txt+=`<option value="">==학과선택==</option>`
			    jsonDepartmentList.forEach(dep => {
			      if (dep.colCd == colCd) {
			        txt += `<option value="\${dep.depCd}">\${dep.depNm}</option>`
			      }
			    });
			    $("#depSelect").html(txt);
			  });
			
			$("#depSelect").on("change", function() {
			    const depCd = $(this).val();
			    console.log(depCd);
			    
			    let txt = "";
			    txt+=`<option value="">==교수선택==</option>`
			    jsonCounselProList.forEach(pro => {
			      if (pro.depCd == depCd) {
			        txt += `<option value="\${pro.proCd}">\${pro.userVO.userNm}</option>`
			      }
			    });
			    $("#proSelect").html(txt);
			  });
        
        
//         function handleChange2(event) {
//             var deptSelect = document.getElementById("depSelect");
//             var selectedDEPT = deptSelect.options[deptSelect.selectedIndex].value;
            
//             console.log("선택된 학과:",selectedDEPT); //COL0101
            
// 			let appendText = '';
// 			appendText+=`<option value="none">==교수선택==</option>`
// 			CounselProList.forEach(pro => {
				
// 				if (pro.depCd == selectedDEPT) {
// 					appendText += `<option value="\${pro.proCd}" name="proCd">\${pro.userVO.userNm}</option>`
// 				}
// 			})
// 			$("#proSelect").html("");
// 			$("#proSelect").append(appendText);
			
//         }
        
    
    </script>