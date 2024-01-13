<%@page import="kr.or.ddit.security.CustomUser"%>
<%@page import="org.springframework.web.socket.WebSocketSession"%>
<%@page import="kr.or.ddit.vo.UserVO"%>
<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<link rel="stylesheet" href="/resources/css/resMap.css">
<script src="/resources/js/jquery.min.js"></script>
<%
	ObjectMapper objectMapper = new ObjectMapper();
	CustomUser customUser = (CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String strUserVO = objectMapper.writeValueAsString(customUser.getUserVO());
	session.setAttribute("strUserVO", strUserVO);
%>

<style>
  .reservation_box .table_topic i{margin-left:10px;}
  .reservation_box{width:100%; padding:40px; background-color:#ffffff;}
  .table_topic{font-size: 20px; padding-bottom:30px;}
  .reservation_form{border:1px solid #d1d0d0; padding:30px; width:100%; border-radius:5px; position:relative;}
  .reservation_form_title{display:flex; flex-direction:column; margin-bottom:30px;}
  .reservation_form_title p{width:120px; font-size:16px; margin-bottom:15px;}
  .reservation_form_title select, .reservation_form_title input{font-size:14px; border: 1px solid #333333; border-radius:3px; padding:5px 15px;}
  .reservation_form a:hover{color:#ffffff!important;}
/* ---------------------------------------------------- */
.fc .fc-button-primary {
	background-color: #a1b1cb;
	border-color: #a1b1cb;
}
.fc .fc-button:hover {
	background-color: #516688;
	border-color: #516688;
}
.fc .fc-button-primary:disabled {
	background-color: #a1b1cb;
	border-color: #a1b1cb;
}
.fc-daygrid-block-event .fc-event-time, .fc-daygrid-block-event .fc-event-title {
    padding: 1px 8px;
}
.fc-h-event .fc-event-title {
    display: block;
    height: 17px;
    line-height: 16px;
    padding: 0 8px;
    left: 0px;
    max-width: 100%;
    overflow: hidden;
    right: 0px;
    vertical-align: top;
}
.fc-h-event .fc-event-title-container {
    flex-grow: 1;
    flex-shrink: 1;
    min-width: 0px;
    font-size: 12px;
    font-weight: bold;
    color: #333333;
}
.fc .fc-button .fc-icon {
    color: #ffffff;
}
.fc .fc-toolbar-title {
    font-size: 24px;
}
thead {
  background-color: #ebf5ff;
}
</style>

<input type="text" id="userVO" value='${strUserVO}' style="display: none;">
<div class="reservation_box">
  <div style="font-size:12px; color:#888888; margin-bottom: 20px;">
    <span><a href="/student/mypage"><svg xmlns="http://www.w3.org/2000/svg" height="13" width="13" viewBox="0 0 576 512" style="margin-right: 5px;"><path fill="#888888" d="M575.8 255.5c0 18-15 32.1-32 32.1h-32l.7 160.2c0 2.7-.2 5.4-.5 8.1V472c0 22.1-17.9 40-40 40H456c-1.1 0-2.2 0-3.3-.1c-1.4 .1-2.8 .1-4.2 .1H416 392c-22.1 0-40-17.9-40-40V448 384c0-17.7-14.3-32-32-32H256c-17.7 0-32 14.3-32 32v64 24c0 22.1-17.9 40-40 40H160 128.1c-1.5 0-3-.1-4.5-.2c-1.2 .1-2.4 .2-3.6 .2H104c-22.1 0-40-17.9-40-40V360c0-.9 0-1.9 .1-2.8V287.6H32c-18 0-32-14-32-32.1c0-9 3-17 10-24L266.4 8c7-7 15-8 22-8s15 2 21 7L564.8 231.5c8 7 12 15 11 24z"/></svg></a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/reservation/list">시설예약</a></span>
		<span style="font-size:12px; color:#888888;">></span>
		<span style="font-size:12px; color:#888888;"><a href="/reservation/current">시설예약</a></span>
  </div>
  <div class="table_topic">시설예약<i class="fa-solid fa-circle-info" style="color: #333333;"></i></div>
  <div class="reservation_form">
    <div class="reservation_form_title">
      <div style="display: flex; justify-content: space-around;">
        <div>
          <p style="margin-left: 3px;">예약건물</p>
          <select id="building" style="width: 400px!important;">
            <option value="">예약 건물 선택</option>
            <c:forEach items="${buldCommonList}" var="vo">
              <c:if test="${vo.comdCd != 'BULD10' and vo.comdCd != 'BULD11'}">
                <option value="${vo.comdCd}">${vo.comdNm}</option>
              </c:if>
            </c:forEach>
          </select>
        </div>
        <div>
          <p style="margin-left: 3px;">층수</p>
          <select id="floor" style="width: 400px!important;">
            <option value="">층수 선택</option>
          </select>
        </div>
      </div>
    </div>
  </div>
  <div class="reservation_form_title">
    <div class="map">
      <div class="floor" style="display: none;">
        <a href="#none" class="ho"><span>101</span></a>
        <a href="#none" class="ho"><span>102</span></a>
        <a href="#none" class="ho"><span>103</span></a>
  <!--       <span class="ho sisul"></span> -->
  <!--       <span class="ho sisul"></span> -->
        <a href="#none" class="ho"><span>104</span></a>
        <a href="#none" class="ho"><span>105</span></a>
        <a href="#none" class="ho"><span>106</span></a>
        <a href="#none" class="ho"><span>107</span></a>
        <a href="#none" class="ho"><span>108</span></a>
        <a href="#none" class="ho"><span>109</span></a>
        <a href="#none" class="ho"><span>110</span></a>
  <!--       <span class="ho sisul"></span> -->
  <!--       <span class="ho sisul"></span> -->
        <a href="#none" class="ho"><span>111</span></a>
        <a href="#none" class="ho"><span>112</span></a>
        <a href="#none" class="ho"><span>113</span></a>
        <a href="#none" class="ho"><span>114</span></a>
      </div>
    </div>
  </div>
</div>

<!-- <div class="container">
  <h1 class="text-lg-center mb-5 mt-3" style="font-size: 30px;">시설 예약 현황</h1>
  <div class="row">
    <div class="col-md-3"></div>
    <div class="col-md-3">
      <select class="form-select form-select-sm" id="building">
        <option value="">예약 건물 선택</option>
        <c:forEach items="${buldCommonList}" var="vo">
          <option value="${vo.comdCd}">${vo.comdNm}</option>
        </c:forEach>
      </select>
    </div>
    <div class="col-md-3" style="margin-left: 5px;">
      <select class="form-select form-select-sm" id="floor">
        <option value="">층수 선택</option>
      </select>
    </div>
    <div class="col-md-3"></div>
  </div>
  <div class="row map">
    <div class="floor" style="display: none;">
      <a href="#none" class="ho"><span>101</span></a>
      <a href="#none" class="ho"><span>102</span></a>
      <a href="#none" class="ho"><span>103</span></a>
      <a href="#none" class="ho"><span>104</span></a>
      <a href="#none" class="ho"><span>105</span></a>
      <a href="#none" class="ho"><span>106</span></a>
      <a href="#none" class="ho"><span>107</span></a>
      <a href="#none" class="ho"><span>108</span></a>
      <a href="#none" class="ho"><span>109</span></a>
      <a href="#none" class="ho"><span>110</span></a>
      <a href="#none" class="ho"><span>111</span></a>
      <a href="#none" class="ho"><span>112</span></a>
      <a href="#none" class="ho"><span>113</span></a>
      <a href="#none" class="ho"><span>114</span></a>
    </div>
  </div>
</div> -->

<!-- Modal1 -->
<div class="modal fade" id="roomResListModal" tabindex="-1" aria-labelledby="roomResListModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-xl modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="roomResListModalLabel">Modal title</h1>
        	<div style="display:flex; margin-left:20px;">
    			<div style="display:flex; align-items:center;"><div style=" margin-left:7px; width:15px; height:15px; border-radius:20px; background-color:#FFFFB2;"></div><span>강의중</span></div>
    			<div style="display:flex; align-items:center;"><div style=" margin-left:7px; width:15px; height:15px; border-radius:20px; background-color:#CCECB4;"></div><span>나의예약</span></div>
    			<div style="display:flex; align-items:center;"><div style=" margin-left:7px; width:15px; height:15px; border-radius:20px; background-color:gray;"></div><span>사용중</span></div>
        	</div>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div id="calendar"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal2 -->
<div class="modal fade" id="roomResListModal2" aria-hidden="true" aria-labelledby="roomResListModalLabel2" tabindex="-1">
  <div class="modal-dialog modal-lg modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="roomResListModalLabel2">Modal 2</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	    <label for="res" style="position: relative; bottom: -390px; margin-left: 700px; right: 193px;">
   		<input type="checkbox" class="btn-two mini gray reason" id="res" />
	    <span style="font-size: 11px; font-weight: 400; margin-left: -10px; position: relative; top: -2px">자동완성</span>
	    </label>
      <div class="modal-body" id="resBody">
      </div>
      <div class="modal-footer" id="resFooter">
        
      </div>
    </div>
  </div>
</div>

<!-- <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Open first modal</button> -->
<script>
//자동완성버튼
$("#res").on("click", function (){
    $("#resRsn").val("프로젝트간 회의 및 컴퓨터 실습을 위해 공간을 대여합니다.");
});
</script>
<script>
  let calendar;
  const lectureScheduleList = [];
  let userVO = JSON.parse($("#userVO").val());
  
  
  $("#building").on("change", function(event) {
    const building = $(event.target).val();
    const floorSet = new Set();
    $.ajax({
      url: "/reservation/getRoomListByComdCd?comdCd=" + building,
      type: "get",
      success: res => {
        res.forEach(room => {
          floorSet.add(room.roomCd.substr(6,1))
        })
        console.log(floorSet);
        let txt = '';
        floorSet.forEach((key, value) => {
          txt += `<option value="\${value}">\${value}층</option>`
        })
        $("#floor").html('');
        $("#floor").append('<option value="">층수 선택</option>');
        $("#floor").append(txt);
        
        $("#floor").on("change", function(event) {
          
          const floor = $(event.target).val();
          roomList = [];
          console.log("res =>", res);
          res.forEach(room => {
            if (room.roomCd.substr(6,1) == floor) {
              roomList.push(room);
            }
          });
          $(".floor").removeAttr("style");
          let txt = "";
          console.log("roomList => ", roomList);
          roomList.forEach((room, i) => {
            let roomNo = room.roomCd.substr(6);
//             if (i == 3 || i == 10) {
//               txt += `<span class="ho sisul stairs"><img src="/resources/images/stairs.png" alt="stair" style="display:block; width:60px;"></span><span class="ho sisul rest_room"><img src="/resources/images/toilet.png" alt="toilet" style="display:block; width:60px;"></span>`
//             }
            txt += `<a href="#none" onclick="getResInfo('\${room.roomCd}')" class="ho"><p>\${roomNo}호</p><p>\${room.roomPur}</p></a>`
          });
          $(".floor").html(txt);
        })
      }
    })
    
    $.ajax({
      url: "/reservation/getLectureScheduleByBldCd?bldCd="+building,
      type: "get",
      dataType: "json",
      async: false,
      success: res => {
        res.forEach(schedule => lectureScheduleList.push(schedule));
      }
    })
    console.log(lectureScheduleList);
  })
  
  
  
  getResInfo = function(roomCd) {
    
    $.ajax({
      url: "/reservation/getResListByRoomCd?roomCd="+roomCd,
      dataType: "json",
      type: "get",
      async: false,
      success: res => {
        console.log("res =>", res);
        let checkRoom = false;
        if (res[0].roomVO.roomPur == '교수실') {
          alertError("교수실은 예약하실 수 없습니다.");
          return;
        }
        const resList = [];
        res.forEach(item => {
          let stdt = getTime(item.resStdt);
          let eddt = getTime(item.resEddt);
          stdt = stdt.substr(0, stdt.lastIndexOf('.'));
          eddt = eddt.substr(0, eddt.lastIndexOf('.'));
          console.log("start ==>", stdt);
          console.log("end ==>", eddt);
          let obj = {
            id: item.resCd,
            start: stdt,
            end: eddt,
          }
          if (item.userCd != null && item.userCd != "" && item.userCd == userVO.userCd) obj.color = "#56cb52"
          else obj.color = "gray"
          resList.push(obj);
        });
        lectureScheduleList.forEach(lectureSchedule => {
          lectureSchedule.forEach(schedule => {
            if (schedule.calRoomCd == roomCd) {
              resList.push({
                start: schedule.calStart,
                end: schedule.calEnd,
                color: "yellow"
              })
            }
          })
        });
        console.log(resList);
        const roomNo = roomCd.substr(6);
        $("#roomResListModalLabel").text(`\${res[0].commonDetailVO.comdNm}   \${roomNo}호 예약현황 `);
        let calendarEl = document.querySelector('#calendar');
        calendar = new FullCalendar.Calendar(calendarEl, {
          locale : "ko",
          // 시작 Toolbar
          initialView : "timeGridWeek",
          // 선택가능여부
          selectable: true,
          // Toolbar
          headerToolbar : {
            left : "prev,next",
            center : "title",
            right : "",
          },
          contentHeight: 335,
          // 일정을 배경으로만 체크
          eventDisplay: "background",
          // 수정가능여부
          editable: true,
          // 일정 목록
          events: resList,
          // 캘린더 랜더링 시작시간
          slotMinTime: "09:00:00",
          // 캘린더 랜더링 종료시간
          slotMaxTime: "22:00:00",
          // 시간 간격 설정
          slotDuration: "01:00:00",
          // allDaySlot X
          allDaySlot: false,
          // 선택했을 경우 선택가능 여부 return
          selectAllow: function(selectInfo) {
            let today = new Date();
            today.setHours(0,0,0,0);
            if (selectInfo.start < today) {
              alertError("이전 날짜를 선택할 수 없습니다.")
              return false;
            }
            const eventList = calendar.getEvents().some(function(event) {
              return (
                (event.start < selectInfo.end && event.end > selectInfo.start) ||
                (event.start >= selectInfo.start && event.end <= selectInfo.end)
              );
            });
            
            if (eventList) alertError("사용하실 수 없는 시간입니다.")
            
            return !eventList;
          },
          // 날짜를 클릭했을 시 이벤트
          // dateClick: function(info) {
          //   console.log(info);
          // },
          // 선택했을 시 이벤트
          select: function(info) {
            console.log("info ==>", info);
            $("#roomResListModal").modal("hide");
            
            console.log("userVO ==>", userVO);
            
            let strArr = info.startStr.split("T");
            console.log(strArr);
            
            let txt = `
              <form class="row g-3">
                <div class="col-md-4">
                  <label for="userCd" class="form-label">학번</label>
                  <input type="text" class="form-control" id="userCd" name="userCd" value="\${userVO.userCd}" readonly>
                </div>
                <div class="col-md-4">
                  <label for="depNm" class="form-label">학과</label>
                  <input type="text" class="form-control" id="depNm" value="\${userVO.studentVO.departmentVO.depNm}" readonly>
                </div>
                <div class="col-md-4">
                  <label for="userNm" class="form-label">이름</label>
                  <input type="text" class="form-control" id="userNm" value="\${userVO.userNm}" readonly>
                </div>
                <div class="col-md-6">
                  <label for="buldNm" class="form-label">건물</label>
                  <input type="text" class="form-control" id="buldNm" value="\${res[0].commonDetailVO.comdNm}" readonly>
                </div>
                <div class="col-md-6">
                  <label for="roomNo" class="form-label">호실</label>
                  <input type="text" class="form-control" id="roomNo" value="\${res[0].roomCd.substr(6)}호" readonly>
                </div>
                <input type="text" id="roomCd" value="\${res[0].roomCd}" style="display: none;">
                <div class="col-md-6">
                  <label for="startDate" class="form-label">예약일자</label>
                  <input type="text" class="form-control" id="startDate" value="\${strArr[0]}" readonly>
                </div>
                <div class="col-md-3">
                  <label for="startTime" class="form-label">시작시간</label>
                  <input type="text" class="form-control" id="startTime" value="\${strArr[1].split('+')[0].substr(0,5)}" readonly>
                </div>
                <div class="col-md-3">
                  <label for="endTime" class="form-label">종료시간</label>
                  <input type="text" class="form-control" id="endTime" value="\${info.endStr.split('T')[1].split('+')[0].substr(0,5)}" readonly>
                </div>
                <div class="col-md-12">
                  <label for="resRsn" class="form-label">시설 대여 사유</label>
                  <input type="text" class="form-control" id="resRsn" placeholder="대여 사유를 입력해주세요." required>
                </div>
            `;
            
            $("#roomResListModalLabel2").text("예약 신청")
            $("#resBody").html(txt);
            txt = `
              <button class="btn btn-primary" onclick="reservationBtn('\${info.startStr}', '\${info.endStr}')">예약하기</button>
              <button class="btn btn-dark" onclick="showModalAndRenderCalendar()" data-bs-toggle="modal">뒤로가기</button>
              </form>
            `
            $("#resFooter").html(txt);
            $("#roomResListModal2").modal("show");
          }
          // eventClick: function(info) {
          //   console.log(info);
          //   $("#roomResListModal").modal("hide");
          //   $("#roomResListModal2").modal("show");
          // }
        })
        showModalAndRenderCalendar();
      }
    })
    
  }
  
  function reservationBtn(startStr, endStr) {
    console.log("info ==>", startStr, endStr);
    const resRsn = $("#resRsn").val();
    
    if (resRsn == null || resRsn == "") {
      alertError("대여 사유를 입력해주세요.");
      return;
    }
    
    const data = {
      resRsn : resRsn,
      userCd : $("#userCd").val(),
      roomCd : $("#roomCd").val(),
      resStdt: new Date(startStr.substr(0,16)).toISOString(),
      resEddt: new Date(endStr.substr(0,16)).toISOString(),
    }
    console.log(data);
    
    $.ajax({
      url: "/reservation/insert",
      contentType: "application/json; charset=UTF-8",
      type: "post",
      data: JSON.stringify(data),
      async: false,
      beforeSend:function(xhr){
        xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
      },
      success: res => {
        if (res == 1) {
          $("#roomResListModal2").modal("hide");
          setTimeout(() => {
            showModalAndRenderCalendar();
          }, 500);
          calendar.addEvent({
            start: data.resStdt,
            end: data.resEddt,
            color: "#56cb52",
          })
        }
        
        
      }
    })
  }
  
  function getTime(date) {
    let formDate = new Date(date);
    formDate.setHours(formDate.getHours() + 9);
    return formDate.toISOString();
  }
  
  function showModalAndRenderCalendar() {
    $("#roomResListModal").modal("show");
    setTimeout(() => {
      calendar.render();
    }, 200);
  }
  
  $(function() {
    
  })
  
</script>


