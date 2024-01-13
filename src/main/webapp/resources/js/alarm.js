let alarmList = [];
let socket = null;
let mailAlarmList = [];

$(function() {
  connectWS();
});

// 소켓
connectWS = function() {
  let ws = new SockJS("http://localhost/echo");
  socket = ws;
  
  ws.onopen = function(userCd) {
    console.log("socket 연결 완료");
    sendMessageToServer("로그인사용자");
  }
  
  ws.onmessage = function(event) {
    
    alarmList = JSON.parse(event.data);
    console.log("alarmList ==>", alarmList);
    
    // 수강신청 실시간 수강인원 업데이트
    if (alarmList.lecCd != null && alarmList.lecCd != undefined) {
      console.log(".lecHcnt"+alarmList.lecCd, alarmList.lecHcnt);
      $(".lecHcnt"+alarmList.lecCd).text(alarmList.lecHcnt);
    }
    
    // 빨간점..ㅎ
    if (alarmList.length > 0) {
      $(".alarm").append(`<div class="new_alarm_down"></div>`);
    }
    
    // 메일
    for(let i = 0; i < alarmList.length; i++){
      let mailAlarm = alarmList[i].comdCd;
      
      if (mailAlarm == "ALAM03") {
        mailAlarmList.push(mailAlarm);
      }
    }
    if (mailAlarmList.length > 0) {
      $(".mailAlarm").append(`<div class="new_alarm_down"></div>`);
    }
    
  };
  
  ws.onclose = function() {
    console.log("socket 연결 종료");
  };
};

const functionMap = {
  // 강의시험등록알림
  "ALAM01": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px; font-weight:600;">${alarm.ntfCon}</span><span style="font-size:14px; color:#888888;"> 강의의 </span> 
            <span style="font-size: 14px;">${alarm.commonDetailVO.comdDesc}</span>
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 상담신청알림
  "ALAM02": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px; font-weight:600;">${alarm.senderVO.userNm}</span><span style="font-size:14px; color:#888888;">님의 </span> 
            <span style="font-size:14px;">${alarm.commonDetailVO.comdDesc}</span></a>
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 메일알림
  "ALAM03": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px; font-weight:600;">${alarm.senderVO.userNm}</span><span style="font-size:14px; color:#888888;">님으로부터 </span> 
            <span style="font-size:14px;"><svg xmlns="http://www.w3.org/2000/svg" height="14" width="14" margin="2 0 0 0" viewBox="0 0 512 512"><path fill="#333333" d="M64 112c-8.8 0-16 7.2-16 16v22.1L220.5 291.7c20.7 17 50.4 17 71.1 0L464 150.1V128c0-8.8-7.2-16-16-16H64zM48 212.2V384c0 8.8 7.2 16 16 16H448c8.8 0 16-7.2 16-16V212.2L322 328.8c-38.4 31.5-93.7 31.5-132 0L48 212.2zM0 128C0 92.7 28.7 64 64 64H448c35.3 0 64 28.7 64 64V384c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V128z"/></svg>${alarm.commonDetailVO.comdDesc}</span></a>
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 게시글댓글알림
  "ALAM04": function(alarm) {
    
  },
  // 대댓글알림
  "ALAM05": function(alarm) {
    
  },
  // 강의공지사항등록알림
  "ALAM06": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px; font-weight:600;">${alarm.ntfCon}</span><span style="font-size:14px; color:#888888;"> 강의의 </span> 
            <span style="font-size: 14px;">${alarm.commonDetailVO.comdDesc}</span>
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 강의과제등록알림
  "ALAM07": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px; font-weight:600;">${alarm.ntfCon}</span><span style="font-size:14px; color:#888888;"> 강의의 </span> 
            <span style="font-size: 14px;">${alarm.commonDetailVO.comdDesc}</span>
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 학사일정등록알림
  "ALAM08": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px;">${alarm.commonDetailVO.comdDesc}</span> 
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 상담승인알림
  "ALAM09": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px;">${alarm.commonDetailVO.comdDesc}</span> 
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 상담반려알림
  "ALAM10": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px;">${alarm.commonDetailVO.comdDesc}</span> 
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 강의계획신청알림
  "ALAM11": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px; font-weight:600;">${alarm.ntfCon}</span><span style="font-size:14px; color:#888888;"> 강의의 ${alarm.commonDetailVO.comdDesc}</span> 
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 강의개설알림
  "ALAM12": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px; font-weight:600;">${alarm.ntfCon}</span><span style="font-size:14px; color:#888888;"> ${alarm.commonDetailVO.comdDesc}</span> 
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 성적이의신청알림
  "ALAM13": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px; font-weight:600;">${alarm.senderVO.userNm}</span><span style="font-size:14px; color:#888888;">님의 </span> 
            <span style="font-size:14px;">${alarm.commonDetailVO.comdDesc}</span></a>
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 학적변동신청알림
  "ALAM14": function(alarm) {
    return `
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <a href="#none" onclick="checkAlarm('${alarm.ntfCd}', '${alarm.ntfUrl}')"><span style="font-size:14px; font-weight:600;">${alarm.senderVO.userNm}</span><span style="font-size:14px; color:#888888;">님의 </span> 
            <span style="font-size:14px;">${alarm.commonDetailVO.comdDesc}</span></a>
          </div>
          <div style="font-size:13px; color:#888888; margin-top:5px;">${getPatternAlarm(alarm.ntfReg)}</div>
        </div>
      </li>
    `
  },
  // 학적변동승인알림
  "ALAM15": function(alarm) {
    
  },
  // 학적변동반려알림
  "ALAM16": function(alarm) {
    
  }
};

function allAlarm() {
  $("#notificationList").html("");
  $("#portletalarm11").html("");
  alarmList
  .forEach(alarm => {
    $("#notificationList").append(functionMap[alarm.comdCd](alarm));
    $("#portletalarm11").append(functionMap[alarm.comdCd](alarm));
  })
  $("#cntAll").text(`(${alarmList.length})`);
}

function mailAlarm() {
  $("#notificationList").html("");
  
  alarmList
  .filter(alarm => ["ALAM03"].includes(alarm.comdCd))
  .forEach(alarm => {
    $("#notificationList").append(functionMap[alarm.comdCd](alarm));
  });
  if ($("#notificationList").children().length == 0) {
    $("#notificationList").append(`
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <span style="font-size:14px;">알림이 없습니다.</span></a>
          </div>
        </div>
      </li>
    `)
  }
}
  
function academicAlarm() {
  $("#notificationList").html("");
  $("#portletalarm21").html("");
  alarmList
  .filter(alarm => ["ALAM01", "ALAM06", "ALAM07", "ALAM11", "ALAM12", "ALAM13"].includes(alarm.comdCd)) 
  .forEach(alarm => {
    $("#notificationList").append(functionMap[alarm.comdCd](alarm))
    $("#portletalarm21").append(functionMap[alarm.comdCd](alarm));
  });
  if ($("#portletalarm21").children().length == 0) {
    $("#portletalarm21").append(`
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <span style="font-size:14px;">알림이 없습니다.</span></a>
          </div>
        </div>
      </li>
    `)
    $("#notificationList").append(`
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <span style="font-size:14px;">알림이 없습니다.</span></a>
          </div>
        </div>
      </li>
    `)
  }
}
  
function commentAlarm() {
  $("#notificationList").html("");
  $("#portletalarm51").html("");
alarmList
  .filter(alarm => ["ALAM04", "ALAM05"].includes(alarm.comdCd))
  .forEach(alarm => {
    $("#notificationList").append(functionMap[alarm.comdCd](alarm));
    $("#portletalarm51").append(functionMap[alarm.comdCd](alarm));
  });
  if ($("#portletalarm51").children().length == 0) {
    $("#portletalarm51").append(`
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <span style="font-size:14px;">알림이 없습니다.</span></a>
          </div>
        </div>
      </li>
    `)
    $("#notificationList").append(`
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <span style="font-size:14px;">알림이 없습니다.</span></a>
          </div>
        </div>
      </li>
    `)
  }
}

function recordAlarm() {
  $("#notificationList").html("");
  $("#portletalarm31").html("");
  alarmList
    .filter(alarm => ["ALAM14", "ALAM15", "ALAM16"].includes(alarm.comdCd))
    .forEach(alarm => {
      $("#notificationList").append(functionMap[alarm.comdCd](alarm));
      $("#portletalarm31").append(functionMap[alarm.comdCd](alarm));
  });
  if ($("#portletalarm31").children().length == 0) {
    $("#portletalarm31").append(`
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <span style="font-size:14px;">알림이 없습니다.</span></a>
          </div>
        </div>
      </li>
    `)
    $("#notificationList").append(`
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <span style="font-size:14px;">알림이 없습니다.</span></a>
          </div>
        </div>
      </li>
    `)
  }
}

function counselAlarm() {
  $("#portletalarm41").html("");
  $("#notificationList").html("");
  alarmList
    .filter(alarm => ["ALAM02", "ALAM09", "ALAM10"].includes(alarm.comdCd))
    .forEach(alarm => {
      $("#notificationList").append(functionMap[alarm.comdCd](alarm))
      $("#portletalarm41").append(functionMap[alarm.comdCd](alarm));
    });
  if ($("#portletalarm41").children().length == 0) {
    $("#portletalarm41").append(`
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <span style="font-size:14px;">알림이 없습니다.</span></a>
          </div>
        </div>
      </li>
    `)
    $("#notificationList").append(`
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <span style="font-size:14px;">알림이 없습니다.</span></a>
          </div>
        </div>
      </li>
    `)
  }
}

function etcAlarm() {
  $("#notificationList").html("");
  $("#portletalarm61").html("");
  alarmList
    .filter(alarm => ["ALAM08"].includes(alarm.comdCd))
    .forEach(alarm => {
      $("#notificationList").append(functionMap[alarm.comdCd](alarm));
      $("#portletalarm61").append(functionMap[alarm.comdCd](alarm));
    });
  if ($("#portletalarm61").children().length == 0) {
    $("#portletalarm61").append(`
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <span style="font-size:14px;">알림이 없습니다.</span></a>
          </div>
        </div>
      </li>
    `)
    $("#notificationList").append(`
      <li class="d-flex">
        <div style="padding:10px;">
          <div>
            <span style="font-size:14px;">알림이 없습니다.</span></a>
          </div>
        </div>
      </li>
    `)
  }
}


$(".alarm_btn, #allAlarm, #alarmAll").on("click", function() {
  console.log("되지?");
  allAlarm();
});

$("#mailAlarm").on("click", function() {
  console.log("되지?");
  mailAlarm();
});

$("#academicAlarm, #alarmAcademic").on("click", function() {
  console.log("되지?");
  academicAlarm();
});

$("#commentAlarm, #alarmComment").on("click", function() {
  console.log("되지?");
  commentAlarm();
});

$("#recordAlarm, #alarmRecord").on("click", function() {
  console.log("되지?");
  recordAlarm();
})

$("#counselAlarm, #alarmCounsel").on("click", function() {
  console.log("되지?");
  counselAlarm();
})

$("#etcAlarm, #alarmEtc").on("click", function() {
  console.log("되지?");
  etcAlarm();
});


function getPatternAlarm(dateNo) {
  const date = new Date(dateNo);
  return `${date.getFullYear()}-${(date.getMonth() + 1).toString().padStart(2, '0')}-${date.getDate().toString().padStart(2, '0')} ${date.getHours().toString().padStart(2,'0')}:${date.getMinutes().toString().padStart(2,'0')}`;
}

function checkAlarm(ntfCd, url) {
  
  console.log(ntfCd, url);
  
  $.ajax({
    url: "/notification/check?ntfCd="+ntfCd,
    type: "get",
    success: res => {
      if (res == 1 && url != undefined) location.href=url;
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
  if (message.startsWith("[")) {
    message = JSON.parse(message);
    message.forEach(sender => {
      socket.send(sender)
    });
  } else {
    socket.send(message);
  }
};

function sendEnrolmentToServer(message) {
  socket.send(message);
};


$(function() {
  setTimeout(function() {
    allAlarm();
  }, 150);
})