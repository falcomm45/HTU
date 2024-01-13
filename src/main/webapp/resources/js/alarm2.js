let alarmList = [];
let socket = null;

$(function() {
  connectWS();
});

// 소켓
connectWS = function() {
  let ws = new SockJS("http://localhost/echo");
  socket = ws;
  
  ws.onopen = function(userCd) {
    console.log("연결 완료");
    sendMessageToServer("로그인사용자");
  }
  
  ws.onmessage = function(event) {
    
    alarmList = JSON.parse(event.data);
    console.log("alarmList ==>", alarmList);
    
    if (alarmList.lecCd != null && alarmList.lecCd != undefined) {
      $(".lecHcnt"+alarmList.lecCd).text(alarmList.lecHcnt);
    }
    
    
    if (alarmList.length > 0) {
      $(".alarm").append(`<div class="new_alarm_down"></div>`);
    }
    
    $(".alarm_btn").on("click", function() {
      let txt = "";
      alarmList.forEach(alarm => {
        console.log(alarm);
        txt += ``;
      })
    })
    
    $("#mailAlarm").on("click", function() {
      let txt = "";
      let mail = {};
      alarmList.forEach(alarm => {
        if (alarm.commonDetailVO.comdCd == 'ALAM03') {
          const pk = alarm.ntfUrl.split("=")[1];
          $.ajax({
            url: "/mail/getMailByNtfCd?umlCd="+pk,
            type: "get",
            async: false,
            dataType: 'json',
            success: res => {
              mail = res;
            }
          })
          txt += `
            <li class="d-flex">
              <div style="padding:10px;">
                <div>
                  <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px; font-weight:600;">${mail.senderNm}</span><span style="font-size:14px; color:#888888;">님으로부터 </span> 
                  <span style="font-size:14px;"><svg xmlns="http://www.w3.org/2000/svg" height="14" width="14" margin="2 0 0 0" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#333333" d="M64 112c-8.8 0-16 7.2-16 16v22.1L220.5 291.7c20.7 17 50.4 17 71.1 0L464 150.1V128c0-8.8-7.2-16-16-16H64zM48 212.2V384c0 8.8 7.2 16 16 16H448c8.8 0 16-7.2 16-16V212.2L322 328.8c-38.4 31.5-93.7 31.5-132 0L48 212.2zM0 128C0 92.7 28.7 64 64 64H448c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z"/></svg>${alarm.commonDetailVO.comdDesc}</span></a>
                </div>
                <div style="font-size:13px; color:#888888; margin-top:5px;">${mail.strUmlReg}</div>
              </div>
            </li>
          `;
        }
      })
      if (txt.length < 1) {
        txt = `
        <li class="list-group-item d-flex justify-content-between align-items-start">
          <div style="font-size:13px; color:#888888; display:flex; align-items:center;">
          <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#333333" d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zm79 143c9.4-9.4 24.6-9.4 33.9 0l47 47 47-47c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-47 47 47 47c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0l-47-47-47 47c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l47-47-47-47c-9.4-9.4-9.4-24.6 0-33.9z"/></svg>
          <span style="margin-left:7px;">도착메일이 없습니다.</span>
          </div>
        </li>
        `;
      }
      console.log(txt)
      $("#notificationList").html(txt);
    });
    
    
    $("#commentAlarm").on("click", function() {
      let txt = "";
      let comment = {};
      alarmList.forEach(alarm => {
        if (alarm.commonDetailVO.comdCd == 'ALAM04' || alarm.commonDetailVO.comdCd == 'ALAM05') {
          
          $.ajax({
            url: "/comment/getCommentByCmtCd?cmtCd="+alarm.ntfUrl.split('=')[2],
            type: "get",
            dataType: "json",
            async: false,
            success: res => {
              comment = res;
              console.log("comment ==> ", comment);
            }
          })
          
          let commentStr = comment.cmtCon;
          if (commentStr.length >= 20) {
            commentStr = commentStr.substr(0,20);
            commentStr += "...";
          }
          
          txt += `
          <li class="d-flex">
            <div style="padding:10px;">
              <div>
                <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px; font-weight:500;">\'${comment.boardVO.bdTitle}\'</span> <span style="font-size:14px;">${alarm.commonDetailVO.comdDesc}</span></a>
              </div>
              <div style="font-size:13px; color:#888888; margin-top:5px">${commentStr}</div>
            </div>
          </li>
          `
        }
      })
      if (txt.length < 1) {
        txt = `
        <li class="list-group-item d-flex justify-content-between align-items-start">
          <div class="ms-2 me-auto">
            <div style="font-size:13px; color:#888888; display:flex; align-items:center;">
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#333333" d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zm79 143c9.4-9.4 24.6-9.4 33.9 0l47 47 47-47c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-47 47 47 47c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0l-47-47-47 47c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l47-47-47-47c-9.4-9.4-9.4-24.6 0-33.9z"/></svg>
            <span style="margin-left:7px;">댓글알림이 없습니다.</span>
            </div>
          </div>
        </li>
        `;
      } 
      console.log(txt);
      $("#notificationList").html(txt);
    })
    
    $("#academicAlarm").on("click", function() {
      
    })
    
    $("#counselAlarm").on("click", function() {
      let txt = "";
      let result = {};
      alarmList.forEach(alarm => {
        const pk = alarm.ntfUrl.split("=")[1];
        // 상담신청시
        if (alarm.commonDetailVO.comdCd == "ALAM02") {
          result = getCounselDetail(pk);
          txt += `
          <li class="d-flex">
            <div style="padding:10px;">
              <div>
                <a href="#" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px;">${result.userVO.userNm}</span> <span style="font-size:14px; color:#888888;">학생이 상담을 신청하셨습니다.</span></a>
              </div>
              <span style="font-size:14px">상담일자 : ${result.cnslCon}</span>
            </div>
          </li>
          `;
          // 상담 승인
        } else if (alarm.commonDetailVO.comdCd == "ALAM09") { 
          result = getCounselDetail(pk);
          txt = `
          `
          
          // 상담 반려
        } else if (alarm.commonDetailVO.comdCd == "ALAM10") {
          result = getCounselDetail(pk);
          
        }
      })
      if (txt.length < 1) {
        txt = `
        <li class="list-group-item d-flex justify-content-between align-items-start">
          <div class="ms-2 me-auto">
            <div style="font-size:13px; color:#888888; display:flex; align-items:center;">
            <svg xmlns="http://www.w3.org/2000/svg" height="16" width="14" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2023 Fonticons, Inc.--><path fill="#333333" d="M64 32C28.7 32 0 60.7 0 96V416c0 35.3 28.7 64 64 64H384c35.3 0 64-28.7 64-64V96c0-35.3-28.7-64-64-64H64zm79 143c9.4-9.4 24.6-9.4 33.9 0l47 47 47-47c9.4-9.4 24.6-9.4 33.9 0s9.4 24.6 0 33.9l-47 47 47 47c9.4 9.4 9.4 24.6 0 33.9s-24.6 9.4-33.9 0l-47-47-47 47c-9.4 9.4-24.6 9.4-33.9 0s-9.4-24.6 0-33.9l47-47-47-47c-9.4-9.4-9.4-24.6 0-33.9z"/></svg>
            <span style="margin-left:7px;">상담알림이 없습니다.</span>
            </div>
          </div>
        </li>
        `;
      } 
      $("#notificationList").html(txt);
    })
    
    // const token = $("meta[name='_csrf']").attr("content");
    // const header = $("meta[name='_csrf_header']").attr("content");
    
    // $.ajax({
    //   url: "/getCommonDetail?comCd=ALAM",
    //   type: "get",
    //   beforeSend:function(xhr){
		// 		xhr.setRequestHeader(header,token);
		// 	},
    //   success: (res) => {
    //     console.log("res ==>", res);
        
    //     const comdSet = new Set();
    //     alarmList.forEach(alarm => {
    //       res.forEach(comdVO => {
    //         if (alarm.comdCd == comdVO.comdCd) comdSet.add(comdVO);
    //       })
    //     });
    //     console.log(comdSet);
    //     let txt = '';
    //     comdSet.forEach(item => {
    //       txt += `<li><a href="#none" onclick="alarmDetail('${item.comdCd}')" style="margin-left: 5px;">${item.comdNm}</a></li>`
    //     })
    //     $("#notificationDropdown ul:first").html(txt);
    //   }
    // });
    
  };
  
  ws.onclose = function() {
    console.log("소켓 연결 종료");
  };
};

function checkAlarm(ntfCd, url) {
  
  console.log(ntfCd, url);
  
  $.ajax({
    url: "/notification/check?ntfCd="+ntfCd,
    type: "get",
    success: res => {
      if (res == 1 && url != undefined) location.href=url;
    },
    error: xhr => {
      console.log(xhr);
    }
    
  })
  
}

function  getCounselDetail(pk) {
  $.ajax({
    url: "/common/getCounselByCnslCd?cnslCd=" + pk,
    type: "get",
    dataType: "json",
    async: false,
    success: res => {
      console.log(res);
      return res;
    },
  })
}

function sendMessageToServer(message) {
  socket.send(message);
};

function sendEnrolmentToServer(message) {
  socket.send(message);
};