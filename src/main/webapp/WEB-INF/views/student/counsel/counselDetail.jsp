<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
.counsel_box{width:100%; padding:40px; background-color:#ffffff;}
.table_topic{font-size: 20px; padding-bottom:30px;}

.counsel_form{border:1px solid #d1d0d0; padding:30px; width:80%; border-radius:5px; position:relative;}
.counsel_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
.counsel_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
.counsel_form_title select, .counsel_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
.counsel_margin_left{margin-left:5px;}
.counsel_form a:hover{color:#ffffff!important;}
</style>

<span id="deptList" style="display: none;">${jsonDepartmentList}</span>
<span id="proList" style="display: none;">${jsonCounselProList}</span>

<div class="counsel_box">
<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
	<span><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;">상담</span>
	<span style="font-size:12px; color:#888888;">></span>
	<span style="font-size:12px; color:#888888;">상담신청</span>
</div>
<div class="table_topic">상담신청</div>
<form name="frm"
	action="/student/counsel/counselUpdatePost?${_csrf.parameterName}=${_csrf.token}"
	method="post" enctype="multipart/form-data" class="counsel_form">
	<!-- 내학번 -->
	<sec:authentication property="principal.userVO" var="userVO" />
	<input type="text" name="stuCd" hidden="hidden"
		value="stuCd"> 
	<input type="text" name="appCd"
		hidden="hidden" value="${counselVO.appCd}">
	<input type="text" name="cnslCd"
		hidden="hidden" value="${counselVO.cnslCd}">
	<div class="counsel_form_title">
		<p>상담종류</p>
		<select name="comdCd" id="comdCd" value="${counselVO.commonDetailVO.comdNm}">
			<option value="COUN01" <c:if test="${counselVO.comdCd == 'COUN01'}">selected</c:if>>취업상담</option>
			<option value="COUN02" <c:if test="${counselVO.comdCd == 'COUN02'}">selected</c:if>>성적상담</option>
			<option value="COUN03" <c:if test="${counselVO.comdCd == 'COUN03'}">selected</c:if>>기타상담</option>
		</select>
	</div>
	<div class="counsel_form_title">
		<p>상담교수선택</p>
		<p style="font-size:12px; color:#333333; text-wrap:nowrap; display:block; margin:5px 0 0 5px!important;"> * 단과대, 학과, 교수 순으로 선택해주세요.<p>
		<div style="display:flex;">
		<select name="colSelect" id="colSelect"
			onchange="handleChange()">
			<option value="none">==단과대선택==</option>
			<c:forEach var="vo" items="${counselCommon}">
				<c:if test="${vo.comdCd != 'COLE09' && vo.comdCd != 'COLE99'}">
						<option value="${vo.comdCd}">${vo.comdNm}</option>
				</c:if>
			</c:forEach>
		</select> 
		
		<select name="deptSelect" id="deptSelect" onchange="handleChange2()">
			<option value="none">==학과선택==</option>
		</select>

<!-- 		<input value=${counselVO.userVO.userCd} name="proCd"> -->
		
		<select name="proCdd" id="proSelect">
			<option value=" value="${counselVO.userVO.userNm}">==교수선택==</option>
			
		</select>
		</div>
	</div>
	
	<div class="counsel_form_title">
		<p>상담희망일자</p>
		<span> <!-- 상담희망일자는 다음날부터 한달이내로만 가능 --> <input type="date"
			value="${counselVO.cnslDt}" min="2023-11-30" max="2023-12-30" required="required"
			name="cnslDt">
	</div>
	<div class="counsel_form_title">
		<p>상담희망시간</p>
		<select name="" id="">
			<option value="none">==시간선택==</option>
			<option value="">09:00-10:00</option>
			<option value="">10:00-11:00</option>
			<option value="">11:00-12:00</option>
			<option value="">13:00-14:00</option>
			<option value="">14:00-15:00</option>
			<option value="">15:00-16:00</option>
			<option value="">16:00-17:00</option>
			<option value="">17:00-18:00</option>
		</select>
		<!-- <input type="time" value="" min="09:00:00" max="17:00:00" step="1800" required="required"> -->
	</div>
	<div class="counsel_form_title" style="margin-bottom:0; margin-top:20px; position:absolute; right:30px; bottom:30px;">
		<!-- btn-reg로 버튼을 두개이상만들때는 두개를 감싸는 div를 만들고 display:flex 꼭 해주세요 -->
		<div style="display:flex;">
			<button class="btn-reg bur" type="submit" >수정</button>
			<a href="/student/counsel/counselList" class="cancel btn-reg back" style="margin-left:10px;">목록</a>
		</div>
	</div>
	<sec:csrfInput />
</form>
</div>

<script>
		const departmentList = JSON.parse($("#deptList").text());
		console.log(departmentList);
		
        function handleChange() {
            var colSelect = document.getElementById("colSelect");
            var selectedCOL = colSelect.options[colSelect.selectedIndex].value;
            /* console.log("선택된 단과대:",selectedISP); */
			let appendText = '';
			appendText+=`<option value="none">==학과선택==</option>`
			departmentList.forEach(dept => {
				
				if (dept.colCd == selectedCOL) {
					appendText += `<option value="\${dept.depCd}">\${dept.depNm}</option>`
				}
			})
			$("#deptSelect").html("");
			$("#deptSelect").append(appendText);
			
        }
        
        const CounselProList = JSON.parse($("#proList").text());
        
        function handleChange2() {
            var deptSelect = document.getElementById("deptSelect");
            var selectedDEPT = deptSelect.options[deptSelect.selectedIndex].value;
            console.log("선택된 학과:",selectedDEPT); //COL0101
            
			let appendText = '';
			appendText+=`<option value="none">==교수선택==</option>`
			CounselProList.forEach(pro => {
				
				if (pro.depCd == selectedDEPT) {
					appendText += `<option value="\${pro.proCd}" name="proCd">\${pro.userVO.userNm}</option>`
				}
			})
			$("#proSelect").html("");
			$("#proSelect").append(appendText);
			
        }
    </script>