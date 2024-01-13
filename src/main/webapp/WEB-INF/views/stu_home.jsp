<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="/resources/js/gridstack-all.js"></script>
<link rel="stylesheet" href="/resources/css/gridstack.min.css">
<style>

  .grid-stack {
    background-color: #EEF1F6;
  }

  .grid-stack-item {
    background-color: #EEF1F6;
/*     border: 1px solid #ebebeb; */
    padding: 40px;
  }

  /* 각각의 item에 패딩을 줌 */
 .grid-stack-item-content {
    padding:5px;
  }
  
  /* portletlock */
  .portletlock{
    cursor:pointer; position:absolute; z-index:998; right:-2px; top:-2px; width:23px; height:23px; display:flex; justify-content:center; align-items:center; border:1px solid #ebebeb; border-radius:3px; background-color:#ffffff;
  }
  
  /* portlettitle */
  .portlettitle{
     position:absolute; z-index:998; left:-2px; top:-2px; height:23px; display:flex; justify-content:start; align-items:center; border:1px solid #ebebeb; border-radius:3px; background-color:#ffffff;
  }
  .portlettitle a{
  	text-wrap:nowrap; font-size:12px; font-weight:600; color:#555555; display:block; padding:2px 15px;
  }
  
  /* portlet css */
  .main_portlet_wrap{
    background-color: #ffffff; width:100%; height:100%; padding:30px; position:relative;
  }
  .main_portlet_wrap input:focus{outline:none;}
  .pcalender, .pnotice, .palarm{
    font-size: 13px; font-weight: 500; border: 1px solid #dddddd; border-radius:3px 3px 0 0; padding:5px 10px; height:25px; text-wrap: nowrap; white-space: nowrap; background-color: #dddddd; z-index: 997; margin-top: 1px;
  }
  
  .palarm{border-radius:25px; margin: 0 5px; padding:5px 12px; border: 1px solid #dddddd!important; width: 65px; text-align: center; }

  .main_portlet_wrap .active{
    background-color: #ffffff; border-bottom: none;
  }

  .pcalendercon, .pnoticecon, .palarmcon{
    display: none;
    padding: 10px;
  }

  /* fullcalendar css*/
  .main_portlet_wrap .fc-toolbar-title {
    padding-top: 8px;
    font-size: 14px!important;
  }

  .main_portlet_wrap .fc .fc-col-header-cell-cushion{
    font-size: 14px!important;
  }

  .fc .fc-toolbar.fc-header-toolbar{margin-bottom: 5px!important;}
  
  .main_portlet_wrap .fc {width:100%; height: 100%; position: relative;}
  
  .main_portlet_wrap .fc-scrollgrid thead{width:100%; text-align: center;}
  .main_portlet_wrap .fc-scrollgrid .fc-scrollgrid-section-header table .fc-scrollgrid-sync-inner{width: 100%!important; text-align: center;}
  
  .main_portlet_wrap .fc-scrollgrid tbody .fc-scrollgrid-sync-inner{height: calc(100% / 6)!important;}
  .main_portlet_wrap .fc-scrollgrid tbody .fc-scrollgrid-sync-table td{height: calc(100% / 6)!important;}
  
  .main_portlet_wrap .fc-scrollgrid thead .fc-scroller-harness .fc-scroller-liquid-absolute{overflow-y: visible!important;}
  .main_portlet_wrap .fc-col-header{width:100%!important; height:20px!important;}
  .main_portlet_wrap .fc-col-header colgroup {width:calc(100% / 7)!important;}
  
  .main_portlet_wrap .fc-daygrid-day-number {
    font-size: 12px; text-wrap: nowrap;
  }

  .main_portlet_wrap .fc-scrollgrid tbody .fc-daygrid-body{width:100%!important; height:100%!important;}
  .main_portlet_wrap .fc-scrollgrid tbody .fc-daygrid-body table{width:100%!important; height:100%!important;}
  .main_portlet_wrap .fc-daygrid-block-event{
    padding: 3px;
    font-size: 10px;
    color: #ffffff;}
    
   /* counsel css */
   .portletcounsel{border:1px solid #dddddd; width:100%; height:100%;}
   .portletcounsel_th{height:8%!important;}
   .portletcounsel tbody{height:8%!important;}
   .portletcounsel tr{width:100%; height: 100%; text-align:center;}
   .portletcounsel th{border:1px solid #dddddd; font-size:13px;}
   .portletcounsel .tr{height: calc(92% / 6);}
   .portletcounsel .tr td{border:1px solid #dddddd; height: calc(92% / 6); font-size:12px;}
   
   /* record css */
   .portletrecord{border:1px solid #dddddd; width:100%; height:100%;}
   .portletrecord_th{height:8%!important;}
   .portletrecord tbody{height:8%!important;}
   .portletrecord tr{width:100%; height: 100%; text-align:center;}
   .portletrecord th{border:1px solid #dddddd; font-size:13px;}
   .portletrecord .tr{height: calc(92% / 6);}
   .portletrecord .tr td{border:1px solid #dddddd; height: calc(92% / 6); font-size:12px;}
   
   /* score css */
   .portletscore_top{}
   .portletscore_top p{font-size:12px;}
   .portletscore_top select{font-size:12px; height:20px;}
   .portletscore_top option{font-size:12px;}
   .portletscore_top input{font-size:12px; width:25px!important;}
   .portletscore{border:1px solid #dddddd; margin-top:10px; width:100%; height:calc(100% - 30px);}
   .portletscore_th{height:8%!important;}
   .portletscore tbody{height:8%!important;}
   .portletscore tr{width:100%; height: 100%; text-align:center;}
   .portletscore th{border:1px solid #dddddd; font-size:13px;}
   .portletscore .tr{height: calc(92% / 6);}
   .portletscore .tr td{border:1px solid #dddddd; height: calc(92% / 6); font-size:12px;}
   
   /* reserve css */
   .portletreserve{border:1px solid #dddddd; width:100%; height:100%;}
   .portletreserve_th{height:8%!important;}
   .portletreserve tbody{height:8%!important;}
   .portletreserve tr{width:100%; height: 100%; text-align:center;}
   .portletreserve th{border:1px solid #dddddd; font-size:13px;}
   .portletreserve .tr{height: calc(92% / 6);}
   .portletreserve .tr td{border:1px solid #dddddd; height: calc(92% / 6); font-size:12px;}
   
   /* schedule css */
   .portletscore_top{}
   .portletscore_top p{font-size:12px;}
   .portletscore_top select{font-size:12px; height:20px;}
   .portletscore_top option{font-size:12px;}
   .portletscore_top input{font-size:12px; width:25px!important;}
   .portletschedule{border:1px solid #dddddd; width:60%; height:100%;}
   .portletschedule_th{height:8%!important; width:100%; border:1px solid red;}
   .portletschedule tbody{height:8%!important;}
/*    .portletschedule tr{width:100%; height: 100%; text-align:center;} */
   .portletschedule th{border:1px solid #dddddd; font-size:13px; width:20%; text-align:center;}
   .portletschedule .tr{height: calc(92% / 9);}
   .portletschedule .tr td{border:1px solid #dddddd; height: calc(92% / 9); width:20%; font-size:12px;}
   .portletschedule .tr1{border:1px solid red; height: calc(92% / 9); width:100%; font-size:12px;}
   .removeLock{display: none;}
  /* -------------------------팝업 모달창 스타일  시작------------------------- */
  #myModal {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1;
}

#myModal2 {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1;
}

#myModal3 {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 1;
}.modal-content {
	background-color: #fefefe;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 35%;
	position: absolute;
	left: 38%; 
	
	}

.close-button {
    background-color: #4CAF50;
    color: white;
    padding: 5px 17px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-top: -5px;
    width: 80px;
    position: relative;
    left: 84%;
    transition: background-color 0.3s ease;
    font-size: 11px;
    width: 62px;
    bottom: -2px;
}

.close-button:hover {
	background-color: #45a049;
}

.checkToday {
	position: relative;
	bottom: -17px;
}
/* -------------------------팝업 모달창 스타일  끝 ------------------------- */
</style>
<div class="grid-stack"></div>
<sec:authentication property="principal.userVO" var="userVO" />
<!-- 팝업 창 1 -->
	<c:if test="${userVO.comdCd == 'USER01'}">
		<div id="myModal" class="modal" style="width: 100%; max-width: 57%;">
			<div class="modal-content">
				<!-- 이미지 클릭하면 이동할 게시판 링크 -->
				<a href="/common/board/notice/detail?nbCd=NOBD1393"> <!-- 팝업창에 보여주고싶은 이미지 링크 -->
					<img src="/resources/upload/2024/01/01/111.png"
					style="max-width: 100%; height: auto;">
				</a> <label>
					<div class="checkToday">
						<input type="checkbox" id="chkDisablePopup"> 오늘 하루동안 보지 않기
					</div>
				</label>
				<button class="close-button" onclick="closeModal()">닫기</button>
			</div>
		</div>
	</c:if>
	<!-- 팝업 창 1 -->

	<!-- 팝업 창 2 -->
	<c:if test="${userVO.comdCd == 'USER01'}">
		<div id="myModal2" class="modal" style="width: 100%; max-width: 57%;">
			<div class="modal-content">
				<!-- 이미지 클릭하면 이동할 게시판 링크 -->
				<a href="/common/board/notice/detail?nbCd=NOBD1392"> <!-- 팝업창에 보여주고싶은 이미지 링크 -->

					<img src="/resources/upload/2024/01/01/52.png"
					style="max-width: 100%; height: auto;">
				</a> <label>
					<div class="checkToday">
						<input type="checkbox" id="chkDisablePopup2"> 오늘 하루동안 보지
						않기
					</div>
				</label>
				<button class="close-button" onclick="closeModal2()">닫기</button>
			</div>
		</div>
	</c:if>
	<!-- 팝업 창 2 -->

	<!-- 팝업 창 3 -->
	<c:if test="${userVO.comdCd == 'USER01'}">
		<div id="myModal3" class="modal" style="width: 100%; max-width: 57%;">
			<div class="modal-content">
				<!-- 이미지 클릭하면 이동할 게시판 링크 -->
				<a href="/common/board/notice/detail?nbCd=NOBD1394"> <!-- 팝업창에 보여주고싶은 이미지 링크 -->
					<img src="/resources/upload/2024/01/01/32.png"
					style="max-width: 100%; height: auto;">
				</a> <label>
					<div class="checkToday">
						<input type="checkbox" id="chkDisablePopup3"> 오늘 하루동안 보지
						않기
					</div>
				</label>
				<button class="close-button" onclick="closeModal3()">닫기</button>
			</div>
		</div>
	</c:if>
	<!-- 팝업 창 3 -->
<script>
  /* 컨트롤러에서 받아온 userVO값 */
  const jsonUserVO = JSON.parse('${jsonUserVO}');
  console.log(jsonUserVO);
  
  const jsonPortletList = JSON.parse('${jsonPortletList}');
  
  /* 1.프로필 */
//   	<div style="writing-mode: vertical-lr; position:absolute; top:0px; right:-4px; z-index:999; box-sizing:border-box; width:20px; height:100px; background-color:#ffffff; border:1px solid #ebebeb;">
//   	 프로필
//   	</div>
  let content_profile= `
    <div class="main_portlet_wrap">
    <div class="portletlock">
	  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
    </div>
      <div style="position:absolute; width:60%; display:flex; flex-direction:column; align-items:center; top:50%; left:50%; transform:translate(-50%,-50%);">
        <div style="width:100px; height:100px; border-radius: 100px; overflow: hidden;">
  `
  /* 이미지파일이있으면 해당이미지 출력, 없으면 unknown 이미지 출력 */
  if (jsonUserVO.filesDetailVO != null) {
    content_profile += `<img src="/resources/upload/\${jsonUserVO.filesDetailVO.fileSvnm}" style="width:100%; height: 100%; object-fit: cover;"/>`
  } else {
    content_profile += `<img style="width:100%; height: 100%; object-fit: cover;" src="/resources/images/unknownperson.jpg" alt="unknown">`
  }
  content_profile += `    
          <img style="width:100%; height: 100%; object-fit: cover;" src="/resources/images/unknownperson.jpg" alt="unknown">
        </div>
        <a href="/common/mypage/profile">
        <input value='\${jsonUserVO.userNm}' style="cursor:pointer; width:100%; text-align:center; font-size: 18px; font-weight: 500; color:#333333; margin-top:25px;" readonly>
        </a>
        <div style="display: flex; align-items:center; margin-top:10px; text-wrap:nowrap; white-space:nowrap;">
          <input value='\${jsonUserVO.studentVO.departmentVO.depNm}' style="width:100%; text-align:end; font-size: 14px; font-weight: 400; color:#555555;" readonly>
          <span>&nbsp;/&nbsp;</span>
          <input value='\${jsonUserVO.userCd}' style="width:100%; text-align:start; font-size: 14px; font-weight: 400; color:#555555;" readonly>
        </div>
        <div style="display: flex; align-items:center; justify-content:center; margin-top:10px; width:100%; text-wrap:nowrap; white-space:nowrap;">
          <input value='\${jsonUserVO.studentVO.stuYear}학년&nbsp;\${jsonUserVO.studentVO.stuSem}학기' style="width:90px; text-align:center; font-size: 14px; font-weight: 400; color:#555555;" readonly>
          <span style="font-size:14px; color:#888888; margin-left:-5px;">(</span><input value="" id="stuStatus" style="font-size:14px; width:30px; color:#888888;"/><span style="font-size:14px; color:#888888;">)</span>	
        </div>
    </div>
  `
  
  /* 2.캘린더 */
  /* 캘린더(학사일정,개인일정) */
  let content_calender=`
    <div class="main_portlet_wrap">
    <div class="portletlock">
	  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  	</div>
  	<div class="portlettitle">
  	  <a href="/academicCalendar/calendar">일정</a>
  	</div>
      <div style="display:flex; flex-direction:column; align-items:center; width:100%; height:100%; position:relative;">
        <div style="display:flex; top:0; left:0; position:absolute;">
          <a href="#portletschoolcalender" class="pcalender active">학사일정</a>
          <a href="#portletmycalender" class="pcalender">개인일정</a>
        </div>
        <div id="portletschoolcalender" class="pcalendercon pcalendercon1" style="width: 100%; height: calc(100% - 25px); border: 1px solid #dddddd; position:absolute; top:25px;">
          <div id="academicCalendar"></div>
        </div>
        <div id="portletmycalender" class="pcalendercon" style="width: 100%; height: calc(100% - 25px); border: 1px solid #dddddd; position:absolute; top:25px;">
          <div id="myCalendar"></div>
        </div>
      </div>
    </div>
    `
  
  /* 3.커뮤니티 */
  let content_community = `
  <div class="main_portlet_wrap">
  <div class="portletlock">
  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  </div>
  <div class="portlettitle">
  <a href="/common/board/notice/list">커뮤니티</a>
</div>
    <div style="display:flex; flex-direction:column; align-items:center; width:100%; height:100%; position:relative;">
      <div style="display:flex; top:0; left:0; position:absolute;">
        <a href="#portletnotice1" class="pnotice active">공지</a>
        <a href="#portletnotice2" class="pnotice">자유</a>
        <a href="#portletnotice3" class="pnotice">익명</a>
        <a href="#portletnotice4" class="pnotice">홍보</a>
      </div>

      <div id="portletnotice1" class="pnoticecon pnoticecon1" style="width: 100%; height: calc(100% - 25px); border: 1px solid #dddddd; position:absolute; top:25px;">
        <div style="display:flex; align-items:center; padding:10px 5px; border-bottom: 1px solid #dddddd;">
          <div style="flex:5; font-size:13px; color:#333333; overflow:hidden; display:block; text-overflow:ellipsis; white-space:nowrap; word-break: break-all;">
              여기다가 이제 들어갈내용 쌓으시면됨니다 이거 늘어나면 말 다 보이지롱 키키
          </div>
        </div>
      </div>

      <div id="portletnotice2" class="pnoticecon" style="width: 100%; height: calc(100% - 25px); border: 1px solid #dddddd; position:absolute; top:25px;">
        <div style="display:flex; align-items:center; padding:10px 5px; border-bottom: 1px solid #dddddd;">
          <span style="font-size:12px; color:#888888; flex:1;">[자유]</span>
          <div style="flex:5; font-size:13px; color:#333333; overflow:hidden; display:block; text-overflow:ellipsis; white-space:nowrap; word-break: break-all;">
            이거 늘어나면 말 다 보이지롱 키키
          </div>
          <span style="font-size:12px; color:#888888; flex:1;">23.12.11</span>
        </div>
      </div>

      <div id="portletnotice3" class="pnoticecon" style="width: 100%; height: calc(100% - 25px); border: 1px solid #dddddd; position:absolute; top:25px;">
        <div style="display:flex; align-items:center; padding:10px 5px; border-bottom: 1px solid #dddddd;">
          <span style="font-size:12px; color:#888888; flex:1;">[익명]</span>
          <div style="flex:5; font-size:13px; color:#333333; overflow:hidden; display:block; text-overflow:ellipsis; white-space:nowrap; word-break: break-all;">
            익명익명익명익명익명익명익명익명익명익명익명익명익명익명
          </div>
          <span style="font-size:12px; color:#888888; flex:1;">23.12.11</span>
        </div>
      </div>

      <div id="portletnotice4" class="pnoticecon" style="width: 100%; height: calc(100% - 25px); border: 1px solid #dddddd; position:absolute; top:25px;">
        <div style="display:flex; align-items:center; padding:10px 5px; border-bottom: 1px solid #dddddd;">
          <span style="font-size:12px; color:#888888; flex:1;">[홍보]</span>
          <div style="flex:5; font-size:13px; color:#333333; overflow:hidden; display:block; text-overflow:ellipsis; white-space:nowrap; word-break: break-all;">
            홍보홍보홍보홍보홍보홍보홍보홍보홍보홍보홍보홍보홍보홍보홍보홍보
          </div>
          <span style="font-size:12px; color:#888888; flex:1;">23.12.11</span>
        </div>
      </div>

    </div>
  </div>
  `
  
  /* 4.학점 차트 */
  let content_scoreChart = `
  <div class="main_portlet_wrap">
  <div class="portletlock">
  	<svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  </div>
  <div class="portlettitle">
	  <a href="#none;">학점현황</a>
	</div>
  	<div class="dougnut">
  		<canvas id="myChart" style="width: 100%; height: 100%; text-align:center;">
  		</canvas>
  	</div>
  	<div style="font-size:12px; position:absolute; bottom:20px; right:20px;">
  	 <span>이수학점 : </span>
  	 <span id="creditSpan"></span>
  	</div>
  </div>
  `
  
  /* 5. 알림 */
  let content_alarm = `
  <div class="main_portlet_wrap">
  <div class="portletlock">
  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  </div>
  <div class="portlettitle">
  <a href="#none;">알림</a>
</div>
    <div style="display:flex; flex-direction:column; align-items:center; width:100%; height:100%; position:relative;">
      <div style="display:flex; top:0; left:0; position:absolute; margin-left:3px;">
        <a href="#portletalarm1" id="alarmAll" class="palarm active">전체</a>
        <a href="#portletalarm2" id="alarmAcademic" class="palarm">강의</a>
        <a href="#portletalarm3" id="alarmRecord" class="palarm">학적</a>
        <a href="#portletalarm4" id="alarmCounsel" class="palarm">상담</a>
        <a href="#portletalarm5" id="alarmComment" class="palarm">댓글</a>
        <a href="#portletalarm6" id="alarmEtc" class="palarm">기타</a>
      </div>

      <div id="portletalarm1" class="palarmcon palarmcon1" style="width: 100%; height: calc(100% - 40px); border: 1px solid #dddddd; position:absolute; top:40px; overflow-y:scroll;">
        <ul>
          <ol style="height:100%;" id="portletalarm11">
          <ol>
        </ul>
      </div>
        
        
      <div id="portletalarm2" class="palarmcon" style="width: 100%; height: calc(100% - 40px); border: 1px solid #dddddd; position:absolute; top:40px; overflow-y:scroll;">
        <ul>
          <ol style="height:100%;" id="portletalarm21">
          <ol>
        </ul>
      </div>
        
      <div id="portletalarm3" class="palarmcon" style="width: 100%; height: calc(100% - 40px); border: 1px solid #dddddd; position:absolute; top:40px; overflow-y:scroll;">
        <ul>
          <ol style="height:100%;" id="portletalarm31">
          <ol>
        </ul>
      </div>
      
      <div id="portletalarm4" class="palarmcon" style="width: 100%; height: calc(100% - 40px); border: 1px solid #dddddd; position:absolute; top:40px; overflow-y:scroll;">
        <ul>
          <ol style="height:100%;" id="portletalarm41">
          <ol>
        </ul>
      </div>
      
      <div id="portletalarm5" class="palarmcon" style="width: 100%; height: calc(100% - 40px); border: 1px solid #dddddd; position:absolute; top:40px; overflow-y:scroll;">
        <ul>
          <ol style="height:100%;" id="portletalarm51">
          <ol>
        </ul>
      </div>
      
      <div id="portletalarm6" class="palarmcon" style="width: 100%; height: calc(100% - 40px); border: 1px solid #dddddd; position:absolute; top:40px; overflow-y:scroll;">
        <ul>
          <ol style="height:100%;" id="portletalarm61">
          <ol>
        </ul>
      </div>
      

    </div>
  </div>
  `
  
  /* 6.내강의실 */
  /* 마지막 div 안에 해당학기 강의가 존재하지않습니다 만들어주세요 */
  let content_classroom = `
  <div class="main_portlet_wrap" style="height:100%;">

  <div class="portletlock">
  	<svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  </div>
  <div class="portlettitle">
	  <a href="/student/lecture/list">내 강의실</a>
	</div>
    <div id="lectureDiv" style="display:grid; grid-template-columns: 1fr 1fr 1fr; grid-template-rows: 1fr 1fr; gap:20px 15px;">
    </div>
    <div id="lectureDiv2" style="background-color:#ffffff; justify-content:space-between; color:#888888; font-size:14px; display:flex; align-items:center; padding-bottom:10px; border-bottom:1px solid #ebebeb;">
      <span>현재 학기에 수강중인 강의가 없습니다.&nbsp;&nbsp;</span>
      <a href="/student/enrolment/app" style="border:1px solid #888888; padding:5px 10px; border-radius:3px;">수강신청바로가기</a>
    </div>
  </div>
  `
  
  /* 7.상담관리*/
  let content_counsel = `
    <div class="main_portlet_wrap">
    <div class="portletlock">
	  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  	</div>
  	<div class="portlettitle">
	  <a href="/student/counsel/counselList">상담</a>
	</div>
      <table class="portletcounsel">
        <tr class="portletcounsel_th">
          <th>no</th>
          <th>상담종류</th>
          <th>신청일</th>
          <th>교수명</th>
          <th>승인여부</th>
        </tr>
      </table>
    </div>
  `
  
  /* 8.학적변동조회*/
  let content_record = `
    <div class="main_portlet_wrap">
    <div class="portletlock">
	  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  	</div>
  	<div class="portlettitle">
	  <a href="/student/academicAdmin/recordList">학사행정</a>
	</div>
      <table class="portletrecord">
        <tr class="portletrecord_th">
          <th>no</th>
          <th>년도 / 학기</th>
          <th>변동구분</th>
          <th>승인일자</th>
          <th>승인상태</th>
        </tr>
      </table>
    </div>
  `
  
    /* 9.성적조회*/
  let content_score = `
    <div class="main_portlet_wrap">
    <div class="portletlock">
	  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  	</div>
  	<div class="portlettitle">
	  <a href="/student/grade/gradeList">성적관리</a>
	</div>
  		<div class="portletscore_top" style="display:flex; align-items:center; justify-content:space-between;">
	  		<div style="display:flex; align-items:center;">
			  <select id="gradeStuYear">
			  	<option value="1" selected>1</option>
			  	<option value="2">2</option>
			  	<option value="3">3</option>
			  	<option value="4">4</option>
			  </select>
        <p style="margin-right:7px;">학년</p>  
        <select id="gradeStuSem">
          <option value="1" selected>1</option>
          <option value="2">2</option>
        </select>
        <p>학기</p>  
      </div>
		  	<div style="display:flex; align-items:center;">
		  		<p>신청 : </p> 
		  		<input value="${creditVO.stdCredit}" readonly/>
		  		<p>취득 : </p> 
		  		<input id="currentCrd" value="" readonly/>
		  	</div>
		  </div>
      <table class="portletscore">
        <tr class="portletscore_th">
          <th>no</th>
          <th>교과목명</th>
          <th>이수구분</th>
          <th>학점</th>
          <th>평가</th>
        </tr>
      </table>
    </div>
  `
  
  /* 10.시설예약조회*/
  let content_reserve = `
    <div class="main_portlet_wrap">
    <div class="portletlock">
	  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  	</div>
  	<div class="portlettitle">
	  <a href="/reservation/current">시설예약</a>
	</div>
      <table class="portletreserve">
        <tr class="portletreserve_th">
          <th>no</th>
          <th>장소</th>
          <th>예약일</th>
          <th>시간</th>
          <th>비고</th>
        </tr>
      </table>
    </div>
  ` 
  /* 11.시간표*/
  let content_schedule = `
    <div class="main_portlet_wrap" style="display:flex; align-items:start; justify-content:space-between;">
    <div class="portletlock">
	  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  	</div>
  	<div class="portlettitle">
	  <a href="#none;">시간표</a>
	</div>
		<div class="portletscore_top" style="display:flex; align-items:center; width:35%;">
		  <select id="stuYear">
		  	<option value="1" selected>1</option>
		  	<option value="2">2</option>
		  	<option value="3">3</option>
		  	<option value="4">4</option>
		  </select>
	      <p style="margin-right:7px;">학년</p>  
	  	  <select id="stuSem">
	  	  	<option value="1" selected>1</option>
	  	  	<option value="2">2</option>
	  	  </select>
	  	  <p>학기</p>  
	  	</div>	
      <table class="portletschedule">
      <div id="timeDiv" style="display:flex; flex-direction:column; justify-content:center; align-items:center; height:100%;">
      	<div style="font-size:10px; font-color:#555555; height:10%; line-height:8%;"></div>
      	<div style="font-size:10px; font-color:#555555; height:10%; line-height:calc(92% / 9);">09</div>
      	<div style="font-size:10px; font-color:#555555; height:10%; line-height:calc(92% / 9);">10</div>
      	<div style="font-size:10px; font-color:#555555; height:10%; line-height:calc(92% / 9);">11</div>
      	<div style="font-size:10px; font-color:#555555; height:10%; line-height:calc(92% / 9);">12</div>
      	<div style="font-size:10px; font-color:#555555; height:10%; line-height:calc(92% / 9);">13</div>
      	<div style="font-size:10px; font-color:#555555; height:10%; line-height:calc(92% / 9);">14</div>
      	<div style="font-size:10px; font-color:#555555; height:10%; line-height:calc(92% / 9);">15</div>
      	<div style="font-size:10px; font-color:#555555; height:10%; line-height:calc(92% / 9);">16</div>
      	<div style="font-size:10px; font-color:#555555; height:10%; line-height:calc(92% / 9);">17</div>
      <div>
        <tr class="portleschedule_th">
          <th>M</th>
          <th>T</th>
          <th>W</th>
          <th>T</th>
          <th>F</th>
        </tr>
	    <tr class="tr tr1">
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    
	    <tr class="tr tr1">
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr class="tr tr1">
	    <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr class="tr tr1">
	    <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr class="tr tr1">
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr class="tr tr1">
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr class="tr tr1">
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr class="tr tr1">
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
	    <tr class="tr tr1">
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	      <td></td>
	    </tr>
      </table>
    </div>
  ` 
  
  
  /* 포틀릿 */
  
  let items = [
    {x: 0, y: 0, w: 3, h: 3, content: content_profile, noMove: true, noResize: true ,label:"PORT01"}, 
    {x: 3, y: 0, w: 4, h: 5, content: content_calender, noMove: true, noResize: true ,label:"PORT03"},
    {x: 7, y: 0, w: 5, h: 2, content: content_community, noMove: true, noResize: true ,label:"PORT04"},
    {x: 0, y: 3, w: 3, h: 2, content: content_scoreChart, noMove: true, noResize: true ,label:"PORT02"}, 
    {x: 0, y: 6, w: 4, h: 3, content: content_alarm, noMove: true, noResize: true ,label:"PORT06"},
    {x: 7, y: 3, w: 5, h: 3, content: content_classroom, noMove: true, noResize: true ,label:"PORT05"},
    {x: 4, y: 5, w: 4, h: 3, content: content_counsel, noMove: true, noResize: true ,label:"PORT07"},
    {x: 8, y: 5, w: 4, h: 3, content: content_record, noMove: true, noResize: true ,label:"PORT08"},
    {x: 0, y: 9, w: 4, h: 3, content: content_score, noMove: true, noResize: true ,label:"PORT09"},
    {x: 4, y: 9, w: 4, h: 3, content: content_reserve, noMove: true, noResize: true ,label:"PORT10"},
    {x: 8, y: 9, w: 4, h: 3, content: content_schedule, noMove: true, noResize: true ,label:"PORT11"},
  ];
  
  if (jsonPortletList.length > 0) {
    items = items.filter(item => {
      const portletVO = jsonPortletList.find(portlet => item.label == portlet.comdCd);
      if (portletVO) {
        item.x = portletVO.porX;
        item.y = portletVO.porY;
        item.w = portletVO.porW;
        item.h = portletVO.porH;
        return true;
      } else {
        return false;
      }
    });
  }
  
  const grid = GridStack.init({
    cellHeight: '7rem',
  });
  grid.load(items, true);
  


  /* 2-2.캘린더 */
  // 해당 카테고리의 캘린더를 렌더링하는 함수
  function renderCalendar(id) {
    const eventList = [];
    if (id == 'academicCalendar') {
      $.ajax({
        url: "/academicCalendar/renderHome",
        dataType: "json",
        type: "get",
        async: false,
        success: res => {
          res.forEach(item => {
            let stdt = getPattern(item.acStdt);
            let eddt = getPattern(item.acEddt);
            let obj = {
              "title": item.acTitle,
              "id": item.acCd,
              "start": stdt,
              "end": eddt
            }
            eventList.push(obj);
          })
        }
      })
    } else {
      $.ajax({
          url: "/myCalendar/renderHome",
          dataType: "json",
          type: "get",
          async: false,
          success: res => {
            res.forEach(item => {
              let stdt = getPattern(item.mcStdt);
              let eddt = getPattern(item.mcEddt);
              let obj = {
                "userCd": item.userCd,
                "title": item.mcTitle,
                "id": item.mcCd,
                "start": stdt,
                "end": eddt
              };
              eventList.push(obj);
            })
          }
        })
    }
    
    let calendarEl = document.querySelector('#'+id);
    let calendar = new FullCalendar.Calendar(calendarEl, {
      locale: "ko",
      initialView: "dayGridMonth",
      headerToolbar: {
        left: "",
        center: "title",
        right: "",
      },
      eventDisplay: "block",
      height: "",
      events: eventList,
      // events: [{
      //   title: "asdf",
      //   start: "2023-12-18",
      //   end: "2023-12-23",
      //   id: "ACAD1"
      // }],
    })
    calendar.render();
  }
  
  // 승인구분
  function getAppYn(appYn) {
    if (appYn == 0) return "대기";
    else if (appYn == 1) return "승인";
    else if (appYn == 2) return "반려";
  }
  
  // yyyy-MM-dd 형식
  function getPattern(dateNo) {
    const date = new Date(dateNo);
    return `\${date.getFullYear()}-\${(date.getMonth() + 1).toString().padStart(2, '0')}-\${date.getDate().toString().padStart(2, '0')}`;
  }
  
  // yy.MM.dd 형식
  function getPattern2(dateNo) {
    if (dateNo == null) return "-";
    const date = new Date(dateNo);
    return `\${(date.getFullYear() % 100).toString().padStart(2, '0')}.\${(date.getMonth() + 1).toString().padStart(2, '0')}.\${date.getDate().toString().padStart(2, '0')}`;
  }
  
  // HH:mm 형식
  function getPattern3(dateNo) {
    const date = new Date(dateNo);
    return `\${date.getHours().toString().padStart(2,'0')}:\${date.getMinutes().toString().padStart(2,'0')}`;
  }
  
  /* 3-2. 커뮤니티 */
  function renderNotice() {
    $.ajax({
      url: "/common/board/notice/renderHome",
      dataType: "json",
      type: "get",
      success: res => {
        let txt = "";
        res.forEach(notice => {
          const datePattern = getPattern2(notice.nbReg);
          txt += `
            <div style="display:flex; align-items:center; padding:10px 5px; border-bottom: 1px solid #dddddd; height:25%;">
              <span style="font-size:12px; color:#888888; flex:1;">[공지]</span>
              <div style="flex:5; font-size:13px; color:#333333; overflow:hidden; display:block; text-overflow:ellipsis; white-space:nowrap; word-break: break-all; 
                cursor: pointer;" onclick="location.href='/common/board/notice/detail?nbCd=\${notice.nbCd}'">
                \${notice.nbTitle}
              </div>
              <span style="font-size:12px; color:#888888; flex:1;">\${datePattern}</span>
            </div>
          `
        })
        $("#portletnotice1").html(txt);
      }
    });
  }
  
  function renderBoard(cate) {
    let category = "";
    let int = 0;
    if (cate == '자유') {
      category = 'free';
      int = 2;
    } else if (cate == "홍보") {
      category = 'publicize';
      int = 4;
    } else if (cate == "익명") {
      category = "anonymous";
      int = 3;
    }
    
    $.ajax({
      url: "/common/board/renderHome?category="+category,
      dataType: "json",
      type: "get",
      success: res => {
        let txt = "";
        res.forEach(board => {
          const datePattern = getPattern2(board.bdReg);
          txt += `
            <div style="display:flex; align-items:center; padding:10px 5px; border-bottom: 1px solid #dddddd; height:25%;">
              <span style="font-size:12px; color:#888888; flex:1;">[\${cate}]</span>
              <div style="flex:5; font-size:13px; color:#333333; overflow:hidden; display:block; text-overflow:ellipsis; white-space:nowrap; word-break: break-all; 
                cursor: pointer;" onclick="location.href='/common/board/\${category}/detail?bdCd=\${board.bdCd}'">
                \${board.bdTitle}
              </div>
              <span style="font-size:12px; color:#888888; flex:1;">\${datePattern}</span>
            </div>
          `
        })
        $("#portletnotice" + int).html(txt);
      }
    })
  }
  
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
		if (grade == "A+") return "4.5";
		else if (grade == "A") return "4.0";
		else if (grade == "B+") return "3.5";
		else if (grade == "B") return "3.0";
		else if (grade == "C+") return "2.5";
		else if (grade == "C") return "2.0";
		else if (grade == "D+") return "1.5";
		else if (grade == "D") return "1";
		else if (grade == "F") return "0";
		else if (grade == "-") return "-";
	};
  
  
  $(document).ready(function () {
    
    const stuYear = jsonUserVO.studentVO.stuYear;
    const stuSem = jsonUserVO.studentVO.stuSem;
    let lectureArr = [];
    
    /* 시간표학년선택 */
    function renderYearAndSem(id) {
      let txt = "";
      for(let i = 1; i <= stuYear; i++) {
        if (i == stuYear) txt += `<option value="\${i}" selected>\${i}</option>`;
        else txt += `<option value="\${i}">\${i}</option>`;
      }
      $("#" + id + "Year").html(txt);
      txt = "";
      for(let i = 1; i <= stuSem; i++) {
        if (i == stuSem) txt += `<option value="\${i}" selected>\${i}</option>`;
        else txt += `<option value="\${i}">\${i}</option>`
      }
      $("#" + id + "Sem").html(txt);
    };
    
    renderYearAndSem("stu");
    renderYearAndSem("gradeStu");
    
    $("#gradeStuYear").on("change", function() {
      let txt = "";
      if ($(this).val() == stuYear) {
        for(let i = 1; i <= stuSem; i++) {
          if (i == stuSem) txt += `<option value="\${i}" selected>\${i}</option>`;
          else txt += `<option value="\${i}">\${i}</option>`
        }
      } else {
        txt = `<option value="1">1</option><option value="2">2</option>`
      }
      $("#gradeStuSem").html(txt);
    });
    
    $("#stuYear").on("change", function() {
      let txt = "";
      if ($(this).val() == stuYear) {
        for(let i = 1; i <= stuSem; i++) {
          if (i == stuSem) txt += `<option value="\${i}" selected>\${i}</option>`;
          else txt += `<option value="\${i}">\${i}</option>`
        }
      } else {
        txt = `<option value="1">1</option><option value="2">2</option>`
      }
      $("#stuSem").html(txt);
    });
    
    
    /* 포틀릿잠금 */
    $(document).on("click", ".portletlock", function(){
      let svg = `<svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"></path></svg>`
      let newsvg = `<svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M224 64c-44.2 0-80 35.8-80 80v48H384c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80V144C80 64.5 144.5 0 224 0c57.5 0 107 33.7 130.1 82.3c7.6 16 .8 35.1-15.2 42.6s-35.1 .8-42.6-15.2C283.4 82.6 255.9 64 224 64zm32 320c17.7 0 32-14.3 32-32s-14.3-32-32-32H192c-17.7 0-32 14.3-32 32s14.3 32 32 32h64z"></path></svg>`
      ;
      if($(".portletlock").html().trim()===svg){
        $(".portletlock").html(newsvg);
        document.querySelectorAll('.grid-stack-item').forEach(item => {
          grid.movable(item, true, false);
          grid.resizable(item, true, false);
        })
      }else{
        $(".portletlock").html(svg);
        document.querySelectorAll('.grid-stack-item').forEach(item => {
          grid.movable(item, false, false);
          grid.resizable(item, false, false);
        })
        const gridItems = grid.getGridItems();
        const savePortletArr = [];
        gridItems.forEach(item => {
          item = item.gridstackNode;
          savePortletArr.push({
            porX: item.x,
            porY: item.y,
            porW: item.w,
            porH: item.h,
            comdCd: item.label,
            userCd: jsonUserVO.userCd
          })
        });
        $.ajax({
          url: "/common/appPortlet",
          type: "post",
          contentType: "application/json; charset=UTF-8",
          traditional: true,
          data: JSON.stringify(savePortletArr),
          beforeSend:function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
          },
          success: res => {
            if (jsonUserVO.comdCd == 'USER01') alertSuccess("포틀릿 설정을 완료했습니다.", "/student/mypage");
            else if (jsonUserVO.comdCd == 'USER02') alertSuccess("포틀릿 설정을 완료했습니다.", "/professor/mypage");
            else alertSuccess("포틀릿 설정을 완료했습니다.", "/employee/mypage");
          }
        })
      };
    });
    
    localStorage.setItem("active", "대시보드");
    $.each($(".nav-link"), function(index, item) {
      if ($(item).text().trim() == "대시보드") $(item).addClass("active");
      else $(item).removeClass("active");
    })
    
    //처음엔 학사일정을 보여준다
    $('.pcalendercon1').show();
    renderCalendar("academicCalendar");
    //버튼클릭에 따라 학사일정 또는 개인일정 한개만 보이게 한다
    $(".pcalender").on("click", function (e) {
      e.preventDefault();
      var targetId = $(this).attr('href');
      $('.pcalendercon').hide();
      $(targetId).show();
      $(this).addClass('active');
      $(this).siblings().removeClass('active');
      
      const cate = $(this).text();
      if (cate == "학사일정") renderCalendar("academicCalendar");
      else renderCalendar("myCalendar");
    })
    
    //처음엔 공지사항을 보여준다
    $('.pnoticecon1').show();
    renderNotice();
    //버튼클릭에 따라 한개만 보이게 한다
    $(".pnotice").on("click", function (e) {
      e.preventDefault();
      var targetId = $(this).attr('href');
      $('.pnoticecon').hide();
      $(targetId).show();
      $(this).addClass('active');
      $(this).siblings().removeClass('active');
      
      const cate = $(this).text();
      if (cate == "공지") renderNotice();
      else renderBoard(cate);
    })
    
    //처음엔 알람1을 보여준다
    $('.palarmcon1').show();
    renderNotice();
    //버튼클릭에 따라 한개만 보이게 한다
    $(".palarm").on("click", function (e) {
      e.preventDefault();
      var targetId = $(this).attr('href');
      $('.palarmcon').hide();
      $(targetId).show();
      $(this).addClass('active');
      $(this).siblings().removeClass('active');
    })
    
    /* 4. 학점 차트 */
    // 학점 정보를 바탕으로 chart rendering
    const chartCanvas = document.querySelector('#myChart');
    // 졸업까지 남은 이수학점
    const resCrd = jsonUserVO.studentVO.departmentVO.collegeVO.colCrd - jsonUserVO.studentVO.stuMrc -jsonUserVO.studentVO.stuMoc - jsonUserVO.studentVO.stuCrc - jsonUserVO.studentVO.stuCoc;
    const myChart = new Chart(chartCanvas, {
      type: "doughnut",
      data: {
        labels: ['전필', '전선', '교필', '교선', '잔여'],
        datasets: [{
          data: [
            jsonUserVO.studentVO.stuMrc,
            jsonUserVO.studentVO.stuMoc,
            jsonUserVO.studentVO.stuCrc,
            jsonUserVO.studentVO.stuCoc,
            resCrd],
          backgroundColor : [
            '#304D63',
            '#B2E7E8',
            '#8FB9AA',
            '#F2D096',
            '#ED8975'
          ],
          hoverOffset : 4,
        }]
      },
      options: {
        responsive: false,
        plugins: {
          legend: {
            position: 'right',
            labels: {
              pointStyle: 'circle',
              userPointStyle: true,
              padding: 10,
            }
          }
        },
        layout: {
          padding: {
            left: 10,
            right: 20,
            top: 10,
            bottom: 10
          }
        },
        maintainAspectRatio: false,
        aspectRatio : 2
      }
    });
    $("#creditSpan").text(`\${jsonUserVO.studentVO.stuMrc + jsonUserVO.studentVO.stuMoc + jsonUserVO.studentVO.stuCrc + jsonUserVO.studentVO.stuCoc}/\${jsonUserVO.studentVO.departmentVO.collegeVO.colCrd}`)
    
    /* 6. 현재 학기 강의 목록 */
    $.ajax({
      url: "/student/getLectureList",
      contentType: "application/json; charset=UTF-8",
      dataType: "json",
      data: JSON.stringify({
        stuCd: jsonUserVO.userCd, 
        stuYear: jsonUserVO.studentVO.stuYear,
        stuSem: jsonUserVO.studentVO.stuSem
      }),
      type: "post",
      beforeSend:function(xhr){
        xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
      },
      success: res => {
        lectureArr = res;
        let txt = "";
        res.forEach(lecture => {
          let type = "";
          if (lecture.lectureApplyVO.lecaType == 0) type = "전필"
          else if (lecture.lectureApplyVO.lecaType == 1) type = "전선"
          else if (lecture.lectureApplyVO.lecaType == 2) type = "교필"
          else if (lecture.lectureApplyVO.lecaType == 3) type = "교선"
          txt += `
          <div style="display:flex; flex-direction:column;">
            <div style="width:100%; height:100%; border-radius:3px 3px 0 0; padding:3px; background-color:#5F8670;">
              <input value="\${lecture.lectureApplyVO.lecaNm}(\${type})" style="padding:10px 0 0 0; text-align:center; color:#ffffff; font-size:13px; width:100%; background-color:#5F8670;" readonly/>
              <input value="\${lecture.lectureApplyVO.professorVO.userVO.userNm}" style="padding:0 10px 5px 0; text-align:end; color:#ffffff; font-size:11px; width:100%; background-color:#5F8670;" readonly />
            </div>
            <div style="width:100%; height:100%; border-radius:0 0 3px 3px; padding:20px; border: 1px solid #ebebeb; background-color:#ffffff; position:relative;">
              <div style="position:absolute; right:5px; bottom:10px; cursor:pointer;" onclick="location.href='/student/lecture/detail?lecCd=\${lecture.lecCd}'">
                <span style="font-size:11px;">강의실</span>
                <svg xmlns="http://www.w3.org/2000/svg" height="12" width="12" viewBox="0 0 576 512"><path fill="#333333" d="M352 224H305.5c-45 0-81.5 36.5-81.5 81.5c0 22.3 10.3 34.3 19.2 40.5c6.8 4.7 12.8 12 12.8 20.3c0 9.8-8 17.8-17.8 17.8h-2.5c-2.4 0-4.8-.4-7.1-1.4C210.8 374.8 128 333.4 128 240c0-79.5 64.5-144 144-144h80V34.7C352 15.5 367.5 0 386.7 0c8.6 0 16.8 3.2 23.2 8.9L548.1 133.3c7.6 6.8 11.9 16.5 11.9 26.7s-4.3 19.9-11.9 26.7l-139 125.1c-5.9 5.3-13.5 8.2-21.4 8.2H384c-17.7 0-32-14.3-32-32V224zM80 96c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16H400c8.8 0 16-7.2 16-16V384c0-17.7 14.3-32 32-32s32 14.3 32 32v48c0 44.2-35.8 80-80 80H80c-44.2 0-80-35.8-80-80V112C0 67.8 35.8 32 80 32h48c17.7 0 32 14.3 32 32s-14.3 32-32 32H80z"/></svg>
              </div>
            </div>
          </div>
          `
        })
        if (txt.length > 0) {
          $("#lectureDiv2").remove();
          $("#lectureDiv").html(txt);
        }
      }
    })
    
    
    /* 7. 상담현황 */
    $.ajax({
      url: "/student/counsel/renderHome?stuCd="+jsonUserVO.userCd,
      dataType: "json",
      type: "get",
      success: res => {
        let txt = "";
        let int = 1;
        let cate = "";
        let appYn = "";
        res.forEach(counsel => {
          
          if (counsel.comdCd == "COUN01") cate = "취업상담";
          else if (counsel.comdCd == "COUN02") cate = "성적상담";
          else if (counsel.comdCd == "COUN03") cate = "기타상담";
          
          if (counsel.approvalVO.appYn == 0) appYn = "대기";
          else if (counsel.approvalVO.appYn == 1) appYn = "승인";
          else if (counsel.approvalVO.appYn == 2) appYn = "반려";
          
          txt += `
            <tr class="tr">
              <td>\${int}</td>
              <td>\${cate}</td>
              <td>\${getPattern2(counsel.cnslDt)}</td>
              <td>\${counsel.userVO.userNm}</td>
              <td>\${appYn}</td>
            </tr>
          `;
          int++;
        });
        if (res.length < 6) {
          for (let i = 0; i < 6 - res.length; i++) {
            txt += `<tr class="tr"><td></td><td></td><td></td><td></td><td></td></tr>`
          }
        }
        $(".portletcounsel").append(txt);
      }
    });
    
    /* 8. 학적변동조회 */
    $.ajax({
      url: "/student/getRecord?stuCd="+jsonUserVO.userCd,
      dataType: "json",
      type: "get",
      success: res => {
        let txt = "";
        let int = 1;
        let cate = "";
        let appYn = "";
        res.forEach( record => {
          txt += `
            <tr class="tr">
              <td>\${int}</td>
              <td>\${record.recYear} / \${record.recSem}</td>
              <td>\${record.commonDetailVO.comdNm}</td>
              <td>\${getPattern2(record.approvalVO.appProdt)}</td>
              <td>\${getAppYn(record.approvalVO.appYn)}</td>
            </tr>
          `;
          int++;
        })
        if (res.length < 6) {
          for (let i = 0; i < 6 - res.length; i++) {
            txt += `<tr class="tr"><td></td><td></td><td></td><td></td><td></td></tr>`
          }
        }
        $(".portletrecord").append(txt);
      }
    });
    
    function renderGrade(stuYear, stuSem) {
      $.ajax({
        url: "/student/getGrade",
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        data: JSON.stringify({
          stuSem: stuSem,
          stuYear: stuYear,
          stuCd:jsonUserVO.userCd
        }),
        type: "post",
        beforeSend:function(xhr){
          xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success: res => {
          let currentCrd = 0;
          let cnt = 1;
          let type = "";
          let txt = "";
          let gradee = "";
          res.forEach(grade => {
            currentCrd += grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaCrd;
            
            if (grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaType == 0) type = "전필"
            else if (grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaType == 1) type = "전선"
            else if (grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaType == 2) type = "교필"
            else if (grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaType == 3) type = "교선"
            
            if (grade.lecgGrade) gradee = grade.lecgGrade;
            else if(grade.lecgSum) gradee = getGrade(grade.lecgSum);
            else gradee = "-";
            
            txt += `
              <tr class="tr">
                <td>\${cnt}</td>
                <td>\${grade.gradeCriteriaVO.lectureVO.lectureApplyVO.lecaNm}</td>
                <td>\${type}</td>
                <td>\${getScore(gradee)}</td>
                <td>\${gradee}</td>
              </tr>
            `
            cnt++;
          });
          if (res.length < 6) {
            for (let i = 0; i < 6 - res.length; i++) {
              txt += `<tr class="tr"><td></td><td></td><td></td><td></td><td></td></tr>`
            }
          };
          $("#currentCrd").val(currentCrd);
          $(".portletscore").append(txt);
        }
      })
    }
    
    renderGrade(stuYear, stuSem);
    
    /* 9. 성적조회 */
    $("#gradeStuSem").on("change", function() {
      const stuSem = $(this).val();
      const stuYear = $("#gradeStuYear").val();
      $(".portletscore tbody tr:gt(0)").remove();
      $(".portletscore").children().each((i, item) => {if (i != 0) $(item).remove();});
      renderGrade(stuYear, stuSem);
    });
    
    $("#gradeStuYear").on("change", function() {
      const stuYear = $(this).val();
      const stuSem = $("#gradeStuSem").val();
      $(".portletscore tbody tr:gt(0)").remove();
      $(".portletscore").children().each((i, item) => {if (i != 0) $(item).remove();});
      renderGrade(stuYear, stuSem);
    })
    
    
    /* 10. 예약현황조회 */
    $.ajax({
      url: "/student/getReservationList?userCd="+jsonUserVO.userCd,
      dataType: "json",
      type: "get",
      success: res => {
        res.splice(6);
        let int = 1;
        let txt = "";
        res.forEach(reservation => {
          txt += `
            <tr class="tr">
              <td>\${int}</td>
              <td>\${reservation.commonDetailVO.comdNm}-\${reservation.roomCd.substr(6)}</td>
              <td>\${getPattern2(reservation.resStdt)}</td>
              <td>\${getPattern3(reservation.resStdt)}</td>
              <td></td>
            </tr>
          `
          int++;
        });
        if (res.length < 6) {
          for (let i = 0; i < 6 - res.length; i++) {
            txt += `<tr class="tr"><td></td><td></td><td></td><td></td><td></td></tr>`
          }
        }
        $(".portletreserve").append(txt);
      }
    })
    /* 11. 시간표조회 */
    function renderTimeTable(stuYear, stuSem) {
      const timeTableColor = ["#F2E8E8", "#FFE9E9", "#F9E9D9", "#FFF8CC", "#F0F9CC", "#DAEFE6", "#DCEEF0"];
      $.ajax({
        url: "/student/getTimeTable",
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        type: "post",
        data: JSON.stringify({stuSem:stuSem, stuYear:stuYear, stuCd:jsonUserVO.userCd}),
        beforeSend:function(xhr){
          xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success: res => {
          let colorIndex = 0;
          res.forEach(enrolment => {
            const dayArr = enrolment.lectureVO.lectureScheduleVO.lecDay.split("/");
            const startHour = new Date(enrolment.lectureVO.lectureScheduleVO.lecsStdt).getHours().toString().padStart(2,'0');
            const endHour = new Date(enrolment.lectureVO.lectureScheduleVO.lecsEddt).getHours().toString();
            const time = new Date(enrolment.lectureVO.lectureScheduleVO.lecsEddt).getHours() - new Date(enrolment.lectureVO.lectureScheduleVO.lecsStdt).getHours();
            let x = 0;
            $("#timeDiv").children().each((i,item) => {
              if (startHour == $(item).text()) x = i - 1;
            })
            let y = 0;
            dayArr.forEach(day => {
              if (day == '월요일') y = 0;
              else if (day == '화요일') y = 1;
              else if (day == '수요일') y = 2;
              else if (day == '목요일') y = 3;
              else if (day == '금요일') y = 4;
              const trs = $(".tr.tr1");
              
              for(let i = x; i < x + time; i++) {
                $(trs[i]).children().each((j, td) => {
                  if (j == y) $(td).css("background-color", timeTableColor[colorIndex]);
                });
              };
            });
            colorIndex++;
          });
        }
      })
    }
    
    renderTimeTable(stuYear, stuSem);
    
    $("#stuSem").on("change", function() {
      $(".portletschedule td").css("background-color", "white");
      const stuSem = $(this).val();
      const stuYear = $("#stuYear").val();
      renderTimeTable(stuYear, stuSem);
    });
    
    $("#stuYear").on("change", function() {
      $(".portletschedule td").css("background-color", "white");
      const stuSem = $("#stuSem").val();
      const stuYear = $(this).val();
      renderTimeTable(stuYear, stuSem);
    })
    
    
    checkPopup();
    checkPopup2();
    checkPopup3();
  });
  
  /* 학생의 학정상태를 받아오기위함 */
  $.ajax({
      url: "/student/stuStatus",
      type: "get",
      contentType: "application/json; charset=UTF-8",
      beforeSend: function (xhr) {
          xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      },
      success: function (res) {
      	console.log(res); 
      	
      	if(res == "RECD01"){$("#stuStatus").val("재학")}
      	else if(res == "RECD02"){$("#stuStatus").val("휴학")}
      	else if(res == "RECD03"){$("#stuStatus").val("자퇴")}
      	else if(res == "RECD04"){$("#stuStatus").val("재적")}
      	else{$("#stuStatus").val("졸업")}
      	
  	},
  	 error: function (xhr) {
           console.log(xhr);
       }
   })
  
  
   /* 팝업 스크립트 시작 */
   /////////////////////////////////////////// 첫 번째 팝업창 시작  ////////////////////////////////////////////////
// 팝업이 표시되어야 하는지 확인
function checkPopup() {
// 팝업을 비활성화하는 쿠키가 있는지 확인
var isPopupDisabled = getCookie("disablePopup");
// 쿠키가 없으면 팝업을 표시
if (!isPopupDisabled) {
displayModal();
}
}

// 팝업을 표시
function displayModal() {
// 팝업 요소 가져오기
var modal = document.getElementById("myModal");
// 팝업을 표시
modal.style.display = "block";
}

// 팝업을 닫기
function closeModal() {
// 팝업 요소를 가져옵오기
var modal = document.getElementById("myModal");
// "오늘 다시 보지 않기" 체크박스 가져오기
var chkDisablePopup = document.getElementById("chkDisablePopup");

// 체크박스가 체크되어 있으면, 팝업을 하루 동안 비활성화하는 쿠키를 설정
if (chkDisablePopup.checked) {
setCookie("disablePopup", "true", 1); // 1일 동안
}

// 팝업을 숨김
modal.style.display = "none";
}

// 쿠키 설정
// @param {string} name 쿠키 이름
// @param {string} value 쿠키 값
// @param {number} days 쿠키 유효 기간 (일 단위)
function setCookie(name, value, days) {
var expires = "";
if (days) {
// 유효 기간을 설정
var date = new Date();
date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
expires = "; expires=" + date.toUTCString();
}
// 쿠키를 설정
document.cookie = name + "=" + value + expires + "; path=/";
}

// 쿠키를 가져오기
// @param {string} name 쿠키 이름
// @returns {string} 쿠키 값 (존재하지 않으면 null)
function getCookie(name) {
var nameEQ = name + "=";
var ca = document.cookie.split(';');
for (var i = 0; i < ca.length; i++) {
var c = ca[i];
while (c.charAt(0) === ' ') c = c.substring(1, c.length);
if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length, c.length);
}
return null;
}

/////////////////////////////////////////// 첫 번째 팝업창 끝 ////////////////////////////////////////////////

/////////////////////////////////////////// 두 번째 팝업창 시작 ////////////////////////////////////////////////

// 두 번째 팝업이 표시되어야 하는지 확인
function checkPopup2() {
  console.log("zzzz");
// 두 번째 팝업을 비활성화하는 쿠키가 있는지 확인
var isPopupDisabled = getCookie("disablePopup2");
// 쿠키가 없으면 두 번째 팝업을 표시
if (!isPopupDisabled) {
displayModal2();
}
}

// 두 번째 팝업을 표시
function displayModal2() {
// 두 번째 팝업 요소를 가져오기
var modal = document.getElementById("myModal2");
// 두 번째 팝업을 표시
modal.style.display = "block";
}

// 두 번째 팝업을 닫기
function closeModal2() {
// 두 번째 팝업 요소를 가져오기
var modal = document.getElementById("myModal2");
// 두 번째 팝업의 "오늘 다시 보지 않기" 체크박스 가져오기
var chkDisablePopup = document.getElementById("chkDisablePopup2");

// 체크박스가 체크되어 있으면, 두 번째 팝업을 하루 동안 비활성화하는 쿠키 설정
if (chkDisablePopup.checked) {
setCookie("disablePopup2", "true", 1); // 1일
    }

    modal.style.display = "none";
}

/////////////////////////////////////////// 두번째 팝업창 끝 ////////////////////////////////////////////////

/////////////////////////////////////////// 세 번째 팝업창 시작 ////////////////////////////////////////////////

//3 번째 팝업이 표시되어야 하는지 확인
function checkPopup3() {
// 3 번째 팝업을 비활성화하는 쿠키가 있는지 확인
var isPopupDisabled = getCookie("disablePopup3");
// 쿠키가 없으면 두 번째 팝업을 표시
if (!isPopupDisabled) {
displayModal3();
}
}

// 3 번째 팝업을 표시
function displayModal3() {
// 3 번째 팝업 요소를 가져오기
var modal = document.getElementById("myModal3");
// 3 번째 팝업을 표시
modal.style.display = "block";
}

// 3 번째 팝업을 닫기
function closeModal3() {
// 3 번째 팝업 요소를 가져오기
var modal = document.getElementById("myModal3");
// 3 번째 팝업의 "오늘 다시 보지 않기" 체크박스 가져오기
var chkDisablePopup = document.getElementById("chkDisablePopup3");

// 체크박스가 체크되어 있으면, 두 번째 팝업을 하루 동안 비활성화하는 쿠키 설정
if (chkDisablePopup.checked) {
setCookie("disablePopup3", "true", 1); // 1일
    }

    modal.style.display = "none";
}

/////////////////////////////////////////// 세 번째 팝업창 끝 ////////////////////////////////////////////////


  
</script>