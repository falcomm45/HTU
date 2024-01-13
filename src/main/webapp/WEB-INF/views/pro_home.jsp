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
  
  .palarm{border-radius:25px; margin: 0 5px; padding:5px 5px; border: 1px solid #dddddd!important; width: 45px; text-align: center;}

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
  
  $(function() {
    // 포틀릿 저장
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
    
    /* 6-2 현재 학기 강의 목록 */
    $.ajax({
      url: "/professor/getLectureList",
      dataType: "json",
      type: "get",
      async: false,
      success: res => {
        let txt = "";
        res.forEach(lecture => {
          txt += `
          <div style="display:flex; flex-direction:column;">
            <div style="width:100%; height:100%; border-radius:3px 3px 0 0; padding:3px; background-color:#5F8670;">
              <input value="\${lecture.lectureApplyVO.lecaNm}(\${getClassification(lecture.lectureApplyVO.lecaType)})" style="padding:10px 0 0 0; text-align:center; color:#ffffff; font-size:13px; width:100%; background-color:#5F8670;" readonly/>
              <input value="" style="padding:0 10px 5px 0; text-align:end; color:#ffffff; font-size:11px; width:100%; background-color:#5F8670;" readonly />
            </div>
            <div style="width:100%; height:100%; border-radius:0 0 3px 3px; padding:20px; border: 1px solid #ebebeb; background-color:#ffffff; position:relative;">
              <div style="position:absolute; right:5px; bottom:10px; cursor:pointer;" onclick="location.href='/professor/lecture/detail?lecCd=\${lecture.lecCd}'">
                <span style="font-size:11px;">강의실</span>
                <svg xmlns="http://www.w3.org/2000/svg" height="12" width="12" viewBox="0 0 576 512"><path fill="#333333" d="M352 224H305.5c-45 0-81.5 36.5-81.5 81.5c0 22.3 10.3 34.3 19.2 40.5c6.8 4.7 12.8 12 12.8 20.3c0 9.8-8 17.8-17.8 17.8h-2.5c-2.4 0-4.8-.4-7.1-1.4C210.8 374.8 128 333.4 128 240c0-79.5 64.5-144 144-144h80V34.7C352 15.5 367.5 0 386.7 0c8.6 0 16.8 3.2 23.2 8.9L548.1 133.3c7.6 6.8 11.9 16.5 11.9 26.7s-4.3 19.9-11.9 26.7l-139 125.1c-5.9 5.3-13.5 8.2-21.4 8.2H384c-17.7 0-32-14.3-32-32V224zM80 96c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16H400c8.8 0 16-7.2 16-16V384c0-17.7 14.3-32 32-32s32 14.3 32 32v48c0 44.2-35.8 80-80 80H80c-44.2 0-80-35.8-80-80V112C0 67.8 35.8 32 80 32h48c17.7 0 32 14.3 32 32s-14.3 32-32 32H80z"/></svg>
              </div>
            </div>
          </div>
          `
        })
        $("#lectureDiv").html(txt);
      }
    })
    
    /* 7-2 상담 목록 */
    $.ajax({
      url: "/professor/counsel/renderHome?userCd="+jsonUserVO.userCd,
      dataType: "json",
      type: "get",
      success: res => {
        let txt = "";
        let int = 1;
        res.forEach(counsel => {
          txt += `
            <tr class="tr">
              <td style="cursor:pointer;" onclick="location.href='/professor/counsel/counselProList'">\${int}</td>
              <td style="cursor:pointer;" onclick="location.href='/professor/counsel/counselProList'">\${getCounselCategory(counsel.comdCd)}</td>
              <td style="cursor:pointer;" onclick="location.href='/professor/counsel/counselProList'">\${getPattern2(counsel.cnslDt)}</td>
              <td style="cursor:pointer;" onclick="location.href='/professor/counsel/counselProList'">\${counsel.userVO.userNm}</td>
              <td style="cursor:pointer;" onclick="location.href='/professor/counsel/counselProList'">\${getAppYn(counsel.approvalVO.appYn)}</td>
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
    })
    
    
    
    
    /* 11-1 시간표 */
    const date = new Date();
    let year = date.getFullYear();
    let sem = [1,2,3,4,5,6,7,8].includes(date.getMonth() + 1) ? 1 : 2;
    let txt = "";
    for(let i = year; i > year - 3; i--) {
      if (i == year) txt += `<option value="\${i}" selected>\${i}</option>`;
      else txt += `<option value="\${i}">\${i}</option>`;
    }
    $("#stuYear").html(txt);
    $("#stuSem").val(sem);
    
    renderTimeTable(year, sem);
    
    
    
    
    
    
    
    
    
    
    
  })
  
  
  const jsonUserVO = JSON.parse('${jsonUserVO}');
  console.log(jsonUserVO);
  
  const jsonPortletList = JSON.parse('${jsonPortletList}');
  console.log(jsonPortletList);
  
  /* 프로필 */
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
        <div style="display: flex; align-items:center; margin-top:10px; text-wrap:nowrap; white-space:nowrap;">
          <input value='\${jsonUserVO.professorVO.proPos}' style="width:100%; text-align:center; font-size: 14px; font-weight: 400; color:#555555;" readonly>
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
  /* 3번째 div에 바깥쪽에 a링크 또는 form만들어서 값 받아와야하나..? 한문단..?빼고 다 깡통이여유*/
  let content_classroom = `
    <div class="main_portlet_wrap" style="height:100%;">
    <div class="portletlock">
      <svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 448 512"><path fill="#333333" d="M144 144v48H304V144c0-44.2-35.8-80-80-80s-80 35.8-80 80zM80 192V144C80 64.5 144.5 0 224 0s144 64.5 144 144v48h16c35.3 0 64 28.7 64 64V448c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V256c0-35.3 28.7-64 64-64H80z"/></svg>
    </div>
    <div class="portlettitle">
      <a href="/professor/lecture/list">내 강의실</a>
    </div>
      <div id="lectureDiv" style="display:grid; grid-template-columns: 1fr 1fr 1fr; grid-template-rows: 1fr 1fr; gap:20px 15px;">
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
      <a href="/professor/counsel/counselProList">상담</a>
    </div>
      <table class="portletcounsel">
        <tr class="portletcounsel_th">
          <th>no</th>
          <th>상담종류</th>
          <th>신청일</th>
          <th>신청학생</th>
          <th>승인여부</th>
        </tr>
      </table>
    </div>
  `
  
  /* 11.시간표 */
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
	      <p style="margin-right:7px;">년도</p>  
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
    {x: 0, y: 3, w: 3, h: 5, content: content_alarm, noMove: true, noResize: true ,label:"PORT06"},
    {x: 7, y: 2, w: 5, h: 3, content: content_classroom, noMove: true, noResize: true ,label:"PORT05"},
    {x: 3, y: 5, w: 5, h: 3, content: content_counsel, noMove: true, noResize: true ,label:"PORT07"},
    {x: 8, y: 5, w: 4, h: 3, content: content_schedule, noMove: true, noResize: true ,label:"PORT11"},
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
    cellHeight: '7rem'
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
  
  
  function renderTimeTable(year, sem) {
    const timeTableColor = ["#F2E8E8", "#FFE9E9", "#F9E9D9", "#FFF8CC", "#F0F9CC", "#DAEFE6", "#DCEEF0"];
    $.ajax({
      url: "/professor/getTimeTable",
      contentType: "application/json; charset=UTF-8",
      dataType: "json",
      type: "post",
      data: JSON.stringify({
        lecaYear: year,
        lecaSem: sem,
        proCd: jsonUserVO.userCd
      }),
      beforeSend:function(xhr){
        xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
      },
      success: res => {
        if (res.length > 0) {
          let colorIndex = 0;
          res.forEach(lecture => {
            const dayArr = lecture.lectureScheduleVO.lecDay.split("/");
            const startHour = new Date(lecture.lectureScheduleVO.lecsStdt).getHours().toString().padStart(2,'0');
            const endHour = new Date(lecture.lectureScheduleVO.lecsEddt).getHours().toString();
            const time = new Date(lecture.lectureScheduleVO.lecsEddt).getHours() - new Date(lecture.lectureScheduleVO.lecsStdt).getHours();
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
      }
    })
    
  }
  
  $("#stuYear").on("change", function() {
    $(".portletschedule td").css("background-color", "white");
    const year = $(this).val();
    const sem = $("#stuSem").val();
    renderTimeTable(year, sem);
  });
  
  $("#stuSem").on("change", function() {
    $(".portletschedule td").css("background-color", "white");
    const year = $("#stuYear").val();
    const sem = $(this).val();
    renderTimeTable(year, sem);
  });
  
  
  
  
  
  
  
  
  
  // yyyy-MM-dd 형식
  function getPattern(dateNo) {
    const date = new Date(dateNo);
    return `\${date.getFullYear()}-\${(date.getMonth() + 1).toString().padStart(2, '0')}-\${date.getDate().toString().padStart(2, '0')}`;
  }
  
  // yy.MM.dd 형식
  function getPattern2(dateNo) {
    const date = new Date(dateNo);
    return `\${(date.getFullYear() % 100).toString().padStart(2, '0')}.\${(date.getMonth() + 1).toString().padStart(2, '0')}.\${date.getDate().toString().padStart(2, '0')}`;
  }
  
  // HH:mm 형식
  function getPattern3(dateNo) {
    const date = new Date(dateNo);
    return `\${date.getHours().toString().padStart(2,'0')}:\${date.getMinutes().toString().padStart(2,'0')}`;
  }
  
  // 이수구분
  function getClassification(lecaType) {
    if (lecaType == 0) return "전필"
    else if (lecaType == 1) return "전선"
    else if (lecaType == 2) return "교필"
    else if (lecaType == 3) return "교선"
  }
  
  // 상담구분
  function getCounselCategory(cate) {
    if (cate == "COUN01") return "취업상담";
    else if (cate == "COUN02") return "성적상담";
    else if (cate == "COUN03") return "기타상담";
  }
  
  // 승인구분
  function getAppYn(appYn) {
    if (appYn == 0) return "대기";
    else if (appYn == 1) return "승인";
    else if (appYn == 2) return "반려";
  }
  
</script>