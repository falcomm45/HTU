<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<style>
.recommend_box{width:100%; height:100%; overflow-y:scroll; padding:40px; background-color:#ffffff;}
.recommend_box .table_topic{font-size: 20px; padding-bottom:30px;}
.recommend_box .table_topic i{margin-left:10px;}
.recommend_box table{font-size:13px; width:100%; text-align:center;}
.table_title{font-size:13px; border-top:1px solid #d1d0d0; border-bottom:1px solid #d1d0d0; height:32px; line-height:32px;}
.recommend_box tr{}
.rmlist_box{
    display: flex; justify-content:space-between;
    padding: 20px;
    background-color: #EEF5FF;
    border-radius: 10px;
}

/* .rmlist_box1{display:flex; align-items:center;} */

.rmlist_box input {
	width:120px; text-align:center;
	border: 1px solid #9EB8D9;
	border-radius: 6px;
	font-size: 14px;
}
.rmlist_box input:focus{outline:none;}

.rmlist_box span{font-size: 14px; margin-right:5px;}
.rmlist_content {
	display: flex;
    flex-direction: column;
    gap: 40px;
}

.rmlist_box select{
	border: 1px solid #9EB8D9;
	border-radius: 6px;
	width: 200px; font-size:14px;
}

.rmlist_innerbox{
flex:1;
	display: flex; 
	align-items: center; 
}

.rmlist_label {
    font-size:14px;
    margin-right: 5px;
}

.recommend_box #searchBar{width:300px;}

.recommend_box table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
  background-color: white;
}
/* .recommend_box th, .recommend_box td { */
/*   border: 1px solid #dddddd; */
/*   text-align: left; */
/*   padding: 8px; */
/*   text-wrap: nowrap; */
/* } */
.recommend_box table th {
  background-color: #f2f2f2;
}

.recommend_box tr td:nth-child(1){width:10%;}
.recommend_box tr td:nth-child(2){width:15%;}
.recommend_box tr td:nth-child(3){width:15%;}
.recommend_box tr td:nth-child(4){width:15%;}
.recommend_box tr td:nth-child(5){width:15%;}
.recommend_box tr td:nth-child(6){width:15%;}
.recommend_box tr td:nth-child(6){width:15%;}

.modal-content {
    width: 700px;
    margin: 20px;
    padding: 20px;
    border: 1px solid #dddddd;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin: 20px;
    
}

.free_topic {
	font-size: 30px;
	padding-bottom: 30px;
}

.table_topic {
    font-size: 24px;
/*     font-weight: bold; */
    padding-bottom: 45px;
    display: flex;
    margin-left: 10px;
    position: relative;
}

.info-icon {
    font-size: 24px;
    position: absolute;
    left: 9.5%;
}

.profile_photo_wrap {
    display: flex;
    align-items: center;
    margin-top: -10px;
    margin-bottom: -18px;
    align-items: flex-end;
}

.profile_photo {
    width: 200px;
    height: 165px;
    overflow: hidden;
/*     margin-right: 20px; */
    border: 1px solid #000000;
}

.profile_photo img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.upload_form {
    display: flex;
    flex-direction: column;
    margin-top: 20px;
}

.upload_form input {
    margin-bottom: 10px;
    width: 100%;
}

.upload_form button {
    padding: 10px;
    background-color: #4caf50;
    color: #ffffff;
    border: none;
    cursor: pointer;
}

.modal-content table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
/*     border-radius: 10px; /* 모서리를 곡선으로 만듭니다. */ */
    overflow: hidden;
}

.modal-content th, .profile_wrap td {
    border: 1px solid #dddddd;
    padding: 5px;
    text-align: left;
}

.modal-content th {
    width: 147px;
    font-size: 14px;
    font-weight: bold;
/*     background-color: #f2f2f2; /* th 배경색 추가 */ */
}

.modal-content td {
    padding: 5px;
/*     font-weight: bold; */
    border: 1px solid #dddddd;
}	
.addr{
	margin-bottom: 20px;
}
.stu{
	margin-top: -15px;
}

#recommend{
	margin: 0px;
}
</style>

<sec:authentication property="principal.userVO" var="userVO"/>
<div class="recommend_box">
<%-- 	<input type="text" id="jsonLecture" value='${jsonLecture}' style="display: none;"> --%>
<%-- 	<input type="text" id="jsonUser" value='${jsonUser}' style="display: none;"> --%>
<%-- 	<input type="text" id="jsonBuldCommonList" value='${jsonBuldCommonList}' style="display: none;"> --%>
	<div style="font-size:12px; color:#888888; margin-bottom: 20px;">
		<span><a href="/professor/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/professor/scholarshipRecommend/list">장학관리</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/professor/scholarshipRecommend/list">장학생추천</a></span>
	</div>
	<div class="table_topic">장학생추천<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
	<div class="rmlist_content">
<!-- 		<div class="rmlist_box" > -->
<!-- 		</div> -->
		
		<div class="rmlist_box" style="flex-direction: column;">
			<div style="display:flex; justify-content:space-between; margin-bottom:10px;">
				<div class="rmlist_innerbox">
					<div class="rmlist_label">학과</div>
					<input type="text"  value="${userVO.professorVO.departmentVO.depNm}" readonly>
				</div>
				<div class="rmlist_innerbox" id="scrYear"><div class="rmlist_label">년도</div>
<!-- 				<input type="text" id="scrYear" value="2024"> -->
					<select name="">
						<option value="2022">2022</option>
						<option value="2023">2023</option>
						<option value="2024" selected>2024</option>
					</select>
				</div>
				<div class="rmlist_innerbox" id="scrSem"><div class="rmlist_label">학기</div>
<!-- 					<input type="text" id="scrSem" value="1"> -->
					<select>
						<option value="1">1학기</option>
						<option value="2">2학기</option>
					</select>
				</div>
			</div>
			<div style="display:flex; justify-content:space-between;">
				<div class="rmlist_innerbox"><div class="rmlist_label">학생조회</div>
					<input type="text" id="searchBar" onkeyup="searchFunction(event)">
					<button type="button" class="btn-two green mini" id="searchBtn">검색</button>
				</div>
			</div>
		</div>
	</div>
	
	<input type="hidden" id="proCd" value="${userVO.userCd}" />
	<table style="margin-top: 30px;">
		<tr class="table_title">
			<th style="text-align: center;">no</th>
			<th style="text-align: center;">학생명</th>
			<th style="text-align: center;">학번</th>
			<th style="text-align: center;">학년</th>
			<th style="text-align: center;">학기</th>
			<th style="text-align: center;">학생정보</th>
			<th style="text-align: center;">진행상태</th>
		</tr>
		
		<c:forEach var="studentVO" items="${data}" varStatus="stat">
			<tr>
				<td>${stat.count}</td>
				<td>${studentVO.userVO.userNm}</td>
				<td>${studentVO.stuCd}</td>
				<td>${studentVO.stuYear}</td>
				<td>${studentVO.stuSem}</td>
				<td>
					<button type="button" class="btn-two mini gray" onclick="openStudentModal('${studentVO.stuCd}')">상세</button>
				</td>
				<td>
					<c:if test="${studentVO.approvalVO.appYn eq 0 and empty studentVO.scholarshipRecommendVO.scrCd}">
						-
					</c:if>	
					<c:if test="${studentVO.approvalVO.appYn eq 0 and not empty studentVO.scholarshipRecommendVO.scrCd}">
						대기
					</c:if>	
					<c:if test="${studentVO.approvalVO.appYn eq 1}">
						승인
					</c:if>	
					<c:if test="${studentVO.approvalVO.appYn eq 2}">
						반려
					</c:if>	
				</td>
			</tr>		
		</c:forEach>
	</table>	
</div>
<!-- 모달 창 -->
	<div class="modal fade" id="studentModal" tabindex="-1" role="dialog" aria-labelledby="studentModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
			    
			    	<svg onclick="closeModal()" xmlns="http://www.w3.org/2000/svg" height="16" width="12" 
			   			 viewBox="0 0 384 512" style="cursor: pointer; margin-left: 630px;">
			    		<path fill="#333333" d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
			    	</svg>
			   
			    <div style="width: 600px; height: 100%; margin: 0 auto">
			        <div class="table_topic">학생 정보</div>
	            <div class="modal-body" id="studentDetails" style="margin-top: -30px;"> 
	                <!-- 학생 정보를 동적으로 표시할 부분 -->
	            </div>
	            
	        </div>
	    </div>
	</div>
</div>				
<!-- 모달 종료 -->
	

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">


function searchFunction() {
    var input, filter, table, tr, td, i, txtValue;
//     input: 검색 입력란에 대한 참조를 저장할 변수
//     filter: 사용자가 입력한 검색어를 대문자로 변환하여 저장할 변수
//     table: 검색 대상이 되는 테이블에 대한 참조를 저장할 변수
//     tr: 테이블의 각 행에 대한 NodeList를 저장할 변수
//     td: 각 행에서 검색 대상이 되는 셀에 대한 참조를 저장할 변수
//     i: 반복문에서 사용될 인덱스 변수
//     txtValue: 각 셀의 텍스트 내용을 저장할 변수
    input = document.getElementById("searchBar");
    filter = input.value.toUpperCase();
    table = document.querySelector("table");
    tr = table.getElementsByTagName("tr");

    for (i = 1; i < tr.length; i++) { // 시작 인덱스를 1로 설정하여 테이블 헤더를 제외
        td = tr[i].getElementsByTagName("td")[1]; // 여기서 1은 학생명이 있는 열의 인덱스입니다.
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}

</script>

<script type="text/javascript">

	   
function openStudentModal(stuCd) {
	
		let data = { "stuCd": stuCd };
		console.log("data : ",data);
	
        $.ajax({
            type: "post",
            url: "/professor/scholarshipRecommend/getStudent",
            data: JSON.stringify(data),
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
            success: function(data) {
                // 받아온 학생 정보를 모달에 표시
                console.log(data);
                displayStudentDetails(data);
                // 모달 열기
                $('#studentModal').modal('show');
            },
            error: function(error) {
                console.error("Error fetching student details: " + error);
            }
        });
    }

    // 학생 정보를 모달에 표시하는 함수
function displayStudentDetails(student) {
        // 받아온 학생 정보를 모달에 동적으로 설정
        console.log(student);
        
        let txt = 
        	'<svg xmlns="http://www.w3.org/2000/svg" height="18" width="18" viewBox="0 0 512 512"><path fill="#751c35" d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>' +
            '<span style="margin-left:5px;">인적정보</span>'+
            '<div class="profile_photo_wrap">' +
                '<div class="profile_photo">';
		if (student.filesDetailVO != null) txt += '<img src="/resources/upload/' + student.filesDetailVO.fileSvnm + '" alt="Profile Photo" id="profileImage">';
		else txt += '<img src="/resources/images/unknownperson.jpg" alt="Profile Photo" id="profileImage">';
        txt += '</div>' +
            '<table>' +
                '<tr><th>학번</th><td id="stuCd">' + student.stuCd + '</td></tr>' +
                '<tr><th>이름</th><td>' + student.userVO.userNm + ' <button class="btn-two mini blue" id="recommend" onclick="confirmRecommend()">추천</button></td></tr>' +
                '<tr><th>이름(영문)</th><td>' + student.userVO.userNme + '</td></tr>' +
                '<tr><th>주민등록번호</th><td>' + student.userVO.userReg1 + '-*******</td></tr>' +
                '<tr><th>전화번호</th><td>' + student.userVO.userTel + '</td></tr>' +
                '<tr><th>우편번호</th><td>' + student.userVO.userZip + '</td></tr>' +
            '</table>'+
            '</div>' +
            '<div class="addr">' +
            '<table>' +
                '<tr><th>주소</th><td>' + student.userVO.userAddr1 + '</td></tr>' +
                '<tr><th>상세주소</th><td>' + student.userVO.userAddr2 + '(' + student.userVO.userZip + ')</td></tr>' +
                '<tr><th>이메일</th><td>' + student.userVO.userMail + '</td></tr>' +
           '</table>'+ 
           '</div>' +
           '<svg xmlns="http://www.w3.org/2000/svg" height="18" width="18" viewBox="0 0 512 512"><path fill="#751c35" d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>' +
           '<span style="margin-left:5px;">학적정보</span>'+
           '<div class="stu">' +
           '<table>' +    
                '<tr><th>학년</th><td>' + student.stuYear + '학년</td></tr>' +
                '<tr><th>학기</th><td>' + student.stuSem + '학기</td></tr>' +
                '<tr><th>입학일자</th><td>' + new Date(student.stuAddt).toLocaleDateString() + '</td></tr>' +
                '<tr><th>학점</th><td>' + 4.2 + '</td></tr>' +
           '</table>'+
           '</div>' ;
        
        $('#studentDetails').html(txt);
    }


function closeModal(){
	
	$('#studentModal').modal('hide');
}   
function confirmRecommend() {
    Swal.fire({
        title: "추천하시겠습니까?",
        text: "한번 추천된 신청내역은 다시 되돌릴 수 없습니다.",
        icon: "info",
        width: 600,
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#555555",
        confirmButtonText: "승인",
        cancelButtonText: "취소",
    }).then((result) => {
        if (result.isConfirmed) {
            // 사용자가 확인을 선택한 경우
            submitForm();
        }
    });
}

function submitForm(proCd, stuCd, scrYear, scrSem) {
    var data = {
        proCd: $('#proCd').val(),
        stuCd: $("#stuCd").text(),
        scrYear: "2024",
        scrSem: "1"
    };
	
    console.log(data);
    
    $.ajax({
        url: '/professor/scholarshipRecommend/applySCH?${_csrf.parameterName}=${_csrf.token}',
        contentType: 'application/json;charset=utf-8',
        data: JSON.stringify(data),
        type: 'POST',
        dataType: 'json',
        beforeSend: function(xhr) {
            xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        },
        success: function(result) {
            // AJAX 요청이 성공했을 때의 동작
            if (result == 2) alertSuccess('학생을 추천 하였습니다', '/professor/scholarshipRecommend/recommendApplyList');
            else {
            	alertError("장학생 추천에 실패했습니다.<br> 다시 시도해주세요.");
            	closeModal();
            }
        }
    });
}

</script>
