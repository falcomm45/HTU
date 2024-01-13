<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	.crewInfoTbl {width: 100%; height: 70%; font-size: 20px;}
	.crewInfoHeader {font-size: 25px; padding-bottom: 20px;font-weight: bold;}
	.crewInfoTbl-title {padding-right: 5px; }
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
	#craAddBtn {float: right;color: white;}
	#craAddBtn2 {float: right; padding-right: 30px;}
	ul.tabs{margin: 0px; padding: 0px; list-style: none;}
	ul.tabs li{border-radius: 5px 5px 0 0; background: #eaeaea; color: #222;
		display: inline-block; padding: 10px 15px; cursor: pointer;}
	ul.tabs li.current{border-radius: 5px 5px 0 0; background: #ffffff; color: #222;}
	.tab-content{display: none; background: #ffffff; padding: 15px; border-radius: 5px;}
	.tab-content.current{display: inherit;}
	ul.tabs li:hover {background-color: #ced1d7;}
.lecture_menu{height:30px; align-items:center;}
	.lecture_menu a{border:1px solid #ebebeb; box-sizing:border-bos; background-color:#ebebeb; width:calc(100% / 7); text-align:center; border-radius:5px 5px 0 0;}
	.lecture_menu a.effect{background-color:#ffffff; box-sizing: border-box; border:1px solid #ffffff;}
	.btn-reg:hover{color:#ffffff;}
</style>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.userVO" var="userVO" />
</sec:authorize>
<div style="display:flex;" class="lecture_menu">
	<a href="/professor/lecture/detail?lecCd=${param.lecCd}" class="sub_menu_a ">홈</a>
	<a href="/professor/lecturenotice/list?lecCd=${param.lecCd}" class="sub_menu_a ">공지사항</a>
    <a href="/professor/task/list?lecCd=${param.lecCd}" class="sub_menu_a effect">과제</a>
    <a href="/professor/test/testList?lecCd=${param.lecCd}" class="sub_menu_a">시험</a>
    <a href="/professor/lectureAttendance?lecCd=${param.lecCd}" class="sub_menu_a">출결관리</a>
    <a href="/professor/lecturedata/list?lecCd=${param.lecCd}" class="sub_menu_a">자료실</a>
    <a href="/professor/objection/list?lecCd=${param.lecCd}" class="sub_menu_a">성적이의신청</a>
</div>
<div class="crewDetail">

	<div class="crewIndex">
		<div class="crewDivbox">
			<div class="crewDiv1">
				<div class="crewInfo">
					<div class="crewInfoHeader">
						<p>${taskVO.taskNm}</p>
					</div>
					<table class="crewInfoTbl">
						<tr>
							<td class="crewInfoTbl-title">등록일&nbsp;:&nbsp;<fmt:formatDate value="${taskVO.taskReg}" pattern="yyyy-MM-dd"/></td>
						</tr>
						<tr>
							<td class="crewInfoTbl-title">마감일&nbsp;:&nbsp;<fmt:formatDate value="${taskVO.taskEddt}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="crew_box">
				<div class="table_topic">과제내용</div>
				<div class="crTb">
				${taskVO.taskCon}
				</div>
					<c:forEach var="vo" items="${taskVO.filesDetailVOList}">
						<p><a href="/resources/upload/${vo.fileSvnm}" download="${vo.fileOrnm}" style="margin: 10px 0;">첨부파일명&nbsp;:&nbsp;${vo.fileOrnm}<svg xmlns="http://www.w3.org/2000/svg" height="14" width="12" viewBox="0 0 448 512">!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.<path fill="#686868" d="M364.2 83.8c-24.4-24.4-64-24.4-88.4 0l-184 184c-42.1 42.1-42.1 110.3 0 152.4s110.3 42.1 152.4 0l152-152c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-152 152c-64 64-167.6 64-231.6 0s-64-167.6 0-231.6l184-184c46.3-46.3 121.3-46.3 167.6 0s46.3 121.3 0 167.6l-176 176c-28.6 28.6-75 28.6-103.6 0s-28.6-75 0-103.6l144-144c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-144 144c-6.7 6.7-6.7 17.7 0 24.4s17.7 6.7 24.4 0l176-176c24.4-24.4 24.4-64 0-88.4z"/></svg></a></p>
					</c:forEach>
			</div>
		</div>
			
		<div class="crewContent">
			<div class="crewContentTab">
				<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1">제출인원</li>
					<li class="tab-link" data-tab="tab-2">미제출 인원</li>
				</ul>
				
				<div id="tab-1" class="tab-content current" style="text-align: left;">
				<div class="crewActivity">
						<div class="crewActivityHeader">
							<span style="text-align: left;">제출 인원</span>
							<c:if test="${taskVO.taskEddt < sysdate}">
								<div style="display: flex;">
									<div style="flex: 1;margin: 0 5px 0 1150px;"><button type="button" id="submitAuto" class="btn-reg bur" style="color: white;">자동입력</button></div>
									<div style="flex: 1;"><button type="button" id="craAddBtn" class="btn-reg bur" style="color: white;">점수입력</button></div>
								</div>
							</c:if>
						</div>
						
						<c:if test="${empty taskSubmitList}">
							<div style="text-align: center; padding-top: 75px; color: #333333; font-size: 14px;">제출 학생이 없습니다</div>
						</c:if>
						<c:forEach var="taskSubmitVO" items="${taskSubmitList}" varStatus="loop"> 
							<div class="crewAct">
								<div style="display: flex;" class="scoreDiv">
									<div style="flex: 1;"><a type="button" style="font-weight: bold;" class="actBtn" data-cra-cd="">${taskSubmitVO.taskSubmitVO.studentVO.userVO.userNm}(${taskSubmitVO.taskSubmitVO.studentVO.departmentVO.depNm})</a></div>
									<c:choose>
									<c:when test="${taskSubmitVO.taskSubmitVO.tsubScore eq 0}">
										<div class="scoreDiv" id="scoreDiv_${loop.index}">
										<!-- <로 바꿔야됨 --><c:if test="${taskVO.taskEddt < sysdate}"><div style="flex: 1;text-align: right;">점수&nbsp;:&nbsp;<input type="hidden"  class="tsubCd" value="${taskSubmitVO.taskSubmitVO.tsubCd}"/><input type="number" class="score" style="border-top: 0;border-left: 0;border-right: 0;border-bottom: 1px solid #888888;outline: none;"/></div></c:if>
										</div>
										<c:if test="${taskVO.taskEddt > sysdate}"><div style="flex: 1;text-align: right;">점수입력기간이 아닙니다.</div></c:if>
									</c:when>
									<c:otherwise>
										<div style="flex: 1;text-align: right;">점수&nbsp;:&nbsp;${taskSubmitVO.taskSubmitVO.tsubScore}&nbsp;/&nbsp;100</div>
									</c:otherwise>
									</c:choose>
								</div>
								<p style="font-weight: bold;"></p>
								<c:forEach var="vo" items="${taskSubmitVO.taskSubmitVO.filesDetailVOList}">
								<p><a href="/resources/upload/${vo.fileSvnm}" download="${vo.fileOrnm}">첨부파일명&nbsp;:&nbsp;${vo.fileOrnm}<svg xmlns="http://www.w3.org/2000/svg" height="14" width="12" viewBox="0 0 448 512">!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.<path fill="#686868" d="M364.2 83.8c-24.4-24.4-64-24.4-88.4 0l-184 184c-42.1 42.1-42.1 110.3 0 152.4s110.3 42.1 152.4 0l152-152c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-152 152c-64 64-167.6 64-231.6 0s-64-167.6 0-231.6l184-184c46.3-46.3 121.3-46.3 167.6 0s46.3 121.3 0 167.6l-176 176c-28.6 28.6-75 28.6-103.6 0s-28.6-75 0-103.6l144-144c10.9-10.9 28.7-10.9 39.6 0s10.9 28.7 0 39.6l-144 144c-6.7 6.7-6.7 17.7 0 24.4s17.7 6.7 24.4 0l176-176c24.4-24.4 24.4-64 0-88.4z"/></svg></a></p>
								</c:forEach>
								<p>제출일&nbsp;:&nbsp;<fmt:formatDate value="${taskSubmitVO.taskSubmitVO.tsubDt}" pattern="yyyy년 MM월 dd일 HH시 mm분"/></p>
							</div>
						</c:forEach>
					</div>

				</div>
				<div id="tab-2" class="tab-content" style="text-align: left;">
				<div class="crewActivity">
						<div class="crewActivityHeader">
							<span style="text-align: left;">미제출 인원</span>
<!-- 							<a type="button" id="craAddBtn2" class="btn-reg bur">점수입력</a> -->
						</div>
						<c:if test="${empty noTaskSubmitList}">
							<div style="text-align: center; padding-top: 75px; color: #333333; font-size: 14px;">미제출 학생이 없습니다</div>
						</c:if>
						<c:forEach var="noTaskSubmitVO" items="${noTaskSubmitList}" varStatus="loop"> 
							<div class="crewAct">
								<div style="display: flex;" class="scoreDiv">
									<div style="flex: 1;"><a type="button" style="font-weight: bold;" class="actBtn" data-cra-cd="">${noTaskSubmitVO.taskSubmitVO.studentVO.userVO.userNm}(${noTaskSubmitVO.taskSubmitVO.studentVO.departmentVO.depNm})</a></div>
									<c:choose>
									<c:when test="${noTaskSubmitVO.taskSubmitVO.tsubScore eq 0}">
										<div class="noSubmitScoreDiv" id="scoreDiV_${loop.index}">
										<!-- <로 바꿔야됨 --><c:if test="${taskVO.taskEddt < sysdate}"><div style="flex: 1;text-align: right;">점수&nbsp;:&nbsp;0&nbsp;/&nbsp;100</div></c:if>
										</div>
										<c:if test="${taskVO.taskEddt > sysdate}"><div style="flex: 1;text-align: right;">점수입력기간이 아닙니다.</div></c:if>
									</c:when>
									<c:otherwise>
										<div style="flex: 1;text-align: right;">점수&nbsp;:&nbsp;0&nbsp;/&nbsp;100</div>
									</c:otherwise>
									</c:choose>
								</div>
								<p style="font-weight: bold;"></p>
<%-- 								<p>제출일&nbsp;:&nbsp;<fmt:formatDate value="${taskSubmitVO.taskSubmitVO.tsubDt}" pattern="yyyy년 MM월 dd일 HH시 mm분"/></p> --%>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript">
    logout = function () {
        $("#logoutForm").submit();
    }
    $(function () {
    	$("#lecNm").text($(".lectureName").text());

        $('ul.tabs li').click(function () {
            var tab_id = $(this).attr('data-tab');

            $('ul.tabs li').removeClass('current');
            $('.tab-content').removeClass('current');

            $(this).addClass('current');
            $("#" + tab_id).addClass('current');
        });

        $('.btnTsubCd').on('click', function () {
            const tsubCd = $(this).data('tsubCd');
            console.log('tsubCd', tsubCd);
        });

        $("#btnTaskUpdate").on("click", function () {
            $('.free_box').hide();
            $('.container').show();
        });

        $("#btnUpdateCancle").on("click", function () {
            sweetConfirmUpdateCancle();
        });

        function sweetConfirmUpdateCancle() {
            Swal.fire({
                text: "수정을 취소 하시겠습니까?",
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
                    $('.free_box').show();
                    $('.container').hide();
                } else {

                }
            });
        }

        $("#btnCancle").on("click", function () {
            location.href = "/professor/task/list?lecCd=" + ${taskVO.lecCd};
        });

        $("#btnDelete").on("click", function () {
            console.log("딜리트버튼")

            data = {
                "taskCd": $("#taskCd").val()
            };
            $.ajax({
                url: "/professor/task/delete?${_csrf.parameterName}=${_csrf.token}",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(data),
                type: "post",
                dataType: "json",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (result) {
                    sweetConfirmDelete();
                }
            });
        });

        function sweetConfirmDelete() {
            Swal.fire({
                text: "삭제하시겠습니까?",
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
                    alertSuccess("삭제되었습니다.", "/professor/task/list?lecCd=" + ${taskVO.lecCd});
                } else {
                    // "아니오"를 클릭했을 때의 동작
                    alertError('삭제 취소하였습니다.');
                }
            });
        }

        $("#btnTaskSubmit").on("click", function () {
            sweetConfirmUpdate();
        });

        function sweetConfirmUpdate() {
            Swal.fire({
                text: "수정하시겠습니까?",
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
                    $('#taskFrm').submit();
                } else {
                    // "아니오"를 클릭했을 때의 동작
                    alertError('수정을 취소하였습니다.');
                }
            });
        }
        
        $('#submitAuto').on('click', function(){
        	 var dataArray = [];
             $("[id^=scoreDiv_]").each(function (index) {
                 var tsubCd = $(this).find(".tsubCd").val();
                 var score = $(this).find(".score").val(100);
                 var data = {
                     "tsubCd": tsubCd,
                     "tsubScore": score
                 };
                 dataArray.push(data);
                 console.log("array" , dataArray);
             });
        });

        $("#craAddBtn").on("click", function () {
            var dataArray = [];

            $("[id^=scoreDiv_]").each(function (index) {
                var tsubCd = $(this).find(".tsubCd").val();
                var score = $(this).find(".score").val();
                var data = {
                    "tsubCd": tsubCd,
                    "tsubScore": score
                };
                dataArray.push(data);
                console.log("array" , dataArray);
            });
            $.ajax({
                url: "/professor/taskSubmitScore/update?${_csrf.parameterName}=${_csrf.token}",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(dataArray),
                type: "post",
                dataType: "json",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (result) {
                    console.log("result =>", result);
                    alertSuccess("과제점수를 등록하였습니다." ,"/professor/task/list?lecCd=" + ${param.lecCd});
                }
            });
        });
        
        $("#craAddBtn2").on("click", function () {
            var dataArray = [];

            $("[id^=scoreDiV_]").each(function (index) {
                var tsubCd = $(this).find(".tsubCd2").val();
                var score = $(this).find(".score2").val();
                var data = {
                    "tsubCd": tsubCd,
                    "tsubScore": score
                };
                dataArray.push(data);
            });
            $.ajax({
                url: "/professor/noTaskSubmitScore/update?${_csrf.parameterName}=${_csrf.token}",
                contentType: "application/json;charset=utf-8",
                data: JSON.stringify(dataArray),
                type: "post",
                dataType: "json",
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                },
                success: function (result) {
                	console.log("result =>", result);
                	alertSuccess("과제점수를 등록하였습니다." ,"/professor/task/list?lecCd=" + ${param.lecCd});
                	
                }
            });
        });
});

</script>



