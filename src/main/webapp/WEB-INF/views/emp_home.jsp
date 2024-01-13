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
  
  .palarm{border-radius:25px; margin: 0 5px; padding:5px 8px; border: 1px solid #dddddd!important; width: 45px;}

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
</style>

<div class="grid-stack"></div>


<script>
  const jsonUserVO = JSON.parse('${jsonUserVO}');
  const jsonPortletList = JSON.parse('${jsonPortletList}');
  
  console.log(jsonUserVO);
  
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
          <input value='\${jsonUserVO.employeeVO.empDept}' style="width:100%; text-align:end; font-size: 14px; font-weight: 400; color:#555555;" readonly>
          <span>&nbsp;/&nbsp;</span>
          <input value='\${jsonUserVO.userCd}' style="width:100%; text-align:start; font-size: 14px; font-weight: 400; color:#555555;" readonly>
        </div>
        <div style="display: flex; align-items:center; margin-top:10px; text-wrap:nowrap; white-space:nowrap;">
          <input value='\${jsonUserVO.employeeVO.empPos}' style="width:100%; text-align:center; font-size: 14px; font-weight: 400; color:#555555;" readonly>
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
      <div style="display:flex; top:0; left:0; position:absolute;">
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
  
  /* 6.강의계획신청 */
  let content_lectureApply = `
    <div class="main_portlet_wrap">
    <div class="portletlock">
	  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  	</div>
  	<div class="portlettitle">
	  <a href="/student/grade/gradeList">강의계획신청</a>
	</div>
  		<div class="portletscore_top" style="display:flex; align-items:center; justify-content:space-between;">
	  		<div style="display:flex; align-items:center;">
        <p style="margin-right:7px;">결제상태</p>  
			  <select id="lectureAppYn">
			  	<option value="0" selected>대기</option>
			  	<option value="1">승인</option>
			  	<option value="2">반려</option>
			  </select>
      </div>
		  	<div style="display:flex; align-items:center;">
		  		<input id="lectureAppCnt" value="" style="text-align: right;" readonly/>
		  		<p>건</p> 
		  	</div>
		  </div>
      <table class="portletscore" id="lectureApplyTable">
        <tr class="portletscore_th">
          <th>no</th>
          <th>교과목명</th>
          <th>신청교수</th>
          <th>신청일</th>
          <th>상태</th>
        </tr>
      </table>
    </div>
  `
  
  /* 7.학적변동내역 */
  let content_recordApply = `
    <div class="main_portlet_wrap">
    <div class="portletlock">
	  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  	</div>
  	<div class="portlettitle">
	  <a href="/student/grade/gradeList">학적변동내역</a>
	</div>
  		<div class="portletscore_top" style="display:flex; align-items:center; justify-content:space-between;">
	  		<div style="display:flex; align-items:center;">
        <p style="margin-right:7px;">결제상태</p>  
			  <select id="recordAppYn">
			  	<option value="0" selected>대기</option>
			  	<option value="1">승인</option>
			  	<option value="2">반려</option>
			  </select>
      </div>
		  	<div style="display:flex; align-items:center;">
		  		<input id="recordCnt" value="" style="text-align: right;" readonly/>
		  		<p>건</p> 
		  	</div>
		  </div>
      <table class="portletscore" id="recordTable">
        <tr class="portletscore_th">
          <th>no</th>
          <th>학생</th>
          <th>신청학적</th>
          <th>신청일</th>
          <th>상태</th>
        </tr>
      </table>
    </div>
  `
  
  /* 8.기숙사 신청 내역 */
  let content_dormitoryApply = `
    <div class="main_portlet_wrap">
    <div class="portletlock">
	  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  	</div>
  	<div class="portlettitle">
	  <a href="/student/grade/gradeList">기숙사신청내역</a>
	</div>
  		<div class="portletscore_top" style="display:flex; align-items:center; justify-content:space-between;">
	  		<div style="display:flex; align-items:center;">
        <p style="margin-right:7px;">결제상태</p>  
			  <select id="dormitoryAppYn">
			  	<option value="0" selected>대기</option>
			  	<option value="1">승인</option>
			  	<option value="2">반려</option>
			  </select>
      </div>
		  	<div style="display:flex; align-items:center;">
		  		<input id="dormitoryCnt" value="" style="text-align: right;" readonly/>
		  		<p>건</p> 
		  	</div>
		  </div>
      <table class="portletscore" id="dormitoryTable">
        <tr class="portletscore_th">
          <th>no</th>
          <th>학생</th>
          <th>기숙사</th>
          <th>신청일</th>
          <th>상태</th>
        </tr>
      </table>
    </div>
    
  `
  /* 9.신고 내역 */
  let content_report = `
    <div class="main_portlet_wrap">
    <div class="portletlock">
	  <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
  	</div>
  	<div class="portlettitle">
	  <a href="/student/grade/gradeList">신고내역</a>
	</div>
  		<div class="portletscore_top" style="display:flex; align-items:center; justify-content:space-between;">
	  		<div style="display:flex; align-items:center;">
        <p style="margin-right:7px;">결제상태</p>  
			  <select id="reportAppYn">
			  	<option value="0" selected>대기</option>
			  	<option value="1">승인</option>
			  	<option value="2">반려</option>
			  </select>
      </div>
		  	<div style="display:flex; align-items:center;">
		  		<input id="reportCnt" value="" style="text-align: right;" readonly/>
		  		<p>건</p> 
		  	</div>
		  </div>
      <table class="portletscore" id="reportTable">
        <tr class="portletscore_th">
          <th>no</th>
          <th>신고자</th>
          <th>신고사유</th>
          <th>신청일</th>
          <th>상태</th>
        </tr>
      </table>
    </div>
  `
  
  let items = [
    {x: 0, y: 0, w: 3, h: 3, content: content_profile, noMove: true, noResize: true ,label:"PORT01"}, 
    {x: 3, y: 0, w: 4, h: 5, content: content_calender, noMove: true, noResize: true ,label:"PORT03"},
    {x: 7, y: 0, w: 5, h: 2, content: content_community, noMove: true, noResize: true ,label:"PORT04"},
    {x: 0, y: 3, w: 3, h: 2, content: content_report, noMove: true, noResize: true ,label:"PORT15"}, 
    {x: 0, y: 6, w: 4, h: 3, content: content_alarm, noMove: true, noResize: true ,label:"PORT06"},
    {x: 7, y: 3, w: 5, h: 3, content: content_lectureApply, noMove: true, noResize: true ,label:"PORT12"},
    {x: 4, y: 5, w: 4, h: 3, content: content_recordApply, noMove: true, noResize: true ,label:"PORT13"},
    {x: 8, y: 5, w: 4, h: 3, content: content_dormitoryApply, noMove: true, noResize: true ,label:"PORT08"},
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
  };
  
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
  
  // 승인구분
  function getAppYn(appYn) {
    if (appYn == 0) return "대기";
    else if (appYn == 1) return "승인";
    else if (appYn == 2) return "반려";
  }
  
  function getRecord(comdCd) {
    if (comdCd == "RECD01") return "재학";
    else if (comdCd == "RECD02") return "휴학";
    else if (comdCd == "RECD03") return "자퇴";
    else if (comdCd == "RECD04") return "재적";
    else if (comdCd == "RECD05") return "졸업";
  }
  
  function getBuilding(bldCd) {
    if (bldCd == "BULD10") return "BTL A동";
    else if (bldCd == "BULD11") return "BTL B동";
  }
  
  function getReportRsn(prRsn) {
    if (prRsn == 0) return "불건전한내용";
    else if (prRsn == 1) return "주제에맞지않음"
    else if (prRsn == 2) return "욕설"
    else if (prRsn == 3) return "기타"
  }
  
  $(function() {
    
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
    
    function renderLectureApply(appYn) {
      $.ajax({
        url: "/employee/renderLectureApply",
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        type: "post",
        data: JSON.stringify({appYn:appYn, appTarget:jsonUserVO.userCd}),
        beforeSend:function(xhr){
          xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success: res => {
          let txt = "";
          if (res.length > 0) {
            for(let i = 0; i < res.length; i++) {
              if (i == 6) break;
              const lectureApply = res[i];
              txt += `
                <tr class="tr">
                  <td>\${i+1}</td>
                  <td>\${lectureApply.lecaNm}</td>
                  <td>\${lectureApply.professorVO.userVO.userNm}</td>
                  <td>\${getPattern2(lectureApply.approvalVO.appReg)}</td>
                  <td>\${getAppYn(lectureApply.approvalVO.appYn)}</td>
                </tr>
              `
            }
          };
          if (res.length < 6) {
            for (let i = 0; i < 6 - res.length; i++) {
              txt += `<tr class="tr"><td></td><td></td><td></td><td></td><td></td></tr>`
            }
          }
          $("#lectureAppCnt").val(res.length);
          $("#lectureApplyTable tr.tr:not(.portletscore_th)").remove();
          $("#lectureApplyTable").append(txt);
        }
      })
    }
    
    function renderRecord(appYn) {
      $.ajax({
        url: "/employee/renderRecord",
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        data: JSON.stringify({appYn: appYn, appTarget: jsonUserVO.userCd}),
        type: "post",
        beforeSend:function(xhr){
          xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success: res => {
          let txt = "";
          if (res.length > 0) {
            for(let i = 0; i < res.length; i++) {
              if (i == 6) break;
              const record = res[i];
              txt += `
                <tr class="tr">
                  <td>\${i+1}</td>
                  <td>\${record.userVO.userNm}</td>
                  <td>\${getRecord(record.comdCd)}</td>
                  <td>\${getPattern2(record.approvalVO.appReg)}</td>
                  <td>\${getAppYn(record.approvalVO.appYn)}</td>
                </tr>
              `
            }
          };
          if (res.length < 6) {
            for (let i = 0; i < 6 - res.length; i++) {
              txt += `<tr class="tr"><td></td><td></td><td></td><td></td><td></td></tr>`
            }
          }
          $("#recordCnt").val(res.length);
          $("#recordTable tr.tr:not(.portletscore_th)").remove();
          $("#recordTable").append(txt);
        }
      })
    }
    
    function renderDormitory(appYn) {
      $.ajax({
        url: "/employee/renderDormitory",
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        data: JSON.stringify({appYn: appYn, appTarget: jsonUserVO.userCd}),
        type: "post",
        beforeSend:function(xhr){
          xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success: res => {
          let txt = "";
          if (res.length > 0) {
            for(let i = 0; i < res.length; i++) {
              if (i == 6) break;
              const dormitory = res[i];
              txt += `
                <tr class="tr">
                  <td>\${i+1}</td>
                  <td>\${dormitory.userVO.userNm}</td>
                  <td>\${getBuilding(dormitory.bldCd)}</td>
                  <td>\${getPattern2(dormitory.approvalVO.appReg)}</td>
                  <td>\${getAppYn(dormitory.approvalVO.appYn)}</td>
                </tr>
              `
            }
          };
          if (res.length < 6) {
            for (let i = 0; i < 6 - res.length; i++) {
              txt += `<tr class="tr"><td></td><td></td><td></td><td></td><td></td></tr>`
            }
          }
          $("#dormitoryCnt").val(res.length);
          $("#dormitoryTable tr.tr:not(.portletscore_th)").remove();
          $("#dormitoryTable").append(txt);
        }
      })
    }
    
    function renderReport(appYn) {
      
      $.ajax({
        url: "/employee/renderReport",
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        data: JSON.stringify({appYn: appYn, appTarget: jsonUserVO.userCd}),
        type: "post",
        beforeSend:function(xhr){
          xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
        },
        success: res =>{
          console.log(res);
          let txt = "";
          if (res.length > 0) {
            for(let i = 0; i < res.length; i++) {
              if (i == 6) break;
              const report = res[i];
              txt += `
                <tr class="tr">
                  <td>\${i+1}</td>
                  <td>\${report.approvalVO.userVO.userNm}</td>
                  <td>\${getReportRsn(report.prRsn)}</td>
                  <td>\${getPattern2(report.approvalVO.appReg)}</td>
                  <td>\${getAppYn(report.approvalVO.appYn)}</td>
                </tr>
              `
            }
          };
          if (res.length < 6) {
            for (let i = 0; i < 6 - res.length; i++) {
              txt += `<tr class="tr"><td></td><td></td><td></td><td></td><td></td></tr>`
            }
          }
          $("#reportCnt").val(res.length);
          $("#reportTable tr.tr:not(.portletscore_th)").remove();
          $("#reportTable").append(txt);
        }
      })
      
    }
    
    $("#lectureAppYn").on("change", function() {
      renderLectureApply($(this).val());
    });
    
    $("#recordAppYn").on("change", function() {
      renderRecord($(this).val());
    })
    
    $("#dormitoryAppYn").on("change", function() {
      renderDormitory($(this).val());
    })
    
    $("#reportAppYn").on("change", function() {
      renderReport($(this).val());
    })
    
    renderLectureApply($("#lectureAppYn").val());
    renderRecord($("#recordAppYn").val());
    renderDormitory($("#dormitoryAppYn").val());
    renderReport($("#reportAppYn").val());
  });
  
</script>